import 'package:flutter/cupertino.dart';
import 'package:quizapi/common/common.dart';

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
