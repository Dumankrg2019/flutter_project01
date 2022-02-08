import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String placeholder;
  final bool showOrHideIconForPassword;
  final TextEditingController? controller;
  bool showOrHideInputType;
   CustomTextField({
    Key? key,
    required this.placeholder,
    this.showOrHideIconForPassword = false,
    this.controller,
    this.showOrHideInputType = false
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool changeShowPasswordMode = true;
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
            icon: Icon(widget.showOrHideInputType ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                changeShowPasswordMode = !changeShowPasswordMode;
                widget.showOrHideInputType = !widget.showOrHideInputType;
              });
            },
          ),
        ),
      ) : null,
      obscureText: widget.showOrHideInputType,
      controller: widget.controller,
    );
  }
}