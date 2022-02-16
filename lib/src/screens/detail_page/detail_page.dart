import 'package:dio/dio.dart';
import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:first_project01/src/common/models/ribbon/restaurent_item.dart';
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
  List<RestaurentItemModel>? _restaurents;
  bool _isLoading = true;

  getDetailInfo() async {
    Dio dio = Dio();

    try {
      dio.options.headers["authorization"] =
          'Bearer ${tokensBox.get('access')}';
      print(tokensBox.get('idRestaurent'));
      Response response = await dio.get(
          'http://api.codeunion.kz/api/v1/restaurants/details/${tokensBox.get('idRestaurent')}');

      var results = (response.data['restaurant'] as List)
          .map((e) => RestaurentItemModel.fromJson(e))
          .toList();
      _restaurents = results;
      setState(() {
        _isLoading = false;
      });
      print(_restaurents![0].title);
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
          middle: Text(
              _isLoading ? 'Detail Page' : _restaurents![0].title.toString()),
        ),
        child: SafeArea(
          child: _isLoading
              ? Center(
                  child: CupertinoActivityIndicator(),
                )
              : Column(
                  children: [
                    Image.network(_restaurents![0].images![0].url.toString()),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Описание',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      _restaurents![0].description.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 15,),
                    Text('с ${_restaurents![0].schedule.opening.toString()} до ${_restaurents![0].schedule.closing.toString()}')
                  ],
                ),
        ),
      ),
    );
  }
}
