import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/course.dart';
import '../models/lesson.dart';
import '../models/quiz.dart';

class DataService {
  static final DataService _instance = DataService._internal();
  factory DataService() => _instance;
  DataService._internal();

  List<Course>? _courses;
  List<Lesson>? _lessons;
  List<Quiz>? _quizzes;

  Future<List<Course>> getCourses() async {
    if (_courses != null) return _courses!;
    
    final String jsonString = await rootBundle.loadString('assets/data/course_list.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    _courses = jsonList.map((json) => Course.fromJson(json)).toList();
    return _courses!;
  }

  Future<Course?> getCourseById(String courseId) async {
    final courses = await getCourses();
    try {
      return courses.firstWhere((course) => course.id == courseId);
    } catch (e) {
      return null;
    }
  }

  Future<List<Lesson>> getLessons() async {
    if (_lessons != null) return _lessons!;
    
    final String jsonString = await rootBundle.loadString('assets/data/lesson_list.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    _lessons = jsonList.map((json) => Lesson.fromJson(json)).toList();
    return _lessons!;
  }

  Future<List<Lesson>> getLessonsByCourseId(String courseId) async {
    final lessons = await getLessons();
    return lessons.where((lesson) => lesson.courseId == courseId).toList()
      ..sort((a, b) => a.order.compareTo(b.order));
  }

  Future<Lesson?> getLessonById(String lessonId) async {
    final lessons = await getLessons();
    try {
      return lessons.firstWhere((lesson) => lesson.id == lessonId);
    } catch (e) {
      return null;
    }
  }

  Future<List<Quiz>> getQuizzes() async {
    if (_quizzes != null) return _quizzes!;
    
    final String jsonString = await rootBundle.loadString('assets/data/quiz_data.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    _quizzes = jsonList.map((json) => Quiz.fromJson(json)).toList();
    return _quizzes!;
  }

  Future<Quiz?> getQuizByCourseId(String courseId) async {
    final quizzes = await getQuizzes();
    try {
      return quizzes.firstWhere((quiz) => quiz.courseId == courseId);
    } catch (e) {
      return null;
    }
  }

  Future<List<Course>> searchCourses(String query) async {
    final courses = await getCourses();
    final lowerQuery = query.toLowerCase();
    return courses.where((course) {
      return course.title.toLowerCase().contains(lowerQuery) ||
          course.titleKh.contains(query) ||
          course.description.toLowerCase().contains(lowerQuery) ||
          course.category.toLowerCase().contains(lowerQuery);
    }).toList();
  }
}
