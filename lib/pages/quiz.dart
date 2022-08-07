import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizapi/common/common.dart';
import 'package:quizapi/controllers/quiz_controller.dart';
import 'package:quizapi/model/quiz_model.dart';
import 'package:quizapi/uikits/quiz_container.dart';
import 'package:quizapi/uikits/result_inherited.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final _controller = PageController();
  late final List<QuizModel> quizes;
  @override
  void initState() {
    super.initState();
    quizes = context.read<QuizController>().state.quiz;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _fillInheritedWidget();
    return Scaffold(
      body: SizedBox.expand(
          child: PageView.builder(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: quizes.length,
        itemBuilder: (context, index) {
          return QuizContainer(
            quizModel: quizes[index],
            controller: _controller,
          );
        },
      )),
    );
  }

  /// if [multipleCorrectAnswers] then increment count and then decrement -1
  ///
  /// when you tap on answer,  you decrement count, and need set flag on value eq. -1 to push on next page
  ///
  /// if count eq. 0 you decrement count  and it eq. -1 , then you can push on next page
  int _countCorrect(QuizModel quizModel) {
    int count = 0;
    if (quizModel.multipleCorrectAnswers) {
      for (var element in quizModel.correctAnswers) {
        if (element.correctAnswer) {
          count += 1;
        }
      }
    }
    return count == 0 ? count : count - 1;
  }

  void _fillInheritedWidget() {
    for (var element in quizes) {
      ResultInherited.of(context).gameResult.quizes[element] =
          Result(count: _countCorrect(element), result: {});
    }
  }
}
