import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/features/authintication/data/models/initial_exam_details.dart';
import 'package:online_exam_app/features/create_the_exam/presentaion/views/create_exam_page.dart';
import 'package:online_exam_app/features/exam_for_student/data/model/student_results.dart';
import 'package:online_exam_app/features/exam_for_student/data/repo/student_exam_repo_impl.dart';
import 'package:online_exam_app/features/exam_for_student/presentaion/manger/doing_exam_cubit/doing_exam_cubit.dart';
import 'package:online_exam_app/features/exam_for_student/presentaion/views/the_grade_screen.dart';
import 'package:online_exam_app/features/splash/presentaion/views/splash_page.dart';

import '../../features/authintication/data/models/student_details_model.dart';
import '../../features/authintication/presentaion/views/student_login.dart';
import '../../features/authintication/presentaion/views/teacher_login.dart';
import '../../features/authintication/presentaion/views/view_exam_results.dart';
import '../../features/create_the_exam/presentaion/views/create_exam_success.dart';
import '../../features/display_students_grades/presentaion/views/students_grades_screen.dart';
import '../../features/exam_for_student/data/model/final_grades.dart';
import '../../features/exam_for_student/presentaion/views/widgets/initial_exam_screen.dart';

abstract class AppRouter {
  static const kStudentAuth = '/kStudentAuth';
  static const kTeacherAuth = '/kTeacherAuth';
  static const kSplashView = '/kSplashView';
  static const kCreateExamPage = '/kCreateExamPage';
  static const kInitialExamScreen = '/kInitialExamScreen';
  static const kGradeScreen = '/kGradeScreen';
  static const kExamCreatedSuccessfully = '/kExamCreatedSuccessfully';
  static const kViewExamResults = '/kViewExamResults';
  static const kStudentsGradesScreen = '/kStudentsGradesScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kStudentAuth,
        builder: (context, state) => const StudentLogin(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: kTeacherAuth,
        builder: (context, state) => const TeacherLogin(),
      ),
      GoRoute(
        path: kInitialExamScreen,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => GetExamCubit(StudentExamRepoImpl()),
              child: InitialExamScreen(
                studentDetailsModel: state.extra as StudentDetailsModel,
              ),
            ),
      ),
      GoRoute(
        path: kExamCreatedSuccessfully,
        builder: (context, state) => const ExamCreatedSuccessfully(),
      ),
      GoRoute(
        path: kGradeScreen,
        builder: (context, state) =>
            GradeScreen(
              finalGrades: state.extra as FinalGrades,
            ),
      ),
      GoRoute(
        path: kCreateExamPage,
        builder: (context, state) =>
            CreateExamPage(
              initialExamDetails: state.extra as InitialExamDetails,
            ),
      ),
      GoRoute(
        path: kViewExamResults,
        builder: (context, state) => const ViewExamResults(),
      ),
      GoRoute(
        path: kStudentsGradesScreen,
        builder: (context, state) => StudentsGradesScreen(
          studentsResults: state.extra as List<StudentResults>,
        ),
      ),
    ],
  );
}
