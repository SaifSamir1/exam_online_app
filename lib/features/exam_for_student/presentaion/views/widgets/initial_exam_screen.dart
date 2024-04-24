import 'package:flutter/cupertino.dart';
import 'package:online_exam_app/features/exam_for_student/presentaion/views/exam_for_student_screen.dart';
import '../../../../authintication/data/models/student_details_model.dart';


class InitialExamScreen extends StatelessWidget {
  const InitialExamScreen({super.key, required this.studentDetailsModel});

  final StudentDetailsModel studentDetailsModel;
  @override
  Widget build(BuildContext context) {
    int examTime = int.parse(studentDetailsModel.examDetails.examTime);
    return ExamScreen(
        examTime: examTime,
        studentDetailsModel: studentDetailsModel);
  }
}
