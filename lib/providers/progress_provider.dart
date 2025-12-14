import 'package:flutter/foundation.dart';
import '../models/user_progress.dart';
import '../services/storage_service.dart';

class ProgressProvider with ChangeNotifier {
  final StorageService _storageService = StorageService();

  UserProgress _progress = UserProgress.empty();
  bool _isLoading = false;

  UserProgress get progress => _progress;
  bool get isLoading => _isLoading;

  Future<void> loadProgress() async {
    _isLoading = true;
    notifyListeners();

    try {
      _progress = await _storageService.getUserProgress();
    } catch (e) {
      debugPrint('Error loading progress: $e');
      _progress = UserProgress.empty();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> markLessonCompleted(String courseId, String lessonId) async {
    await _storageService.markLessonCompleted(courseId, lessonId);
    await loadProgress();
  }

  Future<void> saveLastWatchedLesson(String courseId, String lessonId) async {
    await _storageService.saveLastWatchedLesson(courseId, lessonId);
    await loadProgress();
  }

  Future<void> saveVideoPosition(String lessonId, int positionSeconds) async {
    await _storageService.saveVideoPosition(lessonId, positionSeconds);
    await loadProgress();
  }

  Future<void> saveQuizScore(String quizId, int score) async {
    await _storageService.saveQuizScore(quizId, score);
    await loadProgress();
  }

  double getCourseProgress(String courseId, int totalLessons) {
    return _progress.getCourseProgress(courseId, totalLessons);
  }

  bool isLessonCompleted(String courseId, String lessonId) {
    return _progress.isLessonCompleted(courseId, lessonId);
  }

  String? getLastWatchedLesson(String courseId) {
    return _progress.lastWatchedLesson[courseId];
  }

  int getVideoPosition(String lessonId) {
    return _progress.lastVideoPosition[lessonId] ?? 0;
  }

  int? getQuizScore(String quizId) {
    return _progress.quizScores[quizId];
  }

  int get totalCompletedLessons {
    int total = 0;
    _progress.completedLessons.forEach((_, lessons) {
      total += lessons.length;
    });
    return total;
  }

  int get totalQuizzesTaken {
    return _progress.quizScores.length;
  }

  Future<void> resetProgress() async {
    await _storageService.clearAllData();
    _progress = UserProgress.empty();
    notifyListeners();
  }
}
