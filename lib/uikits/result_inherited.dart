import 'package:flutter/cupertino.dart';
import 'package:quizapi/common/common.dart';

/// this class contains [GameResult] whos contains category of answers, map of quizes ,difficulty, and count of quizes
///
/// [count] of quizes we can get from map of quizes
///
/// [quizes] can be less then 10
///
///or lenght of [quizes] can be 0
class ResultInherited extends InheritedWidget {
  ResultInherited({super.key, required super.child});
  final GameResult gameResult = GameResult(
      quizes: {}, category: Category.cloud, difficulty: Difficulty.easy);

  static ResultInherited of(BuildContext context) {
    final ResultInherited result =
        context.dependOnInheritedWidgetOfExactType<ResultInherited>()!;
    return result;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
