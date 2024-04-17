

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/manger/question_cubit.dart';
import 'delete_question_button.dart';
import 'grade_text_field.dart';

class GradeAndDeleteButtonSection extends StatelessWidget {
  const GradeAndDeleteButtonSection({
    super.key, required this.index,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocProvider.of<QuestionCubit>(context).questionsNumber! > 1 ?
            DeleteQuestionButton(
              index: index,
            ) : const Spacer(),
            const GradeOrTimeTextField(hintText: 'Grade',),
          ],
        ),
      ),
    );
  }
}
