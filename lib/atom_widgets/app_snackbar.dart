import 'package:flutter/material.dart';
import 'package:quizapi/common/common.dart';

class AppSnackBar extends SnackBar {
  const AppSnackBar._({required super.content})
      : super(duration: const Duration(seconds: 1));
  factory AppSnackBar.build(
      {required SnackBarState snackBarState, required String message}) {
    return AppSnackBar._(
        content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Text(message,
                style: AppTextStyle.poppinW500S10
                    .copyWith(color: AppColors.grey))),
        snackBarState.icon
      ],
    ));
  }
}

/*class AppSnackBar extends StatelessWidget {
  const AppSnackBar(
      {Key? key, required this.message, required this.snackBarState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
        content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(message,
            style: AppTextStyle.poppinW500.copyWith(color: AppColors.grey)),
        snackBarState.icon
      ],
    ));
  }
}*/
