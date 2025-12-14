class Question {
  final String id;
  final String question;
  final String questionKh;
  final List<String> options;
  final int correctAnswer;

  Question({
    required this.id,
    required this.question,
    required this.questionKh,
    required this.options,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] ?? '',
      question: json['question'] ?? '',
      questionKh: json['questionKh'] ?? '',
      options: List<String>.from(json['options'] ?? []),
      correctAnswer: json['correctAnswer'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'questionKh': questionKh,
      'options': options,
      'correctAnswer': correctAnswer,
    };
  }
}

class Quiz {
  final String id;
  final String courseId;
  final String title;
  final String titleKh;
  final List<Question> questions;

  Quiz({
    required this.id,
    required this.courseId,
    required this.title,
    required this.titleKh,
    required this.questions,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'] ?? '',
      courseId: json['courseId'] ?? '',
      title: json['title'] ?? '',
      titleKh: json['titleKh'] ?? '',
      questions: (json['questions'] as List<dynamic>?)
              ?.map((q) => Question.fromJson(q))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'title': title,
      'titleKh': titleKh,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }
}
