import 'dart:developer';

import 'package:flutter/material.dart';

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
            width: MediaQuery.sizeOf(context).width *.9,
          ),
          const SizedBox(height: 40,),
          CustomTextButton(
            text: 'Student',
            function: (){
              log('Student');
            },
          ),
          const SizedBox(height: 20,),
          CustomTextButton(
            text: 'Teacher',
            function: (){
              log('Student');
            },
          ),
        ],
      ),
    );
  }
}
