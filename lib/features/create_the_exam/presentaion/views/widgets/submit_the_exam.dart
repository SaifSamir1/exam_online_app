import 'package:flutter/material.dart';
import 'package:online_exam_app/features/authintication/data/models/initial_exam_details.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/views/widgets/submit_button.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/views/widgets/time_text_field.dart';

import '../../../../../core/utils/app_style.dart';


class SubmitTheExam extends StatelessWidget {
  const SubmitTheExam({super.key, required this.initialExamDetails});
  final InitialExamDetails initialExamDetails;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: Colors.white,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.only(right: 20, top: 20, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Don\'t forget the exam code : ${initialExamDetails.examCode}',
                  style: AppStyles.styleSemiBold18(context),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      'Exam time in minutes : ',
                      style: AppStyles.styleSemiBold18(context),
                    ),
                    const TimeTextField(),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SubmitButton(initialExamDetails: initialExamDetails)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
