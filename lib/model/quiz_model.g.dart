// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) => QuizModel(
      id: json['id'] as int,
      question: json['question'] as String,
      description: json['description'] as String?,
      answers: _getAnswers(json['answers']),
      multipleCorrectAnswers:
          (json['multiple_correct_answers'] as String) == 'true',
      correctAnswers: _getCorrectAnswer(json['correct_answers']),
      explanation: json['explanation'] as String?,
      difficulty: $enumDecode(_$DifficultyEnumMap, json['difficulty']),
    );

Map<String, dynamic> _$QuizModelToJson(QuizModel instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'description': instance.description,
      'answers': instance.answers,
      'multiple_correct_answers': instance.multipleCorrectAnswers,
      'correct_answers': instance.correctAnswers,
      'explanation': instance.explanation,
      'difficulty': _$DifficultyEnumMap[instance.difficulty]!,
    };

const _$DifficultyEnumMap = {
  Difficulty.easy: 'Easy',
  Difficulty.medium: 'Medium',
  Difficulty.hard: 'Hard',
};

List<Answer> _getAnswers(Map value) {
  var result = <Answer>[];
  for (var element in value.entries) {
    if (element.value != null) result.add(Answer(value: element.value));
  }
  return result;
}

List<CorrectAnswer> _getCorrectAnswer(Map value) {
  var result = <CorrectAnswer>[];
  for (var element in value.entries) {
    if (element.value != null) {
      result.add(CorrectAnswer(correctAnswer: element.value == 'true'));
    }
  }
  return result;
}
