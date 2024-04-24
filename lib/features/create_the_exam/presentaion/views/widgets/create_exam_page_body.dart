
import 'package:flutter/material.dart';
import 'package:online_exam_app/features/authintication/data/models/initial_exam_details.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/views/widgets/question_list_view.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/views/widgets/submit_the_exam.dart';
import 'add_question.dart';

class CreateExamPageBody extends StatelessWidget {
  const CreateExamPageBody({super.key, required this.initialExamDetails});

  final InitialExamDetails initialExamDetails;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const QuestionsListView(),
        const AddQuestionButton(),
        SubmitTheExam(initialExamDetails: initialExamDetails,),
      ],
    );
  }
}

