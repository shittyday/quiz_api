import 'package:flutter/material.dart';
import 'package:quizapi/common/common.dart';
import 'package:quizapi/pages/end.dart';
import 'package:quizapi/pages/home.dart';
import 'package:quizapi/pages/quiz.dart';

abstract class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPath.home:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const Home();
          },
        );
      case AppPath.quiz:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const Quiz();
          },
        );
      case AppPath.end:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const End();
          },
        );
      default:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const Home();
          },
        );
    }
  }
}
