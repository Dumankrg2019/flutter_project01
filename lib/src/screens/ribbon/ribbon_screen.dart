import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:first_project01/src/screens/main_screen/widgets/custom_listview_separated_institution.dart';
import 'package:first_project01/src/screens/main_screen/widgets/custom_search_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RibbonScreen extends StatelessWidget {
  const RibbonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
        child: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: CustomSearchTextField(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomListViewInstitution(),
            ),
          )
        ],
      ),
    ));
  }
}


