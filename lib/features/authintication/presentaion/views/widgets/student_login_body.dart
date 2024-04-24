import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/utils/app_router.dart';
import 'package:online_exam_app/features/authintication/data/models/student_details_model.dart';
import 'package:online_exam_app/features/authintication/presentaion/views/widgets/text_form_fields.dart';

import '../../../../../core/error/error.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../exam_for_student/data/repo/student_exam_repo_impl.dart';
import '../../../../exam_for_student/presentaion/manger/doing_exam_cubit/doing_exam_cubit.dart';

class StudentLoginBody extends StatefulWidget {
  const StudentLoginBody({super.key});

  @override
  State<StudentLoginBody> createState() => _StudentLoginBodyState();
}

class _StudentLoginBodyState extends State<StudentLoginBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    nameController.dispose();
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => GetExamCubit(StudentExamRepoImpl()),
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15.0, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Login to Exam',
                style: AppStyles.styleBold40(context),
              ),
              StudentTextFormFields(
                formKey: formKey,
                  nameController: nameController,
                  codeController: codeController),
              Align(
                alignment: AlignmentDirectional.center,
                child: BlocConsumer<GetExamCubit, GetExamState>(
                  listener: (context, state) {
                    if (state is GetExamDetailsError) {
                      showFlutterToastError(
                          'There is no exam available with this code , please try correct code ');
                      log(state.mssError);
                    }
                    if (state is GetExamDetailsSuccess)
                      {
                        StudentDetailsModel student = StudentDetailsModel(
                          name: nameController.text,
                          examDetails: state.examDetails,
                        );
                        GoRouter.of(context).pushReplacement(AppRouter.kInitialExamScreen,extra: student);
                      }
                  },
                  builder: (context,state)
                  {
                    return CustomTextButton(
                      text:state is GetExamDetailsLoading ? 'Loading...' : 'Go to Exam' ,
                      function: () {
                        if(nameController.text.isEmpty){
                          showFlutterToastError('Student name must not be empty');
                        }
                        else if(codeController.text.isEmpty){
                          showFlutterToastError('Exam code must not be empty');
                        }
                        else{
                          BlocProvider.of<GetExamCubit>(context)
                              .getExamDetails(examCode: codeController.text);
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
