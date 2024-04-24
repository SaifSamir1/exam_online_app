import 'package:dartz/dartz.dart';
import 'package:online_exam_app/features/exam_for_student/data/model/student_results.dart';

import '../../../create_the_exam/data/model/exam_model.dart';
import '../../../create_the_exam/data/model/question_model.dart';

abstract class StudentExamRepo {
  Future<Either<Exception, ExamDetails>> getExamDetails(
      {required String examCode});
  Future<Either<Exception, List<QuestionModel>>> getQuestions(
      {required String examCode});
  Future<Either<Exception, String>> storeStudentResult(
      {required StudentResults studentResults, required String examCode});
}
