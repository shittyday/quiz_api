import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizapi/atom_widgets/app_snackbar.dart';
import 'package:quizapi/common/common.dart';
import 'package:quizapi/uikits/result_inherited.dart';

class ButtonSave extends StatefulWidget {
  const ButtonSave({Key? key, required this.result}) : super(key: key);
  final Json result;
  @override
  State<ButtonSave> createState() => _ButtonSaveState();
}

class _ButtonSaveState extends State<ButtonSave> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(AppSnackBar.build(
            snackBarState: SnackBarState.non, message: 'Saving data'));
        db.collection("results").add(widget.result).then((value) {
          if (mounted) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppPath.home, (route) => false);
          }
        }).onError((error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(AppSnackBar.build(
              snackBarState: SnackBarState.error, message: 'Error adding'));
        });

        ResultInherited.of(context).gameResult.quizes.clear();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 11),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.orange, borderRadius: BorderRadius.circular(25)),
        child: Text('Save',
            style: AppTextStyle.poppinW900S18.copyWith(color: AppColors.white)),
      ),
    );
  }
}
