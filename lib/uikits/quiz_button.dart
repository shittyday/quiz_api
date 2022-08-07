import 'package:flutter/material.dart';
import 'package:quizapi/atom_widgets/app_snackbar.dart';
import 'package:quizapi/atom_widgets/button_default_atom.dart';
import 'package:quizapi/atom_widgets/button_error_atom.dart';
import 'package:quizapi/atom_widgets/button_success_atom.dart';
import 'package:quizapi/common/common.dart';
import 'package:quizapi/model/quiz_model.dart';
import 'package:quizapi/uikits/result_inherited.dart';

class QuizButton extends StatefulWidget {
  const QuizButton(
      {Key? key,
      required this.quizModel,
      required this.text,
      required this.idAnswer,
      required this.controller})
      : super(key: key);
  final QuizModel quizModel;
  final String text;
  final int idAnswer;
  final PageController controller;
  @override
  State<QuizButton> createState() => _QuizButtonState();
}

class _QuizButtonState extends State<QuizButton> {
  bool enabled = true;
  bool? correct;
  @override
  Widget build(BuildContext context) {
    var count =
        ResultInherited.of(context).gameResult.quizes[widget.quizModel]!;
    return GestureDetector(
        onTap: enabled
            ? () {
                if (count.count == 0) {
                  /// nexPage
                  /// count decrement when tap on answer
                  ResultInherited.of(context)
                          .gameResult
                          .quizes[widget.quizModel]!
                          .result[widget.idAnswer] =
                      widget.quizModel.correctAnswers[widget.idAnswer]
                          .correctAnswer;
                  ResultInherited.of(context)
                      .gameResult
                      .quizes[widget.quizModel]!
                      .count -= 1;
                  if (widget.controller.hasClients) {
                    setState(() {
                      correct = widget.quizModel.correctAnswers[widget.idAnswer]
                          .correctAnswer;
                      enabled = false;
                    });

                    /// if count of answers == count of pages then we can push to the next page [End]
                    ///
                    /// because count of answers can be less then 10
                    ///
                    if (ResultInherited.of(context).gameResult.quizes.length -
                            1 ==
                        widget.controller.page!.toInt()) {
                      enabled = false;
                      Future.delayed(
                        const Duration(milliseconds: 500),
                        () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, AppPath.end, (route) => false);
                        },
                      );
                    } else {
                      enabled = false;
                      Future.delayed(
                        const Duration(milliseconds: 500),
                        () {
                          widget.controller.nextPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.linear);
                        },
                      );
                    }
                  }
                } else if (count.count > 0) {
                  ScaffoldMessenger.of(context).showSnackBar(AppSnackBar.build(
                      snackBarState: SnackBarState.non,
                      message: '${count.count} more questions'));
                  ResultInherited.of(context)
                          .gameResult
                          .quizes[widget.quizModel]!
                          .result[widget.idAnswer] =
                      widget.quizModel.correctAnswers[widget.idAnswer]
                          .correctAnswer;
                  ResultInherited.of(context)
                      .gameResult
                      .quizes[widget.quizModel]!
                      .count -= 1;
                  setState(() {
                    correct = widget.quizModel.correctAnswers[widget.idAnswer]
                        .correctAnswer;
                    enabled = false;
                  });
                } else if (count.count == -1) {
                  enabled = false;
                  Future.delayed(
                    const Duration(milliseconds: 500),
                    () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppPath.end, (route) => false);
                    },
                  );
                }
              }
            : null,

        /// if correct == null then defualt button
        ///
        /// if incorrect then error button
        ///
        /// if correct then success button
        child: correct == null
            ? ButtonDefaultAtom(
                color: AppColors.grey, id: widget.idAnswer, text: widget.text)
            : correct!
                ? ButtonSuccessAtom(id: widget.idAnswer, text: widget.text)
                : ButtonErrorAtom(id: widget.idAnswer, text: widget.text));
  }
}
