import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/manger/question_cubit/question_cubit.dart';

import '../../../../../core/utils/constant.dart';

List<TextEditingController> c = [TextEditingController()];
class TheQuestion extends StatelessWidget {
  const TheQuestion({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: BlocProvider.of<QuestionCubit>(context).allQuestionsController[index],
      cursorColor: defaultColor,
      decoration: InputDecoration(
        hintText: 'Question ${index + 1}',
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
