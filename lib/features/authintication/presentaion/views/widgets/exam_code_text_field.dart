

import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_field.dart';

class ExamCodeTextFormField extends StatelessWidget {
  const ExamCodeTextFormField({
    super.key,
    required this.codeController, required this.formKey,
  });

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
