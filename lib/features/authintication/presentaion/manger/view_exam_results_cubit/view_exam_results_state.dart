part of 'view_exam_results_cubit.dart';

@immutable
sealed class ViewExamResultsState {}

final class ViewExamResultsInitial extends ViewExamResultsState {}

final class GetExamResultsLoading extends ViewExamResultsState {}
final class GetExamResultsSuccess extends ViewExamResultsState {
  final List<StudentResults> studentResults ;

  GetExamResultsSuccess({required this.studentResults});
}
final class GetExamResultsError extends ViewExamResultsState {
  final String errorMessage;

  GetExamResultsError({required this.errorMessage});
}
