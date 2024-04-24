part of 'question_cubit.dart';

@immutable
sealed class QuestionState {}

final class QuestionInitial extends QuestionState {}

final class ChangeDropDownButtonState extends QuestionState {}

final class SelectedAnswer extends QuestionState {}

final class AddQuestion extends QuestionState {}

final class RemoveQuestion extends QuestionState {}

final class ChangeCheckBoxValue extends QuestionState {}
