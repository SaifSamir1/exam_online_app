
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/utils/app_router.dart';
import 'package:online_exam_app/features/create_the_exam/data/model/question_model.dart';
import 'package:online_exam_app/features/exam_for_student/data/model/final_grades.dart';
import 'package:online_exam_app/features/exam_for_student/data/model/student_results.dart';
import 'package:online_exam_app/features/exam_for_student/presentaion/views/widgets/question.dart';
import '../../../../../core/error/error.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../authintication/data/models/student_details_model.dart';
import '../../manger/doing_exam_cubit/doing_exam_cubit.dart';
import 'exam_display_error.dart';

class ExamScreenBody extends StatefulWidget {
  const ExamScreenBody({
    super.key,
    required this.studentDetailsModel,
  });
  final StudentDetailsModel studentDetailsModel;
  @override
  State<ExamScreenBody> createState() => _ExamScreenBodyState();
}

class _ExamScreenBodyState extends State<ExamScreenBody> {
  @override
  void initState() {
    BlocProvider.of<GetExamCubit>(context).getQuestions(
        examCode: widget.studentDetailsModel.examDetails.examCode);
    super.initState();
  }

  List<QuestionModel> questions = [];
  @override
  Widget build(BuildContext context) {
    final getExamCubit = BlocProvider.of<GetExamCubit>(context);
    return BlocConsumer<GetExamCubit, GetExamState>(
      listener: (context, state) {
        if (state is GetQuestionsSuccess) {
          questions = state.question;
        }
        if (state is StoreStudentResultSuccess) {
          int studentGrade = getExamCubit.calculateExamGrade(
              BlocProvider.of<GetExamCubit>(context).userAnswers,
              getExamCubit.correctAnswers);
          int correctGrade = getExamCubit.calculateCorrectGrades(
              BlocProvider.of<GetExamCubit>(context).correctAnswers);
          FinalGrades finalGrades = FinalGrades(
              studentGrade: studentGrade, correctGrade: correctGrade);
          GoRouter.of(context)
              .pushReplacement(AppRouter.kGradeScreen, extra: finalGrades);
        }
      },
      builder: (context, state) {
        if (state is GetQuestionsError) {
          return const ExamDisplayError();
        }
        if (state is GetQuestionsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: questions[getExamCubit.currentQuestionIndex].questionType =='MCQ'? 400 :270,
            child: Card(
              elevation: 5,
              color: Colors.white,
              child: Column(
                children: [
                  Question(
                    questions: questions,
                  ),
                  const Divider(),
                  const SizedBox(height: 16.0),
                  for (String option
                      in questions[getExamCubit.currentQuestionIndex].options)
                    if (option != '')
                      RadioListTile<String>(
                        title: Text(option),
                        value: option,
                        groupValue: getExamCubit.selectedOption,
                        onChanged: (value) =>
                            getExamCubit.optionSelection(value!),
                        selected: option == getExamCubit.selectedOption,
                        activeColor: Colors.green,
                      ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(defaultColor),
                    ),
                    onPressed: () {
                      goToNextQuestion(context);
                      if (BlocProvider.of<GetExamCubit>(context)
                              .currentQuestionIndex ==
                          getExamCubit.userAnswers.length - 1) {
                        int studentGrade = getExamCubit.calculateExamGrade(
                            BlocProvider.of<GetExamCubit>(context).userAnswers,
                            getExamCubit.correctAnswers);
                        StudentResults studentResults = StudentResults(
                            studentName: widget.studentDetailsModel.name,
                            studentGrade: '$studentGrade');
                        getExamCubit.storeStudentResult(
                            examCode:
                                widget.studentDetailsModel.examDetails.examCode,
                            studentResults: studentResults);
                      }
                    },
                    child: getExamCubit.currentQuestionIndex ==
                            questions.length - 1
                        ? const Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          )
                        : const Text(
                            'Next Question',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void goToNextQuestion(BuildContext context) {
    if (BlocProvider.of<GetExamCubit>(context).selectedOption.isNotEmpty) {
      BlocProvider.of<GetExamCubit>(context).storeStudentAnswers();
      BlocProvider.of<GetExamCubit>(context).nextQuestion(questions);
    } else {
      showFlutterToastError('please select an answer');
    }
  }
}
