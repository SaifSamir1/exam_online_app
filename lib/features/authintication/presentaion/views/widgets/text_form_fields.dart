import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_field.dart';

class StudentTextFormFields extends StatelessWidget {
  const StudentTextFormFields({
    super.key,
    required this.nameController,
    required this.codeController, required this.formKey,
  });

  final TextEditingController nameController;
  final TextEditingController codeController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * .09 ,),
          CustomTextFormField(
            hintText: 'Enter your name',
            controller: nameController,
            keyBoardType: TextInputType.text,
            valedate: (String? value) {
              return 'Student Name must not be empty';
            },
          ),
          const SizedBox(height: 30,),
          CustomTextFormField(
            hintText: 'Exam Code',
            controller: codeController,
            keyBoardType: TextInputType.text,
            valedate: (String? value) {
              return 'Exam Code must not be empty';
            },
          ),
          const SizedBox(height: 40,),
        ],
      ),
    );
  }
}
