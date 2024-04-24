import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/create_the_exam/data/model/question_model.dart';

import '../../../../../core/utils/app_style.dart';
import '../../manger/doing_exam_cubit/doing_exam_cubit.dart';

class Question extends StatelessWidget {
  const Question({
    super.key,
    required this.questions,
  });
  final List<QuestionModel> questions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          " ${BlocProvider.of<GetExamCubit>(context).currentQuestionIndex + 1} - ${questions[BlocProvider.of<GetExamCubit>(context).currentQuestionIndex].question}",
          textAlign: TextAlign.left,
          style: AppStyles.styleSemiBold22(context),
        ),
      ),
    );
  }
}
