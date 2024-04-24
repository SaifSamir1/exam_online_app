
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/create_the_exam/data/model/question_model.dart';
import 'package:online_exam_app/features/exam_for_student/data/model/student_results.dart';
import 'package:online_exam_app/features/exam_for_student/data/repo/student_exam_repo.dart';

import '../../../../create_the_exam/data/model/exam_model.dart';
import '../../../data/model/calculate_student_grade.dart';

part 'doing_exam_state.dart';

class GetExamCubit extends Cubit<GetExamState> {
  GetExamCubit(this.studentExamRepo) : super(GetExamInitial());

  StudentExamRepo studentExamRepo;

  int currentQuestionIndex = 0;
  String selectedOption = '';
  List<String> userAnswers= [];
  List<CalculateStudentGrade> correctAnswers = [];



  Future<void> getExamDetails(
      {required String examCode,
      }) async {
    emit(GetExamDetailsLoading());
    var result = await studentExamRepo.getExamDetails(
      examCode: examCode,
    );
    result.fold((error) {
      emit(GetExamDetailsError(mssError: error.toString()));
    }, (examDetail) {
      emit(GetExamDetailsSuccess(examDetails: examDetail));
    });
  }

  Future<void> getQuestions(
      {required String examCode,
      }) async {
    emit(GetQuestionsLoading());
    var result = await studentExamRepo.getQuestions(
      examCode: examCode,
    );
    result.fold((error) {
      emit(GetQuestionsError(mssError: error.toString()));
    }, (question) {
      for (QuestionModel q in question)
        {
          correctAnswers.add(CalculateStudentGrade(answer: q.correctAnswer, grade: q.grade));
        }
      emit(GetQuestionsSuccess(
        question: question,
      ));
    });
  }


  int calculateExamGrade(List<String> userAnswers, List<CalculateStudentGrade> correctAnswers) {
    int totalGrade = 0;
    for (int i = 0; i < userAnswers.length; i++) {
      if (userAnswers[i] == correctAnswers[i].answer) {
        totalGrade += correctAnswers[i].grade;
      }
    }
    return totalGrade;
  }

  int calculateCorrectGrades(List<CalculateStudentGrade> correctAnswers) {
    int totalCorrectAnswer = 0;
    for (int i = 0; i < correctAnswers.length; i++) {
      totalCorrectAnswer += correctAnswers[i].grade;
    }
    return totalCorrectAnswer;
  }
  Future<void> storeStudentResult({required String examCode,required StudentResults studentResults}) async{
    emit(StoreStudentResultLoading());
    var result = await studentExamRepo.storeStudentResult(
      studentResults: studentResults,
      examCode: examCode,
    );
    result.fold((error) {
      emit(StoreStudentResultError(mssError: error.toString()));
    }, (questions) {
      emit(StoreStudentResultSuccess());
    });
  }



  void optionSelection(String option) {
    selectedOption = option;
    log(selectedOption);
    emit(OptionSelection());
  }

  void storeStudentAnswers(){
    userAnswers.add(selectedOption);
    selectedOption = '';
  }


  void nextQuestion(List<QuestionModel> questions) {
    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
    }
    emit(NextQuestion());
  }

}
