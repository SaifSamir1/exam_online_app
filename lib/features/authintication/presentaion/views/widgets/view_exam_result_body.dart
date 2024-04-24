import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/error/error.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../manger/view_exam_results_cubit/view_exam_results_cubit.dart';
import 'exam_code_text_field.dart';

class ViewExamResultsBody extends StatefulWidget {
  const ViewExamResultsBody({super.key});

  @override
  State<ViewExamResultsBody> createState() => _ViewExamResultsBodyState();
}

class _ViewExamResultsBodyState extends State<ViewExamResultsBody> {
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15.0, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * .2,),
            Text(
              'Get Exam Results',
              style: AppStyles.styleBold40(context),
            ),
            ExamCodeTextFormField(
                formKey: formKey,
                codeController: codeController),
            Align(
              alignment: AlignmentDirectional.center,
              child: BlocConsumer<ViewExamResultsCubit, ViewExamResultsState>(
                listener: (context, state) {
                  if (state is GetExamResultsError) {
                    showFlutterToastError(
                        'There is no exam available with this code , please try correct code ');
                    log(state.errorMessage);
                  }
                  if (state is GetExamResultsSuccess) {
                    GoRouter.of(context).push(AppRouter.kStudentsGradesScreen,
                        extra: state.studentResults);
                  }
                },
                builder: (context, state) {
                  return CustomTextButton(
                    text: state is GetExamResultsLoading
                        ? 'Loading...'
                        : 'Go to Results',
                    function: () {
                      if(codeController.text.isEmpty)
                        {
                          showFlutterToastError('Exam code must not be empty');
                        }else{
                        BlocProvider.of<ViewExamResultsCubit>(context)
                            .getExamResults(examCode: codeController.text);
                        codeController.clear();
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
