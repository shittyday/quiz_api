import 'package:flutter/material.dart';
import 'package:quizapi/common/common.dart';
import 'package:quizapi/model/quiz_model.dart';
import 'package:quizapi/uikits/quiz_button.dart';

class QuizContainer extends StatelessWidget {
  const QuizContainer(
      {Key? key, required this.quizModel, required this.controller})
      : super(key: key);
  final QuizModel quizModel;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
            physics:
                const ClampingScrollPhysics(), // we scrolling pages when need it
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      quizModel.question,
                      style: AppTextStyle.poppinW500S18,
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      quizModel.answers.length,
                      (index) => QuizButton(
                            controller: controller,
                            quizModel: quizModel,
                            text: quizModel.answers[index].value,
                            idAnswer: index,
                          )),
                )
              ],
            )));
  }
}
