


import 'package:dartz/dartz.dart';

import '../model/exam_model.dart';
import '../model/question_model.dart';



abstract class CreateExamRepo {
  Future<Either<Exception, String>> createExam({required ExamDetails examDetails});
  Future<Either<Exception, String>> setExamQuestions({
    required String examCode,
    required List<QuestionModel> questions,
  });
}