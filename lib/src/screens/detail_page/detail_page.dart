import 'package:dio/dio.dart';
import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:first_project01/src/common/models/ribbon/restaurent_item.dart';
import 'package:first_project01/src/router/routing_const.dart';
import 'package:first_project01/src/screens/detail_page/bloc/get_detail_page_bloc.dart';
import 'package:first_project01/src/screens/main_screen/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({ required this.id, Key? key,}) : super(key: key);
  final String? id;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final Box tokensBox = Hive.box('tokens');
  List<RestaurentItemModel>? _restaurents;
  bool _isLoading = true;

  @override
  void initState() {
    context.read<GetDetailPageBloc>().add(GetDetailPageInfo(idRestaurent: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: BlocConsumer<GetDetailPageBloc, GetDetailPageState>(
      listener: (context, state) {

      },
  builder: (context, state) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.white,
          border: Border(),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).pushReplacementNamed(MainRoute);
              //Navigator.pop(context);
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
          child: state is !GetDetailPageLoaded
              ? Center(
                  child: CupertinoActivityIndicator(),
                )
              : Column(
                  children: [
                    Image.network(state.restaurents[0].images![0].url.toString()),
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
                      state.restaurents[0].description.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 15,),
                    Text('с ${state.restaurents[0].schedule.opening.toString()} до ${state.restaurents[0].schedule.closing.toString()}')
                  ],
                ),
        ),
      );
  },
),
    );
  }
}
