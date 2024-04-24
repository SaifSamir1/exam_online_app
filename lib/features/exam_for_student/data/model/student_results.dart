



class StudentResults {
  final String studentName;
  final String studentGrade;

  StudentResults({required this.studentName, required this.studentGrade});

  Map<String, dynamic> toJson() => {
    'studentName': studentName,
    'studentGrade': studentGrade,
  };

  factory StudentResults.fromJson(Map<String, dynamic> json) {
    return StudentResults(
      studentName: json['studentName'] as String,
      studentGrade: json['studentGrade'] as String,
    );
  }
}
