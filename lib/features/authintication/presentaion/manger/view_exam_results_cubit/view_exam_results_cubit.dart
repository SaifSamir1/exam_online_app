
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/authintication/data/repo/exam_results_repo.dart';
import 'package:online_exam_app/features/exam_for_student/data/model/student_results.dart';

part 'view_exam_results_state.dart';

class ViewExamResultsCubit extends Cubit<ViewExamResultsState> {
  ViewExamResultsCubit(this.examResultsRepo) : super(ViewExamResultsInitial());

  ExamResultsRepo examResultsRepo;


  Future<void> getExamResults(
      {required String examCode,
      }) async {
    emit(GetExamResultsLoading());
    var result = await examResultsRepo.getExamResults(
      examCode: examCode,
    );
    result.fold((error) {
      emit(GetExamResultsError(errorMessage: error.toString()));
    }, (examResults) {
      emit(GetExamResultsSuccess(studentResults: examResults));
    });
  }
}
