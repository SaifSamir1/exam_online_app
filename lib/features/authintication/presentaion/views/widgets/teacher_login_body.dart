
import 'package:flutter/material.dart';
import 'package:online_exam_app/features/authintication/presentaion/views/widgets/see_student_grades.dart';
import 'package:online_exam_app/features/authintication/presentaion/views/widgets/teacher_text_form_fields.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_text_button.dart';

class TeacherLoginBody extends StatefulWidget {
  const TeacherLoginBody({super.key});

  @override
  State<TeacherLoginBody> createState() => _StudentLoginBodyState();
}

class _StudentLoginBodyState extends State<TeacherLoginBody> {
  TextEditingController subjectNameController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  @override
  void dispose() {
    subjectNameController.dispose();
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15.0, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Create Exam',
              style: AppStyles.styleBold40(context),
            ),
            TeacherTextFormFields(
                subjectNameController: subjectNameController,
                codeController: codeController),
            Align(
              alignment: AlignmentDirectional.center,
              child: CustomTextButton(
                text: 'Create Exam Question',
                function: () {},
                width: 170,
              ),
            ),
            const SeeStudentsGrades(),
          ],
        ),
      ),
    );
  }
}


