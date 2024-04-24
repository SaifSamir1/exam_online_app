import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:online_exam_app/features/create_the_exam/data/model/exam_model.dart';
import 'package:online_exam_app/features/exam_for_student/data/model/student_results.dart';
import 'package:online_exam_app/features/exam_for_student/data/repo/student_exam_repo.dart';

import '../../../create_the_exam/data/model/question_model.dart';

class StudentExamRepoImpl extends StudentExamRepo {
  @override
  Future<Either<Exception, ExamDetails>> getExamDetails(
      {required String examCode}) async {
    try {
      ExamDetails examDetails;
      DocumentSnapshot<Map<String, dynamic>> details = await FirebaseFirestore
          .instance
          .collection(examCode)
          .doc('examDoc')
          .get();
      examDetails = ExamDetails.fromJson(details.data()!);
      return Right(examDetails);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<QuestionModel>>> getQuestions(
      {required String examCode}) async {
    try {
      List<QuestionModel> questions = [];
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection(examCode)
              .doc('examDoc')
              .collection('questions')
              .orderBy('id')
              .get();
      for (var question in querySnapshot.docs) {
        questions.add(QuestionModel.fromJson(question.data()));
      }
      return Right(questions);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, String>> storeStudentResult(
      {required StudentResults studentResults,
      required String examCode}) async {
    try {
      await FirebaseFirestore.instance
          .collection(examCode)
          .doc('examDoc')
          .collection('grads')
          .doc()
          .set(studentResults.toJson());
      return const Right('Success Process');
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
