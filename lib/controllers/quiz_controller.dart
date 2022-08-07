import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quizapi/api/quiz_api.dart';
import 'package:quizapi/model/quiz_model.dart';
part 'package:quizapi/states/quiz_state.dart';

class QuizController extends Cubit<QuizState> {
  QuizController() : super(QuizState.init());
  final _api = QuizApi();
  void getQuiz({required String category, required String difficulty}) async {
    emit(state.copyWith(init: true));
    try {
      emit(state.copyWith(
          init: false,
          quiz:
              await _api.getQuiz(category: category, difficulty: difficulty)));
    } catch (e) {
      emit(state.copyWith(init: false, error: e));
    }
  }
}
