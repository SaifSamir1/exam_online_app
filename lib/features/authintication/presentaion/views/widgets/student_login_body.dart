


import 'package:flutter/material.dart';
import 'package:online_exam_app/features/authintication/presentaion/views/widgets/text_form_fields.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_text_button.dart';

class StudentLoginBody extends StatefulWidget {
  const StudentLoginBody({super.key});

  @override
  State<StudentLoginBody> createState() => _StudentLoginBodyState();
}

class _StudentLoginBodyState extends State<StudentLoginBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    codeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 30 ,left: 15.0,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Login to Exam',style: AppStyles.styleBold40(context),),
            StudentTextFormFields(nameController: nameController, codeController: codeController),
            Align(
                alignment: AlignmentDirectional.center,
                child: CustomTextButton(text: 'Go to Exam', function: (){})),
          ],
        ),
      ),
    );
  }
}

