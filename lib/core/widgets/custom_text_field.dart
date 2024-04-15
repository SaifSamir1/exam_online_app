import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/constant.dart';

import '../utils/app_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscuringCharacter,
    required this.keyBoardType,
    this.onChange,
    this.suffixIcon,
    this.suffixPressed,
    this.onFieldSubmitted,
    required this.valedate,
    this.onTap,
    this.obscureText,
  });

  final TextEditingController controller;
  final String? obscuringCharacter;
  final TextInputType keyBoardType;
  final ValueChanged<String>? onChange;
  final Widget? suffixIcon;
  final VoidCallback? suffixPressed;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String> valedate;
  final bool? obscureText;
  final GestureTapCallback? onTap;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      controller: controller,
      keyboardType: keyBoardType,
      onFieldSubmitted: onFieldSubmitted,
      validator: valedate,
      obscureText: obscureText ?? false,
      onTap: onTap,
      obscuringCharacter: obscuringCharacter ?? '.',
      decoration: InputDecoration(
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: suffixIcon!,
              )
            : null,
        hintText: hintText,
        hintStyle: AppStyles.styleSemiBold18(context),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: defaultColor,
      ),
    );
  }
}
