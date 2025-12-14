import 'package:flutter/foundation.dart';
import '../models/course.dart';
import '../models/lesson.dart';
import '../models/quiz.dart';
import '../services/data_service.dart';

class CourseProvider with ChangeNotifier {
  final DataService _dataService = DataService();

  List<Course> _courses = [];
  List<Lesson> _lessons = [];
  Course? _selectedCourse;
  List<Lesson> _selectedCourseLessons = [];
  Quiz? _selectedCourseQuiz;
  bool _isLoading = false;
  String _searchQuery = '';

  List<Course> get courses => _searchQuery.isEmpty 
      ? _courses 
      : _courses.where((course) {
          final query = _searchQuery.toLowerCase();
          return course.title.toLowerCase().contains(query) ||
              course.titleKh.contains(_searchQuery) ||
              course.category.toLowerCase().contains(query);
        }).toList();

  List<Lesson> get lessons => _lessons;
  Course? get selectedCourse => _selectedCourse;
  List<Lesson> get selectedCourseLessons => _selectedCourseLessons;
  Quiz? get selectedCourseQuiz => _selectedCourseQuiz;
  bool get isLoading => _isLoading;
  String get searchQuery => _searchQuery;

  Future<void> loadCourses() async {
    _isLoading = true;
    notifyListeners();

    try {
      _courses = await _dataService.getCourses();
      _lessons = await _dataService.getLessons();
    } catch (e) {
      debugPrint('Error loading courses: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> selectCourse(String courseId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _selectedCourse = await _dataService.getCourseById(courseId);
      _selectedCourseLessons = await _dataService.getLessonsByCourseId(courseId);
      _selectedCourseQuiz = await _dataService.getQuizByCourseId(courseId);
    } catch (e) {
      debugPrint('Error selecting course: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  void clearSelectedCourse() {
    _selectedCourse = null;
    _selectedCourseLessons = [];
    _selectedCourseQuiz = null;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    notifyListeners();
  }

  List<Course> getCoursesByCategory(String category) {
    return _courses.where((course) => course.category == category).toList();
  }

  List<String> get categories {
    return _courses.map((course) => course.category).toSet().toList();
  }
}
