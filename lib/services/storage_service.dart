import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_progress.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  static const String _progressKey = 'user_progress';
  static const String _languageKey = 'app_language';
  static const String _themeKey = 'app_theme';

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // User Progress
  Future<UserProgress> getUserProgress() async {
    final prefs = _prefs ?? await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(_progressKey);
    if (jsonString == null) {
      return UserProgress.empty();
    }
    return UserProgress.fromJson(json.decode(jsonString));
  }

  Future<void> saveUserProgress(UserProgress progress) async {
    final prefs = _prefs ?? await SharedPreferences.getInstance();
    await prefs.setString(_progressKey, json.encode(progress.toJson()));
  }

  Future<void> markLessonCompleted(String courseId, String lessonId) async {
    final progress = await getUserProgress();
    final completedLessons = Map<String, List<String>>.from(progress.completedLessons);
    
    if (!completedLessons.containsKey(courseId)) {
      completedLessons[courseId] = [];
    }
    
    if (!completedLessons[courseId]!.contains(lessonId)) {
      completedLessons[courseId]!.add(lessonId);
    }
    
    final updatedProgress = progress.copyWith(completedLessons: completedLessons);
    await saveUserProgress(updatedProgress);
  }

  Future<void> saveLastWatchedLesson(String courseId, String lessonId) async {
    final progress = await getUserProgress();
    final lastWatched = Map<String, String>.from(progress.lastWatchedLesson);
    lastWatched[courseId] = lessonId;
    
    final updatedProgress = progress.copyWith(lastWatchedLesson: lastWatched);
    await saveUserProgress(updatedProgress);
  }

  Future<void> saveVideoPosition(String lessonId, int positionSeconds) async {
    final progress = await getUserProgress();
    final positions = Map<String, int>.from(progress.lastVideoPosition);
    positions[lessonId] = positionSeconds;
    
    final updatedProgress = progress.copyWith(lastVideoPosition: positions);
    await saveUserProgress(updatedProgress);
  }

  Future<void> saveQuizScore(String quizId, int score) async {
    final progress = await getUserProgress();
    final scores = Map<String, int>.from(progress.quizScores);
    scores[quizId] = score;
    
    final updatedProgress = progress.copyWith(quizScores: scores);
    await saveUserProgress(updatedProgress);
  }

  // Language Settings
  Future<String> getLanguage() async {
    final prefs = _prefs ?? await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? 'en';
  }

  Future<void> setLanguage(String language) async {
    final prefs = _prefs ?? await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, language);
  }

  // Theme Settings
  Future<bool> isDarkMode() async {
    final prefs = _prefs ?? await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false;
  }

  Future<void> setDarkMode(bool isDark) async {
    final prefs = _prefs ?? await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDark);
  }

  // Clear all data
  Future<void> clearAllData() async {
    final prefs = _prefs ?? await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
