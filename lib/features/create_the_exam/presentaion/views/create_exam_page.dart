import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/utils/app_style.dart';
import 'package:online_exam_app/features/create_the_exam/data/create_exam_repo/repo_implementation.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/manger/question_cubit/question_cubit.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/manger/store_exam_cubit/store_exam_cubit.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/views/widgets/create_exam_page_body.dart';

import '../../../../core/utils/constant.dart';
import '../../../authintication/data/models/initial_exam_details.dart';

class CreateExamPage extends StatelessWidget {
  const CreateExamPage({super.key, required this.initialExamDetails,});
  final InitialExamDetails initialExamDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: defaultColor,
          onPressed: (){
            GoRouter.of(context).pop();
          },
        ),
        title: Text(
          'Create The Exam',
          style: AppStyles.styleSemiBold24(context),
        ),
      ),
      body:
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => QuestionCubit(),),
              BlocProvider(create: (context) => StoreExamCubit(CreateExamRepoImpl()),),
            ], child: CreateExamPageBody(
            initialExamDetails: initialExamDetails,
          ),
          ),
    );
  }
}



