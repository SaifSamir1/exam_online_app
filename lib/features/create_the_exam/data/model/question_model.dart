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
}
