
import 'package:flutter/material.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/views/widgets/question_list_view.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/views/widgets/submit_the_exam.dart';
import 'add_question.dart';

class CreateExamPageBody extends StatelessWidget {
  const CreateExamPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        QuestionsListView(),
        AddQuestionButton(),
        SubmitTheExam(),
      ],
    );
  }
}

