class QuestionModel {
  final int id;
  final int grade;
  final String question;
  final List<String> options;
  final String questionType;
  final String correctAnswer;

  QuestionModel({
    required this.id,
    required this.grade,
    required this.question,
    required this.options,
    required this.questionType,
    required this.correctAnswer,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'] as int,
      grade: json['grade'] as int,
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>).cast<String>(),
      questionType: json['questionType'] as String,
      correctAnswer: json['correctAnswer'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'grade': grade,
    'question': question,
    'options': options,
    'questionType': questionType,
    'correctAnswer': correctAnswer,
  };
}
