import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/utils/app_style.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/manger/question_cubit.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/views/widgets/create_exam_page_body.dart';

import '../../../../core/utils/constant.dart';

class CreateExamPage extends StatelessWidget {
  const CreateExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: defaultColor,
          onPressed: (){},
        ),
        title: Text(
          'Create The Exam',
          style: AppStyles.styleSemiBold24(context),
        ),
      ),
      body: BlocProvider(
          create: (context) => QuestionCubit(),
          child: const CreateExamPageBody()),
    );
  }
}



