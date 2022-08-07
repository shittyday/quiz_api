import 'package:flutter/material.dart';
import 'package:quizapi/common/common.dart';

class DropdownUnderline extends StatelessWidget {
  const DropdownUnderline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.orange,
            width: 0.0,
          ),
        ),
      ),
    );
  }
}
