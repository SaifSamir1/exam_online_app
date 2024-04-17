import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/question_cubit.dart';

class QuestionOptions extends StatelessWidget {
  const QuestionOptions({
    super.key,
    required this.questionIndex,
  });

  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        return SliverList.builder(
          itemCount: BlocProvider.of<QuestionCubit>(context)
                      .questionsType[questionIndex] ==
                  'MCQ'
              ? 4
              : 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration:
                          InputDecoration(hintText: 'Option ${index + 1}'),
                      onChanged: (value) {
                        BlocProvider.of<QuestionCubit>(context).options.insert(index, value);
                        log(value.toString());
                        log(index.toString());
                        log(questionIndex.toString());
                      },
                    ),
                  ),
                  Checkbox(
                    value: BlocProvider.of<QuestionCubit>(context).checkBoxValuesForAllQuestions[questionIndex][index],
                    onChanged: (value) {
                      BlocProvider.of<QuestionCubit>(context)
                          .changeCheckBoxValue(value!, index,questionIndex);
                      // this is the correct answer
                      log(BlocProvider.of<QuestionCubit>(context).options[index]);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}


