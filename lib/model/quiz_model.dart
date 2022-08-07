import 'package:quizapi/common/common.dart';
import 'package:quizapi/model/answers.dart';

import 'package:json_annotation/json_annotation.dart';

import 'correct_answers.dart';

part 'quiz_model.g.dart';

@JsonSerializable()
class QuizModel {
  const QuizModel(
      {required this.id,
      required this.question,
      this.description,
      required this.answers,
      required this.multipleCorrectAnswers,
      required this.correctAnswers,
      this.explanation,
      required this.difficulty});
  final int id;
  final String question;
  final String? description;
  final List<Answer> answers;
  @JsonKey(name: 'multiple_correct_answers')
  final bool multipleCorrectAnswers;
  @JsonKey(name: 'correct_answers')
  final List<CorrectAnswer> correctAnswers;
  final String? explanation;
  final Difficulty difficulty;

  factory QuizModel.fromJson(Json json) => _$QuizModelFromJson(json);
  Json toJson() => _$QuizModelToJson(this);
}
