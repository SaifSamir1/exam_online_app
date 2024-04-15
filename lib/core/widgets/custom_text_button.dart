

import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/app_style.dart';

import '../utils/constant.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, required this.function, this.width, this.height, this.color});

  final String text;
  final VoidCallback function;
  final double? width;
  final double? height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
       backgroundColor: MaterialStateProperty.all(color ?? defaultColor),
      ),
      onPressed: function, child: Container(
      alignment: Alignment.center,
      height: height ?? 60,
        width: width ?? 100,
        child: Text(text,style: AppStyles.styleSemiBold20(context,Colors.white)),
      ),);
  }
}
