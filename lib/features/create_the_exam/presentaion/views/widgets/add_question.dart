import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_text_button.dart';
import '../../manger/question_cubit.dart';

class AddQuestionButton extends StatelessWidget {
  const AddQuestionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: CustomTextButton(
            text: 'Add Question',
            height: 50,
            width: 100,
            function: () {
              BlocProvider.of<QuestionCubit>(context).addQuestionToList();
              BlocProvider.of<QuestionCubit>(context).questionsTypeList();
            },
          ),
        ),
      ),
    );
  }
}
