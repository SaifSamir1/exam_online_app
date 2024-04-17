

import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';

class TheQuestion extends StatelessWidget {
  const TheQuestion({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: defaultColor,
      decoration: InputDecoration(
        hintText: 'Question ${index + 1}',
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      onChanged: (value) {

      },
    );
  }
}
