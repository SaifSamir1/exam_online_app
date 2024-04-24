

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/create_the_exam/data/create_exam_repo/repo.dart';
import 'package:online_exam_app/features/create_the_exam/data/model/exam_model.dart';
import 'package:online_exam_app/features/create_the_exam/data/model/question_model.dart';

part 'store_exam_state.dart';

class StoreExamCubit extends Cubit<StoreExamState> {
  StoreExamCubit(this.createExamRepo) : super(StoreExamInitial());
  CreateExamRepo createExamRepo;

  Future<void> createExam(
      {required ExamDetails examDetails,
      }) async {
    emit(CreateExamLoading());
    var result = await createExamRepo.createExam(
      examDetails: examDetails,
    );
    result.fold((error) {
      emit(CreateExamError(error: error.toString()));
    }, (success) {
      emit(CreateExamSuccess());
    });
  }

  Future<void> setExamQuestions(
      {required List<QuestionModel> questions,
        required String examCode,
      }) async {
    emit(SetExamQuestionsLoading());
    var result = await createExamRepo.setExamQuestions(
      examCode: examCode,
      questions: questions,
    );
    result.fold((error) {
      log(error.toString());
      emit(SetExamQuestionsError(error: error.toString()));
    }, (success) {
      log(success);
      emit(SetExamQuestionsSuccess());
    });
  }

}
