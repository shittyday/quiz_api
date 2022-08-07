import 'package:flutter/material.dart';
import 'package:quizapi/common/common.dart';

class DateAtom extends StatelessWidget {
  const DateAtom({Key? key, required this.date}) : super(key: key);
  final String date;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(date, style: AppTextStyle.poppinW500S18),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.orange,
                width: 1.0,
              ),
            ),
          ),
        )
      ],
    );
  }
}
