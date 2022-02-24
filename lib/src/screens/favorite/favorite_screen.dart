import 'package:dio/dio.dart';
import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:first_project01/src/common/models/ribbon/restaurent_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
   List<RestaurentItemModel>? _favoriteRestaurents;
  @override
  void initState() {
    getFavoriteList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.white,
        border: Border(),
        middle: Text('Избранные'),
      ),
        child: SafeArea(
          child: Column(
            children: [
              Text('Favorite'),
              _favoriteRestaurents == null
                  ?  CupertinoActivityIndicator()
                  : Flexible(
                    child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (_, int index) {

                     return  GestureDetector(
                       onTap: () {},
                       child: Card(
                           clipBehavior: Clip.antiAlias,
                         child: Column(
                           children: [
                             Material(
                               child: Ink.image(
                                 image: NetworkImage(_favoriteRestaurents![index]
                                     .images![0].url.toString()
                                     ),
                                 fit: BoxFit.cover,
                                 height: 150,
                               ),
                             ),
                             Row(
                               children: [
                                 Expanded(
                                   child: Column(
                                       crossAxisAlignment:
                                       CrossAxisAlignment.start,
                                       children: [
                                         SizedBox(
                                           height: 11,
                                         ),
                                         Padding(
                                           padding:
                                           const EdgeInsets.only(left: 16),
                                           child: Text(
                                             _favoriteRestaurents![index].title
                                                 .toString(),
                                             textDirection: TextDirection.rtl,
                                             style: TextStyle(
                                                 fontSize: 16,
                                                 color: AppColors.black,
                                                 fontWeight: FontWeight.bold),
                                           ),
                                         ),
                                         SizedBox(
                                           height: 2,
                                         ),
                                         Padding(
                                           padding:
                                           const EdgeInsets.only(left: 16),
                                           child: Text(
                                             _favoriteRestaurents![index].description
                                                 .toString(),
                                             maxLines: 2,
                                             overflow: TextOverflow.ellipsis,
                                           ),
                                         ),
                                         SizedBox(
                                           height: 12,
                                         )
                                       ]),
                                 ),
                                 SizedBox(
                                   width: 21,
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(right: 24),
                                   child:
                                      IconButton(
                                         icon: Icon(
                                           _favoriteRestaurents![index]
                                               .isFavourite ??
                                               false
                                               ? CupertinoIcons.heart_fill
                                               : CupertinoIcons.heart,
                                           //CupertinoIcons.heart_fill,
                                           color: _favoriteRestaurents![index]
                                               .isFavourite ??
                                               false
                                               ? AppColors.red
                                               : AppColors.black,
                                         ),
                                         onPressed: () {

                                         },
                                       )
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ),

                      );
                    },
                    separatorBuilder: (_, __) => Divider(),
                    itemCount: _favoriteRestaurents!.length
              ),
                  )
            ],
          ),
        )
    );
  }

  getFavoriteList() async {
    final Dio dio = Dio();
    final Box tokensBox = Hive.box('tokens');

    try {
      dio.options.headers["authorization"] =
      'Bearer ${tokensBox.get('access')}';
      Response response = await dio.get('http://api.codeunion.kz/api/v1/likes/all');
      var results = (response.data['restaurants'] as List)
          .map((e) => RestaurentItemModel.fromJson(e)).toList();
      setState(() {
        _favoriteRestaurents = results;
      });
      print('shg');
      print(_favoriteRestaurents!.length);
    } on DioError catch(e) {
      print(e);
    }
  }
}
