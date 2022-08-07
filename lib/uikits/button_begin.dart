import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapi/atom_widgets/app_snackbar.dart';
import 'package:quizapi/controllers/quiz_controller.dart';
import 'package:quizapi/uikits/result_inherited.dart';
import 'package:quizapi/common/common.dart';

class ButtonBegin extends StatefulWidget {
  const ButtonBegin({Key? key}) : super(key: key);

  @override
  State<ButtonBegin> createState() => _ButtonBeginState();
}

class _ButtonBeginState extends State<ButtonBegin> {
  bool enabled = true;
  double opacity = 1.0;
  @override
  Widget build(BuildContext context) {
    return BlocListener<QuizController, QuizState>(
      listener: (context, state) {
        if ((state.error != null) && (!state.init)) {
          ScaffoldMessenger.of(context).showSnackBar(AppSnackBar.build(
            message: '${state.error}',
            snackBarState: SnackBarState.error,
          ));
          enabled = !enabled;
          setState(() {
            opacity = 1.0;
          });
        } else if ((state.error == null) && (!state.init)) {
          ScaffoldMessenger.of(context).showSnackBar(AppSnackBar.build(
              snackBarState: SnackBarState.non, message: 'Wait'));
          enabled = !enabled;
          setState(() {
            opacity = 1.0;
          });
          Future.delayed(
              const Duration(seconds: 1),
              () => Navigator.pushNamedAndRemoveUntil(
                  context, AppPath.quiz, (route) => false));
        }
      },
      child: GestureDetector(
        onTap: () {
          if (enabled) {
            context.read<QuizController>().getQuiz(
                category: ResultInherited.of(context)
                    .gameResult
                    .category
                    .name
                    .capitalize(),
                difficulty: ResultInherited.of(context)
                    .gameResult
                    .difficulty
                    .name
                    .capitalize());
            enabled = !enabled;
            setState(() {
              opacity = 0.5;
            });
          }
        },
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 250),
          opacity: opacity,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 11),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(25)),
            child: Text(
              'Begin',
              style:
                  AppTextStyle.poppinW900S18.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
