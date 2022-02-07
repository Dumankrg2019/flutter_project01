import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String placeholder;
  final bool showOrHideIconForPassword;
  final TextEditingController? controller;
  const CustomTextField({
    Key? key,
    required this.placeholder,
    this.showOrHideIconForPassword = false,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: placeholder,
      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
      decoration: BoxDecoration(color: AppColors.white),
      suffix: showOrHideIconForPassword ? Padding(
        padding: EdgeInsets.only(right: 16),
        child: Icon(
          Icons.visibility_off,
          color: Colors.black,
        ),
      ) : null,
      obscureText: showOrHideIconForPassword,
      controller: controller,
    );
  }
}