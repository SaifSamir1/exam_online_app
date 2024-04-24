

import 'package:dartz/dartz.dart';

import '../../../exam_for_student/data/model/student_results.dart';

abstract class ExamResultsRepo {
  Future<Either<Exception, List<StudentResults>>> getExamResults(
      {required String examCode});
}