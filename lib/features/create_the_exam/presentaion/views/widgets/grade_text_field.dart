
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/manger/question_cubit/question_cubit.dart';
import '../../../../../core/utils/constant.dart';

class GradeTextField extends StatelessWidget {
  const GradeTextField({
    super.key, required this.questionIndex,

  });
  final int questionIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(15)
      ),
      width: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: TextFormField(
          controller:BlocProvider.of<QuestionCubit>(context).allGradesControllers[questionIndex] ,
          keyboardType: TextInputType.number,
          cursorColor: defaultColor,
          decoration: InputDecoration(
              hintText: 'Grade',
              border: InputBorder.none,
            hintStyle: TextStyle(
              color: defaultColor.withOpacity(.7),
            )
          ),
        ),
      ),
    );
  }
}
