

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/manger/question_cubit.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/views/widgets/question_options.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/views/widgets/select_drop_down_button.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/views/widgets/the_question.dart';
import 'grade_and_delete_button_section.dart';

class QuestionsListViewItem extends StatelessWidget {
  const QuestionsListViewItem({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: BlocProvider.of<QuestionCubit>(context).questionsType[index] == 'MCQ' ? 400 : 310,
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child:TheQuestion(index: index),
              ),
              const SliverToBoxAdapter(
                child:  SizedBox(
                  height: 10,
                ),
              ),
              SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.topRight,
                  child: SelectDayDropDownButton(index: index,),),
              ),
              QuestionOptions(
                questionIndex: index,
              ),
              GradeAndDeleteButtonSection(
                index: index,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



