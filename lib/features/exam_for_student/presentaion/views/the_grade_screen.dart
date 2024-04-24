import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/exam_for_student/data/repo/student_exam_repo_impl.dart';
import 'package:online_exam_app/features/exam_for_student/presentaion/manger/doing_exam_cubit/doing_exam_cubit.dart';
import 'package:online_exam_app/features/exam_for_student/presentaion/views/widgets/grade_screen_body.dart';

import '../../data/model/final_grades.dart';

class GradeScreen extends StatelessWidget {
  const GradeScreen({super.key, required this.finalGrades, });
  final FinalGrades finalGrades;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Exam Grade'),
      ),
      body: BlocProvider(
          create: (context)=> GetExamCubit(StudentExamRepoImpl()),
          child:  GradeScreenBody(
            correctGrade: finalGrades.correctGrade,
            studentGrade: finalGrades.studentGrade,
          )),
    );
  }
}

