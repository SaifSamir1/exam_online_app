
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/features/authintication/data/repo/exam_results_repo_impl.dart';
import 'package:online_exam_app/features/authintication/presentaion/views/widgets/view_exam_result_body.dart';

import '../manger/view_exam_results_cubit/view_exam_results_cubit.dart';

class ViewExamResults extends StatelessWidget {
  const ViewExamResults({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => ViewExamResultsCubit(ExamResultsRepoImpl()),
        child: const ViewExamResultsBody(),
      ),
    );
  }
}



