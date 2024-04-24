import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/utils/app_router.dart';

import '../../../../../core/widgets/custom_text_button.dart';

class SplashPageBody extends StatelessWidget {
  const SplashPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/splash.png",
            width: MediaQuery.sizeOf(context).width * .9,
          ),
          const SizedBox(
            height: 40,
          ),
          CustomTextButton(
            text: 'Student',
            function: () {
              GoRouter.of(context).push(AppRouter.kStudentAuth);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextButton(
            text: 'Teacher',
            function: () {
              GoRouter.of(context).push(AppRouter.kTeacherAuth);
            },
          ),
        ],
      ),
    );
  }
}
