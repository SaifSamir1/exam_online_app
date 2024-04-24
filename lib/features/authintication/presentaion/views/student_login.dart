

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/features/authintication/presentaion/views/widgets/student_login_body.dart';

import '../../../../core/utils/constant.dart';

class StudentLogin extends StatelessWidget {
  const StudentLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            GoRouter.of(context).pop();
          },
          color: defaultColor,
        ),
      ),
      body: const StudentLoginBody(),
    );
  }
}
