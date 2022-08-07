import 'package:flutter/material.dart';
import 'package:quizapi/common/common.dart';

class DropDownIcon extends StatelessWidget {
  const DropDownIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.only(left: 10, top: 13, right: 10, bottom: 10),
      decoration:
          const BoxDecoration(color: AppColors.orange, shape: BoxShape.circle),
      child: const Icon(Icons.keyboard_arrow_down_outlined,
          color: AppColors.white),
    );
  }
}
