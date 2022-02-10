import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';

class CupertinoBtn extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const CupertinoBtn({Key? key, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: const EdgeInsets.symmetric(vertical: 20),
        color: AppColors.main,
        child: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: onPressed);
  }
}