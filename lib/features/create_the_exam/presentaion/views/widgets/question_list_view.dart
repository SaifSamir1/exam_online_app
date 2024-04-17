

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/views/widgets/question_list_view_item.dart';

import '../../manger/question_cubit.dart';

class QuestionsListView extends StatelessWidget {
  const QuestionsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        return SliverList.builder(
          itemCount: BlocProvider.of<QuestionCubit>(context).questionsNumber,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10,left: 10,bottom: 10.0),
              child: QuestionsListViewItem(
                index: index,
              ),
            );
          },
        );
      },
    );
  }
}
