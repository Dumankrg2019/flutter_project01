import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:first_project01/src/router/routing_const.dart';
import 'package:flutter/cupertino.dart';

class CupertinoBtnToRegister extends StatelessWidget {
  final String label;

  const CupertinoBtnToRegister({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: const EdgeInsets.symmetric(vertical: 20),
        color: AppColors.main,
        child: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.pushNamed(context, RegisterRoute);
        });
  }
}