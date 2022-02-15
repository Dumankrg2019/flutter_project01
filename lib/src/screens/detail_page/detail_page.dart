import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final Box tokensBox = Hive.box('tokens');

  getDetailInfo() async {
    Dio dio = Dio();
    
    try {
      dio.options.headers["authorization"] =
      'Bearer ${tokensBox.get('access')}';
      print(tokensBox.get('idRestaurent'));
      Response response = await dio.get('http://api.codeunion.kz/api/v1/restaurants/details/${tokensBox.get('idRestaurent')}');
      print(response.data);
    } on DioError catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getDetailInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.white,
          border: Border(),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            ),
          ),
          middle: Text('Detail Page'),
        ),
        child: SafeArea(
          child: Column(

          ),
        ),
      ),
    );
  }
}
