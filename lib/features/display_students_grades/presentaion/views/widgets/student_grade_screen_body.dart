

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../exam_for_student/data/model/student_results.dart';

class StudentsGradesScreenBody extends StatelessWidget {
  const StudentsGradesScreenBody({super.key, required this.studentsResults});

  final List<StudentResults> studentsResults;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: studentsResults.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: Text('${index +1}-',style: AppStyles.styleSemiBold24(context),),
              trailing: Text(
                studentsResults[index].studentGrade,
                style: AppStyles.styleSemiBold24(context),
              ),
              title: Text(
                studentsResults[index].studentName,
                style: AppStyles.styleSemiBold24(context),
              ),
            ),
          );
        });
  }
}
