

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/utils/app_style.dart';
import 'package:online_exam_app/core/utils/constant.dart';
import 'package:online_exam_app/core/widgets/custom_text_button.dart';

class ExamCreatedSuccessfully extends StatelessWidget {
  const ExamCreatedSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SuccessIcon(),
            const SizedBox(height: 20,),
            Text('The exam was created successfully!!!',style: AppStyles.styleSemiBold24(context),),
            const SizedBox(height: 150,),
            CustomTextButton(text: 'Finish', function: (){
              GoRouter.of(context).pushReplacement('/');
            })
          ],
        ) ,
      ),
    );
  }
}
class SuccessIcon extends StatelessWidget {
  const SuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      height: 160.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: defaultColor,
      ),
      child: const Center(
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}