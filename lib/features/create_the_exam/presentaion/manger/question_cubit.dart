import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit() : super(QuestionInitial());

  int? questionsNumber = 1;
  String? answer;
  List<String> questionsType = ['MCQ'];
  List<List<bool>> checkBoxValuesForAllQuestions =[List.filled(4, false)];
  List<String> options = ['', '', '', '', ];

  void selectedAnswer(String? value){
    answer = value;
    emit(SelectedAnswer());
  }
  void addQuestionToList(){
    questionsNumber = questionsNumber! + 1;
    checkBoxValuesForAllQuestions.add(List.filled(4, false));
    emit(AddQuestion());
  }
  void changeCheckBoxValue(bool value,int index,int questionIndex){
    //to make the check box value is false
    checkBoxValuesForAllQuestions[questionIndex].fillRange(0, checkBoxValuesForAllQuestions[questionIndex].length, false);
    //the selected check box only is true
    checkBoxValuesForAllQuestions[questionIndex][index] = value;
    log('questionIndex $questionIndex');
    log('Answer index  $index');
    for(var e in checkBoxValuesForAllQuestions)
      {
        log(e.toString());
      }
    emit(ChangeCheckBoxValue());
  }
  void removeQuestionFromList(int index){
    questionsNumber = questionsNumber! - 1;
    checkBoxValuesForAllQuestions.removeAt(index);
    questionsType.removeAt(index);
    emit(RemoveQuestion());
  }
  void questionsTypeList(){
    questionsType.add('MCQ');
    for(var element in questionsType)
      {
        log(element);
      }
  }
  void changeDropdownButton (String? value, int index )
  {
    questionsType[index] = value!;
    emit(ChangeDropDownButtonState());
  }
}
