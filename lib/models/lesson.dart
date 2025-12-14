class Lesson {
  final String id;
  final String courseId;
  final String title;
  final String titleKh;
  final String description;
  final String youtubeVideoId;
  final String duration;
  final int order;

  Lesson({
    required this.id,
    required this.courseId,
    required this.title,
    required this.titleKh,
    required this.description,
    required this.youtubeVideoId,
    required this.duration,
    required this.order,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'] ?? '',
      courseId: json['courseId'] ?? '',
      title: json['title'] ?? '',
      titleKh: json['titleKh'] ?? '',
      description: json['description'] ?? '',
      youtubeVideoId: json['youtubeVideoId'] ?? '',
      duration: json['duration'] ?? '',
      order: json['order'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'title': title,
      'titleKh': titleKh,
      'description': description,
      'youtubeVideoId': youtubeVideoId,
      'duration': duration,
      'order': order,
    };
  }
}
