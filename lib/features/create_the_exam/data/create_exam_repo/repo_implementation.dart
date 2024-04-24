import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:online_exam_app/features/create_the_exam/data/create_exam_repo/repo.dart';
import 'package:online_exam_app/features/create_the_exam/data/model/question_model.dart';

import '../model/exam_model.dart';

class CreateExamRepoImpl extends CreateExamRepo {
  @override
  Future<Either<Exception, String>> createExam(
      { required ExamDetails examDetails}) async {
    try {
      await FirebaseFirestore.instance
          .collection(examDetails.examCode)
          .doc('examDoc')
          .set(examDetails.toJson());
      return const Right('Success Process');
    } catch (e) {
      log('error in create Exam');
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, String>> setExamQuestions({
    required String examCode,
    required List<QuestionModel> questions,
  }) async {
    try {
      for (var i = 0; i < questions.length; i++) {
        await FirebaseFirestore.instance
            .collection(examCode)
            .doc('examDoc').collection('questions').doc().set(questions[i].toJson());
      }
      return const Right('Success Process');
    } catch (e) {
      log('set exam error ${e.toString()}');
      return Left(Exception(e.toString()));
    }
  }
}

