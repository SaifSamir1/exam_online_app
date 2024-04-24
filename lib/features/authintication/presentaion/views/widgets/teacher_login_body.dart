import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/utils/app_router.dart';
import 'package:online_exam_app/features/authintication/data/models/initial_exam_details.dart';
import 'package:online_exam_app/features/authintication/presentaion/views/widgets/see_student_grades.dart';
import 'package:online_exam_app/features/authintication/presentaion/views/widgets/teacher_text_form_fields.dart';
import '../../../../../core/error/error.dart';
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
  GlobalKey<FormState> formKey = GlobalKey();

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
              formKey: formKey,
                subjectNameController: subjectNameController,
                codeController: codeController),
            Align(
              alignment: AlignmentDirectional.center,
              child: CustomTextButton(
                text: 'Create Exam Question',
                function: () {
                  if(codeController.text.isEmpty)
                    {
                      showFlutterToastError('Exam code must not be empty');
                    }
                  else if (subjectNameController.text.isEmpty)
                    {
                      showFlutterToastError('Subject Name must not be empty');
                    }else{
                    InitialExamDetails initialExamDetails =  InitialExamDetails(
                      examName:subjectNameController.text ,
                      examCode: codeController.text,
                    );
                    GoRouter.of(context).push(AppRouter.kCreateExamPage,
                      extra: initialExamDetails,);
                  }
                },
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
