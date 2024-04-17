
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';

class GradeOrTimeTextField extends StatelessWidget {
  const GradeOrTimeTextField({
    super.key, required this.hintText,
  });
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(15)
      ),
      width: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: TextFormField(
          keyboardType: TextInputType.number,
          cursorColor: defaultColor,
          decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
            hintStyle: TextStyle(
              color: defaultColor.withOpacity(.7),
            )
          ),
          onChanged: (value){
            log(value);
          },
        ),
      ),
    );
  }
}
