import 'package:dio/dio.dart';
import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:first_project01/src/common/models/ribbon/restaurent_item.dart';
import 'package:first_project01/src/router/routing_const.dart';
import 'package:first_project01/src/screens/ribbon/bloc/ribbon_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListViewInstitution extends StatefulWidget {
  CustomListViewInstitution({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomListViewInstitution> createState() => _CustomListViewInstitutionState();
}

class _CustomListViewInstitutionState extends State<CustomListViewInstitution> {
  final Box tokensBox = Hive.box('tokens');
  late List<RestaurentItemModel> _restaurents;
  bool _isLoading = true;
  bool _isFavorite = false;
  getRestaurents() async {
    Dio dio = Dio();
    try {
      dio.options.headers["authorization"] =
      'Bearer ${tokensBox.get('access')}';
      Response response = await dio.get(
          'http://api.codeunion.kz/api/v1/restaurants/all?page=1&perPage=10');

      var results = (response.data['restaurants'] as List)
          .map((e) => RestaurentItemModel.fromJson(e))
          .toList();
      _restaurents = results;
      setState(() {
        _isLoading = false;
      });
      print(_restaurents[0].title);
    } on DioError catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    context.read<RibbonBloc>().add(RibbonGot(restaurent: _restaurents));
    //getRestaurents();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<RibbonBloc, RibbonState>(
      listener: (context, state) {
        if(state is RibbonLoaded) {
          ListView.separated(
            separatorBuilder: (_, __) => Divider(),
            itemBuilder: (_, int index) {
              return GestureDetector(
                onTap: () {
                  print(_restaurents[index].id);
                  tokensBox.put('idRestaurent', _restaurents[index].id.toString());
                  Navigator.of(context, rootNavigator: true).pushNamed(RestaurantDetailRoute);
                },
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Material(
                        child: Ink.image(
                          image: NetworkImage(_restaurents[index].images![0].url.toString()),
                          fit: BoxFit.cover,
                          height: 150,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 11,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Text(
                                      _restaurents[index].title.toString(),
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
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Text(
                                      _restaurents[index].description.toString(),
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
                            child: Icon(
                              CupertinoIcons.heart, //CupertinoIcons.heart_fill,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: _restaurents.length,
          );
        } else if(state is RibbonFailed) {
          showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('Ошибка'),
                  content: Text(state.message ?? ''),
                  actions: [
                    CupertinoButton(
                        child: Text('ОК'),
                        onPressed: () => Navigator.pop(context))
                  ],
                );
              });
        }
      },
      builder: (context, state) {
        return state is RibbonLoading ? Center(child: CupertinoActivityIndicator(),) : Text('Emty');
      },
    );
  }
}
