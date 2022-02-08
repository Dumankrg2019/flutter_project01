import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
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
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool changeShowPasswordMode = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: widget.placeholder,
      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
      decoration: BoxDecoration(color: AppColors.white),
      suffix: widget.showOrHideIconForPassword ? Padding(
        padding: EdgeInsets.only(right: 16),
        child: Material(
          child: IconButton(
            icon: Icon(changeShowPasswordMode ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                changeShowPasswordMode = !changeShowPasswordMode;
              });
            },
          ),
        ),
      ) : null,
      obscureText: !changeShowPasswordMode,
      controller: widget.controller,
    );
  }
}