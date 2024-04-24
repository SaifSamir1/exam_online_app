
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../authintication/data/models/initial_exam_details.dart';
import '../../../data/model/exam_model.dart';
import '../../manger/question_cubit/question_cubit.dart';
import '../../manger/store_exam_cubit/store_exam_cubit.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.initialExamDetails,
  });

  final InitialExamDetails initialExamDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: BlocConsumer<StoreExamCubit, StoreExamState>(
        listener: (context, state) {
          if (state is SetExamQuestionsSuccess) {
            GoRouter.of(context).pushReplacement(
                AppRouter.kExamCreatedSuccessfully);
          }
          if (state is CreateExamSuccess)
          {
            BlocProvider.of<StoreExamCubit>(context)
                .setExamQuestions(
                questions: BlocProvider.of<QuestionCubit>(
                    context)
                    .allQuestionsModel,
                examCode: initialExamDetails.examCode);
          }
        },
        builder: (context, state) {
          return CustomTextButton(
            text: state is CreateExamLoading || state is SetExamQuestionsLoading ? 'Loading....': 'Create',
            function: () {
              ExamDetails exportDetails = ExamDetails(
                examName: initialExamDetails.examName,
                examCode: initialExamDetails.examCode,
                examTime: BlocProvider.of<QuestionCubit>(context)
                    .examTimeController
                    .text,
              );
              BlocProvider.of<QuestionCubit>(context).storeQuestionsModel();
              // BlocProvider.of<QuestionCubit>(context).printListItems();
              BlocProvider.of<StoreExamCubit>(context)
                  .createExam(examDetails: exportDetails);
            },
          );
        },
      ),
    );
  }
}
