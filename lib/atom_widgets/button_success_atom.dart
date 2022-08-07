import 'package:flutter/material.dart';
import 'package:quizapi/common/common.dart';

class ButtonSuccessAtom extends StatelessWidget {
  const ButtonSuccessAtom({Key? key, required this.id, required this.text})
      : super(key: key);
  final int id;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
        margin: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColors.green, borderRadius: BorderRadius.circular(40)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ),
            Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 10),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: AppColors.white, shape: BoxShape.circle),
                child: const Icon(
                  Icons.task_alt,
                  color: AppColors.green,
                )),
          ],
        ));
  }
}
