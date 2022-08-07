import 'package:flutter/material.dart';
import 'package:quizapi/atom_widgets/date_atom.dart';
import 'package:quizapi/uikits/button_save.dart';
import 'package:quizapi/uikits/result_inherited.dart';
import 'package:quizapi/common/common.dart';
import 'package:intl/intl.dart';

class End extends StatelessWidget {
  const End({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var result = ResultInherited.of(context).gameResult;
    final date =
        DateFormat('dd.mm.yyyy HH:mm').format(DateTime.now().toLocal());
    int correct = 0;
    int inCorrect = 0;

    /// Increment counts
    for (var q in result.quizes.entries) {
      for (var element in q.value.result.entries) {
        if (element.value) {
          correct += 1;
        } else {
          inCorrect += 1;
        }
      }
    }
    return Scaffold(
        body: Align(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DateAtom(date: date),
          Image.asset('icon/win.png'),
          Text(result.category.name.capitalize(),
              style: AppTextStyle.poppinW500S18),
          Text(result.difficulty.name.capitalize(),
              style: AppTextStyle.poppinW500S18),
          Text('Corrrect $correct', style: AppTextStyle.poppinW500S18),
          Text('Incorrrect $inCorrect', style: AppTextStyle.poppinW500S18),
          ButtonSave(
            result: {
              'date': date,
              'category': result.category.name.capitalize(),
              'difficulty': result.difficulty.name.capitalize(),
              'correct': correct,
              'inCorrect': inCorrect
            },
          )
        ],
      ),
    ));
  }
}
