part of 'store_exam_cubit.dart';

@immutable
sealed class StoreExamState {}

final class StoreExamInitial extends StoreExamState {}


final class CreateExamLoading extends StoreExamState {}
final class CreateExamSuccess extends StoreExamState {}
final class CreateExamError extends StoreExamState {
  final String error;

  CreateExamError({required this.error});
}

final class SetExamQuestionsLoading extends StoreExamState {}
final class SetExamQuestionsSuccess extends StoreExamState {}
final class SetExamQuestionsError extends StoreExamState {
  final String error;

  SetExamQuestionsError({required this.error});
}
