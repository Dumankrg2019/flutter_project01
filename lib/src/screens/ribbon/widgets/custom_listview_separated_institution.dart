import 'package:dio/dio.dart';
import 'package:first_project01/src/common/constants/color_constants.dart';
import 'package:first_project01/src/common/dependencies/injection_container.dart';
import 'package:first_project01/src/common/models/ribbon/restaurent_item.dart';
import 'package:first_project01/src/router/routing_const.dart';
import 'package:first_project01/src/screens/detail_page/detail_page.dart';
import 'package:first_project01/src/screens/ribbon/bloc/like_func_bloc/like_func_bloc.dart';
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
  State<CustomListViewInstitution> createState() =>
      _CustomListViewInstitutionState();
}

class _CustomListViewInstitutionState extends State<CustomListViewInstitution> {
  final Box tokensBox = Hive.box('tokens');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RibbonBloc, RibbonState>(
      listener: (context, state) {
        if (state is RibbonLoaded) {
        } else if (state is RibbonFailed) {
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
        print(state);
        return state is! RibbonLoaded
            ? Center(
                child: CupertinoActivityIndicator(),
              )
            : ListView.separated(
                separatorBuilder: (_, __) => Divider(),
                itemBuilder: (_, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(RestaurantDetailRoute,
                          arguments: state.restaurents[index].id.toString());
                    },
                    child: BlocProvider(
                      create: (context) => LikeFuncBloc(dio: getIt<Dio>()),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            Material(
                              child: Ink.image(
                                image: NetworkImage(state
                                    .restaurents[index].images![0].url
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
                                              const EdgeInsets.only(left: 16),
                                          child: Text(
                                            state.restaurents[index].title
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
                                            state.restaurents[index].description
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
                                      BlocBuilder<LikeFuncBloc, LikeFuncState>(
                                    builder: (context, likeState) {
                                      return IconButton(
                                        icon: Icon(
                                          state.restaurents[index]
                                                      .isFavourite ??
                                                  false
                                              ? CupertinoIcons.heart_fill
                                              : CupertinoIcons.heart,
                                          //CupertinoIcons.heart_fill,
                                          color: state.restaurents[index]
                                                      .isFavourite ??
                                                  false
                                              ? AppColors.red
                                              : AppColors.black,
                                        ),
                                        onPressed: state is LikeFuncLoading
                                            ? null
                                            : () {
                                                context
                                                    .read<LikeFuncBloc>()
                                                    .add(LikeFuncPressed(
                                                        idRestaurant: state
                                                            .restaurents[index]
                                                            .id,
                                                        isFavorite: state
                                                            .restaurents[index]
                                                            .isFavourite));
                                                setState(() {
                                                  state.restaurents[index]
                                                      .isFavourite = !(state
                                                          .restaurents[index]
                                                          .isFavourite ??
                                                      false);
                                                });
                                              },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: state.restaurents.length,
              );
      },
    );
  }
}
