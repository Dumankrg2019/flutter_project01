import 'package:first_project01/src/common/constants/color_constants.dart';
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
            child: CupertinoTextField(
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
            ),
          ),
          //ListShops()
        ],
      ),
    ));
  }
}


Widget ListShops() {
  final List<String> names = <String>['Esentail Mall', 'Mega Center', 'Asia center'];
  final List<int> colorCodes = <int>[500, 300, 100];

  return Container(
    height: 50,
    child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.blueAccent[colorCodes[index]],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: names.length
    ),
  );
}