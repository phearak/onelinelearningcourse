class Course {
  final String id;
  final String title;
  final String titleKh;
  final String description;
  final String descriptionKh;
  final String thumbnail;
  final String category;
  final String difficulty;
  final String duration;
  final int lessonsCount;
  final double rating;
  final String instructor;

  Course({
    required this.id,
    required this.title,
    required this.titleKh,
    required this.description,
    required this.descriptionKh,
    required this.thumbnail,
    required this.category,
    required this.difficulty,
    required this.duration,
    required this.lessonsCount,
    required this.rating,
    required this.instructor,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      titleKh: json['titleKh'] ?? '',
      description: json['description'] ?? '',
      descriptionKh: json['descriptionKh'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      category: json['category'] ?? '',
      difficulty: json['difficulty'] ?? '',
      duration: json['duration'] ?? '',
      lessonsCount: json['lessonsCount'] ?? 0,
      rating: (json['rating'] ?? 0).toDouble(),
      instructor: json['instructor'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'titleKh': titleKh,
      'description': description,
      'descriptionKh': descriptionKh,
      'thumbnail': thumbnail,
      'category': category,
      'difficulty': difficulty,
      'duration': duration,
      'lessonsCount': lessonsCount,
      'rating': rating,
      'instructor': instructor,
    };
  }
}
