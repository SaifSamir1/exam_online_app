part of 'doing_exam_cubit.dart';

@immutable
sealed class GetExamState {}

final class GetExamInitial extends GetExamState {}


final class GetExamDetailsLoading extends GetExamState {}
final class GetExamDetailsSuccess extends GetExamState {
  final ExamDetails examDetails;

  GetExamDetailsSuccess({required this.examDetails});
}
final class GetExamDetailsError extends GetExamState {
  final String mssError;

  GetExamDetailsError({required this.mssError});

}

final class GetQuestionsLoading extends GetExamState {}
final class GetQuestionsSuccess extends GetExamState {
  final List<QuestionModel> question;

  GetQuestionsSuccess({required this.question});
}
final class GetQuestionsError extends GetExamState {
  final String mssError;

  GetQuestionsError({required this.mssError});

}

final class StoreStudentResultLoading extends GetExamState {}
final class StoreStudentResultSuccess extends GetExamState {}
final class StoreStudentResultError extends GetExamState {
  final String mssError;

  StoreStudentResultError({required this.mssError});

}

final class SetCurrentIndex extends GetExamState {}

final class OptionSelection extends GetExamState {}

final class NextQuestion extends GetExamState {}