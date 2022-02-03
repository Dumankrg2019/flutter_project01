import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';

class CustomTextField extends StatelessWidget {
  final String placeholder;
  const CustomTextField({
    Key? key,
    required this.placeholder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: placeholder,
      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
      decoration: BoxDecoration(color: AppColors.white),
    );
  }
}