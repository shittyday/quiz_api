import 'package:flutter/material.dart';
import 'package:quizapi/common/app_routes.dart';
import 'package:quizapi/pages/home.dart';
import 'package:quizapi/uikits/result_inherited.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResultInherited(
        child: const MaterialApp(
      onGenerateRoute: AppRoutes.onGenerateRoute,
      home: Home(),
    ));
  }
}
