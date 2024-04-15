
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/features/splash/presentaion/views/splash_page.dart';

import '../../features/authintication/presentaion/views/student_login.dart';
import '../../features/authintication/presentaion/views/teacher_login.dart';

abstract class AppRouter {
  static  const kStudentAuth = '/kStudentAuth';
  static const kTeacherAuth = '/kTeacherAuth';
  static const kSplashView = '/kSplashView';

  static final router = GoRouter(
    routes: [

      GoRoute(
        path: kStudentAuth,
        builder: (context, state) => const StudentLogin(),
      ),
      GoRoute(
        path:kSplashView,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path:'/',
        builder: (context, state) => const TeacherLogin(),
      ),
    ],
  );
}
