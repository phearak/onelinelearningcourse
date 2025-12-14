class UserProgress {
  final String oderId;
  final Map<String, List<String>> completedLessons; // courseId -> list of lessonIds
  final Map<String, int> quizScores; // quizId -> score
  final Map<String, String> lastWatchedLesson; // courseId -> lessonId
  final Map<String, int> lastVideoPosition; // lessonId -> position in seconds

  UserProgress({
    required this.oderId,
    required this.completedLessons,
    required this.quizScores,
    required this.lastWatchedLesson,
    required this.lastVideoPosition,
  });

  factory UserProgress.empty() {
    return UserProgress(
      oderId: 'default_user',
      completedLessons: {},
      quizScores: {},
      lastWatchedLesson: {},
      lastVideoPosition: {},
    );
  }

  factory UserProgress.fromJson(Map<String, dynamic> json) {
    return UserProgress(
      oderId: json['userId'] ?? 'default_user',
      completedLessons: (json['completedLessons'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(key, List<String>.from(value)),
          ) ??
          {},
      quizScores: Map<String, int>.from(json['quizScores'] ?? {}),
      lastWatchedLesson: Map<String, String>.from(json['lastWatchedLesson'] ?? {}),
      lastVideoPosition: Map<String, int>.from(json['lastVideoPosition'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': oderId,
      'completedLessons': completedLessons,
      'quizScores': quizScores,
      'lastWatchedLesson': lastWatchedLesson,
      'lastVideoPosition': lastVideoPosition,
    };
  }

  UserProgress copyWith({
    String? userId,
    Map<String, List<String>>? completedLessons,
    Map<String, int>? quizScores,
    Map<String, String>? lastWatchedLesson,
    Map<String, int>? lastVideoPosition,
  }) {
    return UserProgress(
      oderId: userId ?? oderId,
      completedLessons: completedLessons ?? this.completedLessons,
      quizScores: quizScores ?? this.quizScores,
      lastWatchedLesson: lastWatchedLesson ?? this.lastWatchedLesson,
      lastVideoPosition: lastVideoPosition ?? this.lastVideoPosition,
    );
  }

  double getCourseProgress(String courseId, int totalLessons) {
    if (totalLessons == 0) return 0.0;
    final completed = completedLessons[courseId]?.length ?? 0;
    return completed / totalLessons;
  }

  bool isLessonCompleted(String courseId, String lessonId) {
    return completedLessons[courseId]?.contains(lessonId) ?? false;
  }
}
