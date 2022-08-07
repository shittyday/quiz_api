import 'package:flutter/material.dart';
import 'package:quizapi/common/common.dart';
import 'package:quizapi/uikits/button_begin.dart';
import 'package:quizapi/uikits/custom_dropdown.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomDropdown(set: categories, hint: 'Category'),
          CustomDropdown(set: difficulties, hint: 'Difficulty'),
          const ButtonBegin()
        ],
      ),
    );
  }
}
