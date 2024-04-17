


import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constant.dart';
import '../../manger/question_cubit.dart';

class SelectDayDropDownButton extends StatelessWidget {
  const SelectDayDropDownButton({
    super.key, required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: DropdownButton(
            dropdownColor: Colors.black26,
            hint: const Text(
              'Que type',
              style: TextStyle(color: defaultColor),
            ),
            style: const TextStyle(color: defaultColor),
            items: [
              'MCQ',
              'T or F ',
            ]
                .map(
                  (e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
                .toList(),
            onChanged: (String? value) {

              BlocProvider.of<QuestionCubit>(context)
                  .changeDropdownButton( value , index);
              log(BlocProvider.of<QuestionCubit>(context).questionsType[index]);

            },
            value: BlocProvider.of<QuestionCubit>(context).questionsType[index],
          ),
        );
      },
    );
  }
}