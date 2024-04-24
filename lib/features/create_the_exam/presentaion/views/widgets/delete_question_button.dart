
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_text_button.dart';
import '../../manger/question_cubit/question_cubit.dart';

class DeleteQuestionButton extends StatelessWidget {
  const DeleteQuestionButton({
    super.key, required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: CustomTextButton(
        function: (){
          BlocProvider.of<QuestionCubit>(context).removeQuestionFromList(index);
        },
        text: 'Delete',
      ),
    );
  }
}
