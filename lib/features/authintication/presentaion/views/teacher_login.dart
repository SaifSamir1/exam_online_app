import 'package:flutter/material.dart';
import 'package:online_exam_app/features/authintication/presentaion/views/widgets/teacher_login_body.dart';
import '../../../../core/utils/constant.dart';

class TeacherLogin extends StatelessWidget {
  const TeacherLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {},
          color: defaultColor,
        ),
      ),
      body: const TeacherLoginBody(),
    );
  }
}

