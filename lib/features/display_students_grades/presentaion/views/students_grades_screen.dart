import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/app_style.dart';
import 'package:online_exam_app/features/display_students_grades/presentaion/views/widgets/student_grade_screen_body.dart';
import 'package:online_exam_app/features/exam_for_student/data/model/student_results.dart';

class StudentsGradesScreen extends StatelessWidget {
  const StudentsGradesScreen({super.key, required this.studentsResults});
  final List<StudentResults> studentsResults;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The Grades',
          style: AppStyles.styleSemiBold24(context),
        ),
      ),
      body: StudentsGradesScreenBody(
        studentsResults: studentsResults,
      ),
    );
  }
}

