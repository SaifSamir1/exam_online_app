

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import 'grade_text_field.dart';

class SubmitTheExam extends StatelessWidget {
  const SubmitTheExam({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Don\'t forget the exam code : 9849849',
              style: AppStyles.styleSemiBold18(context),
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                Text(
                  'Exam time in minutes : ',
                  style: AppStyles.styleSemiBold18(context),
                ),
                const GradeOrTimeTextField(hintText: 'Time',),
              ],
            ),
            const SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: CustomTextButton(
                text: 'Create',
                function: ()
                {

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
