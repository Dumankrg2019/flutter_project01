import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';


class CustomTextFieldDivider extends StatelessWidget {
  const CustomTextFieldDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: AppColors.dividerTextFieldColor,
      margin: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}