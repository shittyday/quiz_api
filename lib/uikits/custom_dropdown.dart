import 'package:flutter/material.dart';
import 'package:quizapi/atom_widgets/dropdown_icon.dart';
import 'package:quizapi/atom_widgets/dropdown_underline.dart';
import 'package:quizapi/common/common.dart';

import 'result_inherited.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({Key? key, required this.set, required this.hint})
      : super(key: key);
  final Set<String> set;
  final String hint;
  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _value;
  late final bool category = widget.hint == 'Category';
  late final items = List<DropdownMenuItem<String>>.generate(
      widget.set.length,
      (index) => DropdownMenuItem(
          value: widget.set.elementAt(index),
          child: Text(widget.set.elementAt(index),
              style: AppTextStyle.poppinW500S18)),
      growable: false);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: DropdownButton<String>(
          icon: const DropDownIcon(),
          style: AppTextStyle.poppinW500S18,
          underline: const DropdownUnderline(),
          hint:
              Text("Select ${widget.hint}", style: AppTextStyle.poppinW500S18),
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = value;
              if (category) {
                ResultInherited.of(context).gameResult.category =
                    Category.values.firstWhere(
                        (element) => element.name.capitalize() == _value);
              } else {
                ResultInherited.of(context).gameResult.difficulty =
                    Difficulty.values.firstWhere(
                        (element) => element.name.capitalize() == _value);
              }
            });
          },
          items: items),
    );
  }
}
