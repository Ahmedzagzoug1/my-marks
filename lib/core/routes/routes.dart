import 'package:flutter/material.dart';
import 'package:my_marks/features/auth/presentation/pages/sign_in_page.dart';
import 'package:my_marks/features/home/presentation/pages/home_page.dart';
import 'package:my_marks/features/student_info/presentation/pages/student_info_page.dart';
import 'package:my_marks/features/student_marks/presentation/pages/student_marks_page.dart';

class Routes {
  static const String signInRoute = "/signInRoute";
  static const String studentIfoRoute = "/studentIfoRoute";
  static const String studentMarksRoute = "/studentMarksRoute";
  static const String homeRoute = "/homeRoute";
}

class RouteGenerator {


  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {

      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInPage());
       case Routes.studentIfoRoute:
        return MaterialPageRoute(builder: (_) => const StudentInfoPage());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.studentMarksRoute:
        return MaterialPageRoute(builder: (_) => const StudentMarksPage());

      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}