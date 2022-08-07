part of 'package:quizapi/controllers/quiz_controller.dart';

class QuizState extends Equatable {
  const QuizState._(
      {required this.error, required this.init, required this.quiz});

  factory QuizState.init() {
    return const QuizState._(error: null, init: true, quiz: []);
  }
  final bool init;
  final List<QuizModel> quiz;
  final Object? error;

  QuizState copyWith({bool? init, List<QuizModel>? quiz, Object? error}) {
    return QuizState._(
        error: error, init: init ?? this.init, quiz: quiz ?? this.quiz);
  }

  @override
  List<Object?> get props => [init, quiz, error];
}
