

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:online_exam_app/features/exam_for_student/data/model/student_results.dart';

import 'exam_results_repo.dart';

class ExamResultsRepoImpl extends ExamResultsRepo{
  @override
  Future<Either<Exception, List<StudentResults>>> getExamResults(
      {required String examCode}) async{
    try {
      List<StudentResults> studentResults = [];
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
          .collection(examCode)
          .doc('examDoc')
          .collection('grads').get();
      for (var result in querySnapshot.docs) {
        studentResults.add(StudentResults.fromJson(result.data()));
      }
      return  Right(studentResults);
    } catch (e) {
      log('------------------------------------------------${e.toString()}');
      return Left(Exception(e.toString()));
    }
  }

}