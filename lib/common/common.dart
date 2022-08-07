/*
  Common unit whit common types
*/

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quizapi/model/quiz_model.dart';

typedef Json = Map<String, dynamic>;

enum Difficulty {
  @JsonValue('Easy')
  easy,
  @JsonValue('Medium')
  medium,
  @JsonValue('Hard')
  hard
}

enum Category {
  @JsonValue('Linux')
  linux,
  @JsonValue('DevOps')
  devOps,
  @JsonValue('Networking')
  networking,
  @JsonValue('Programming')
  programming,
  @JsonValue('Cloud')
  cloud,
  @JsonValue('Docker')
  docker,
  @JsonValue('Kubernetes')
  kubernetes,
}

/// Set of categories
///
/// [Linux,DevOps,Networking,Programming,Cloud,Docker,Kubernetes]
///
final categories =
    Set<String>.from(Category.values.map((e) => e.name.capitalize()));

/// Set of difficulties
///
/// Easy,Medium,Hard
///
final difficulties =
    Set<String>.from(Difficulty.values.map((e) => e.name.capitalize()));

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

/// [count] - count of click
///
/// [result] - [id] answer,and  bool correct
///
///
class Result {
  Result({required this.count, required this.result});
  int count;
  Map<int, bool> result;
}

class GameResult {
  GameResult(
      {required this.quizes, required this.category, required this.difficulty});
  final Map<QuizModel, Result> quizes;
  Category category;
  Difficulty difficulty;

  GameResult copyWith(
      {Map<QuizModel, Result>? quizes,
      Category? category,
      Difficulty? difficulty}) {
    return GameResult(
        quizes: quizes ?? this.quizes,
        category: category ?? this.category,
        difficulty: difficulty ?? this.difficulty);
  }
}

abstract class AppPath {
  static const String home = '/home';
  static const String quiz = '/quiz';
  static const String end = '/end';
}

abstract class AppColors {
  static const Color orange = Color.fromRGBO(255, 107, 0, 1);
  static const Color greyBlack = Color.fromRGBO(122, 119, 119, 1);
  static const Color grey = Color.fromRGBO(200, 192, 186, 1);
  static const Color red = Color.fromRGBO(211, 0, 0, 1);
  static const Color green = Color.fromRGBO(63, 194, 1, 1);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
}

abstract class AppTextStyle {
  static const poppinW500S18 = TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none,
      color: AppColors.black,
      fontSize: 18);
  static const poppinW500S10 = TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.none,
      color: AppColors.black,
      fontSize: 10);
  static const poppinW900S18 = TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w900,
      decoration: TextDecoration.none,
      fontSize: 18,
      color: AppColors.black);
}

enum SnackBarState {
  non(icon: Icon(Icons.info, color: AppColors.white)),
  error(icon: Icon(Icons.error, color: AppColors.red)),
  success(icon: Icon(Icons.save_alt_outlined, color: AppColors.green));

  const SnackBarState({required this.icon});
  final Icon icon;
}
