import 'package:flutter/material.dart';
import 'package:quizapi/common/common.dart';

class ButtonDefaultAtom extends StatelessWidget {
  const ButtonDefaultAtom(
      {Key? key, required this.color, required this.id, required this.text})
      : super(key: key);
  final Color color;
  final int id;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(40)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(right: 10),
              decoration: const BoxDecoration(
                  color: AppColors.white, shape: BoxShape.circle),
              child: Text(
                "$id",
                style: AppTextStyle.poppinW900S18,
              ),
            ),
            Expanded(
              child: Text(
                text,
                style: AppTextStyle.poppinW500S18,
              ),
            )
          ],
        ));
  }
}
