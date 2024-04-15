

import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_field.dart';

class TeacherTextFormFields extends StatelessWidget {
  const TeacherTextFormFields(
      {super.key,
        required this.subjectNameController,
        required this.codeController});

  final TextEditingController subjectNameController;
  final TextEditingController codeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .09,
        ),
        CustomTextFormField(
          hintText: 'Enter Subject Name',
          controller: subjectNameController,
          keyBoardType: TextInputType.text,
          valedate: (String? value) {
            return 'Subject Name must not be empty';
          },
        ),
        const SizedBox(
          height: 30,
        ),
        CustomTextFormField(
          hintText: 'Create Exam Code',
          controller: codeController,
          keyBoardType: TextInputType.text,
          valedate: (String? value) {
            return 'Exam Code must not be empty';
          },
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
