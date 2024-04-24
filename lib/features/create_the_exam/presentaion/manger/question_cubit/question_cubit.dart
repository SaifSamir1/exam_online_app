import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/features/create_the_exam/data/model/question_model.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit() : super(QuestionInitial());

  int? questionsNumber = 1;
  String? answer;
  List<TextEditingController> allQuestionsController = [
    TextEditingController()
  ];
  List<String> allAnswers = [''];
  TextEditingController examTimeController = TextEditingController();
  List<List<bool>> checkBoxValuesForAllQuestions = [List.filled(4, false)];
  List<String> questionsType = ['MCQ'];
  List<TextEditingController> allGradesControllers = [TextEditingController()];
  List<List<TextEditingController>> allOptionsController = [
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController()
    ]
  ];

  List<QuestionModel> allQuestionsModel = [];
  List<List<String>> textValues =[];

  void transferTheOptionsList()
  {
    for(int i =0;i<allOptionsController.length;i++)
      {
        List<String> options = [];
        options.addAll(allOptionsController[i].map((e) => e.text).toList());
        textValues.add(options);
      }
  }
  void storeQuestionsModel() {
    transferTheOptionsList();
    for (int i = 0; i < allQuestionsController.length; i++) {
      allQuestionsModel.add(
        QuestionModel(
          id: i + 1,
          grade: int.parse(allGradesControllers[i].text),
          question: allQuestionsController[i].text,
          options: textValues[i],
          questionType: questionsType[i],
          correctAnswer: allAnswers[i],
        ),
      );
    }
  }

  void selectedAnswer(String? value) {
    answer = value;
    emit(SelectedAnswer());
  }

  void addQuestionToList() {
    allQuestionsController.add(TextEditingController());
    questionsNumber = questionsNumber! + 1;
    checkBoxValuesForAllQuestions.add(List.filled(4, false));
    allGradesControllers.add(TextEditingController());
    allOptionsController.add([
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController()
    ]);
    allAnswers.add('');
    emit(AddQuestion());
  }

  void changeCheckBoxValue(bool value, int index, int questionIndex) {
    //to make the check box value is false
    checkBoxValuesForAllQuestions[questionIndex].fillRange(
        0, checkBoxValuesForAllQuestions[questionIndex].length, false);
    //the selected check box only is true
    checkBoxValuesForAllQuestions[questionIndex][index] = value;
    emit(ChangeCheckBoxValue());
  }

  void storeAllAnswers(String value, int questionIndex) {
    allAnswers[questionIndex] = value;
  }

  void removeQuestionFromList(int index) {
    questionsNumber = questionsNumber! - 1;
    checkBoxValuesForAllQuestions.removeAt(index);
    allOptionsController.removeAt(index);
    allQuestionsController.removeAt(index);
    allAnswers.removeAt(index);
    allGradesControllers.removeAt(index);
    questionsType.removeAt(index);
    emit(RemoveQuestion());
  }

  void questionsTypeList() {
    questionsType.add('MCQ');
  }

  void changeDropdownButton(String? value, int index) {
    questionsType[index] = value!;
    emit(ChangeDropDownButtonState());
  }

  void printListItems() {
    for (int i = 0; i < allQuestionsModel.length; i++) {
      log(allQuestionsModel[i].options.toString());
      log("Question ${i + 1}: ${allQuestionsController[i].text}");
      log("  Answer: ${allAnswers[i]}");
      log("  Grade: ${allGradesControllers[i].text}");
      log("  Type: ${questionsType[i]}");
      log("  Checkbox Values: ${checkBoxValuesForAllQuestions[i]}"); // Prints a list of booleans
      log("  Options: ${allOptionsController[i][i].text}"); // Prints a list of strings
      // Prints a list of strings
    }
  }
}
