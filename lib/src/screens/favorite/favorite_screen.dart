import 'package:dio/dio.dart';
import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:first_project01/src/common/models/ribbon/restaurent_item.dart';
import 'package:first_project01/src/screens/favorite/bloc/favorite_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<RestaurentItemModel>? _favoriteRestaurents;

  @override
  void initState() {
    context.read<FavoriteBloc>().add(getFavoriteList());
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
              BlocConsumer<FavoriteBloc, FavoriteState>(
                listener: (context, state) {
                  if (state is FavoriteLoaded) {
                    print('success');
                  } else if (state is FavoriteFailed) {
                    print('error');
                  }
                },
                builder: (context, state) {
                  return state is! FavoriteLoaded
                      ? Center(
                          child: CupertinoActivityIndicator(),
                        )
                      : Flexible(
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (_, int index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: Column(
                                      children: [
                                        Material(
                                          child: Ink.image(
                                            image: NetworkImage(state
                                                .restaurents[index]
                                                .images![0]
                                                .url
                                                .toString()),
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
                                                          const EdgeInsets.only(
                                                              left: 16),
                                                      child: Text(
                                                        state.restaurents[index]
                                                            .title
                                                            .toString(),
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                AppColors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 2,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 16),
                                                      child: Text(
                                                        state.restaurents[index]
                                                            .description
                                                            .toString(),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                                padding: const EdgeInsets.only(
                                                    right: 24),
                                                child: IconButton(
                                                  icon: Icon(
                                                    state.restaurents[index]
                                                                .isFavourite ??
                                                            false
                                                        ? CupertinoIcons
                                                            .heart_fill
                                                        : CupertinoIcons.heart,
                                                    //CupertinoIcons.heart_fill,
                                                    color: state
                                                                .restaurents[
                                                                    index]
                                                                .isFavourite ??
                                                            false
                                                        ? AppColors.red
                                                        : AppColors.black,
                                                  ),
                                                  onPressed: () {},
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (_, __) => Divider(),
                              itemCount: state.restaurents.length),
                        );
                },
              )
            ],
          ),
        ));
  }
}
