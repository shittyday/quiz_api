import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:quizapi/model/quiz_model.dart';

const int _limit = 10;
const String _baseUlr = 'https://quizapi.io/api/v1/questions';
const int _timeout = 30000;
const String _apiKey = 'j24WhINsXuMG7PszLmbkLHqRiXRoFnjRZrHxkwDa';

class QuizApi {
  final _dio = Dio(BaseOptions(
      sendTimeout: _timeout,
      connectTimeout: _timeout,
      receiveTimeout: _timeout));
  Future<List<QuizModel>> getQuiz(
      {required String category, required String difficulty}) async {
    try {
      var response = await _dio.get(_baseUlr, queryParameters: {
        'category': category,
        'difficulty': difficulty,
        'apiKey': _apiKey,
        'limit': _limit
      });
      var result = await _parseResponse(response);
      return result;
    } catch (e) {
      if (e is DioError) {
        throw Exception(e.message);
      }
      rethrow;
    }
  }

  Future<List<QuizModel>> _parseResponse(Response response) async {
    return await compute((List json) {
      return List.generate(
          json.length, (index) => QuizModel.fromJson(json[index]));
    }, response.data as List);
  }
}
