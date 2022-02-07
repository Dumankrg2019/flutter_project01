import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: 'Поиск',
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      prefix: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Icon(
          CupertinoIcons.search,
          color: AppColors.grey,
        ),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.dividerTextFieldColor),
          borderRadius: BorderRadius.circular(6.0)),
    );
  }
}