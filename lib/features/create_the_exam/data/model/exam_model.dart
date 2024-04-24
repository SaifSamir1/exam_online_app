


class ExamDetails {
  final String examName;
  final String examTime;
  final String examCode;

  ExamDetails({required this.examName, required this.examTime, required this.examCode});

  /// Converts the ExamDetails object to a JSON string.
  Map<String, dynamic> toJson() => {
    'examName': examName,
    'examTime': examTime,
    'examCode': examCode,
  };

  /// Creates an ExamDetails object from a JSON string.
  factory ExamDetails.fromJson(Map<String, dynamic> json) {
    return ExamDetails(
      examName: json['examName'] as String,
      examTime: json['examTime'] as String,
      examCode: json['examCode'] as String,
    );
  }
}
