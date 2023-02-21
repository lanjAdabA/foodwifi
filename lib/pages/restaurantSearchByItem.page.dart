//! RestaurantsPage Search by menu item
//! loc: dashboard>ChooseFromCuisines>restaurantsPageByMenuItem

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodwifi/logics/searchResturantByItem/cubit/search_resturant_by_item_cubit.dart';
import 'package:foodwifi/model/filterChip.model.dart';
import 'package:foodwifi/model/resturant_search_by_item.model.dart';
import 'package:foodwifi/refactors/skeletonBlock.dart';
import 'package:foodwifi/router/router.gr.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RestaurantSearchByItemPage extends StatefulWidget {
  final String itemname;
  final bool issearchfound;
  final String cuisinesId;
  final String storetypeid;
  final String checkname;
  final double spacing = 8;

  bool isSelected = false;

  RestaurantSearchByItemPage(
      {super.key,
      required this.itemname,
      required this.issearchfound,
      required this.cuisinesId,
      required this.storetypeid,
      required this.checkname});

  @override
  State<RestaurantSearchByItemPage> createState() =>
      _RestaurantSearchByItemPageState();
}

class _RestaurantSearchByItemPageState
    extends State<RestaurantSearchByItemPage> {
  bool? ismoreloading;

  int data = 1;
  int datalimit = 15;
  ScrollController controller = ScrollController();
  List<ResturantSearchByItemModel> allsearchdata = [];
  List<ResturantSearchByItemModel> searchres_data = [];

  @override
  void initState() {
    super.initState();
    context.read<SearchResturantByItemCubit>().getresturantSearchByItems(
          itemname: widget.itemname,
          page: 1,
          ismoredata: true,
          // datalimit: datalimit
        );

    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        if (ismoreloading == false) {
          log('Item reach its limit');
        } else {
          setState(() {
            data = data + 1;
            datalimit = datalimit + 15;
          });
          log(data.toString());
          context.read<SearchResturantByItemCubit>().getresturantSearchByItems(
                itemname: widget.itemname,
                page: data,
                ismoredata: true,
                // datalimit: datalimit
              );

          log('reach buttom');
        }
      }
    });
  }

  List searchitems = [
    'Sort by',
    'Store types',
    'Cuisiness',
    'Free delivery',
    'Halal',
    'Promo'
  ];
  @override
  Widget build(BuildContext context) {
    final searchdata = context.watch<SearchResturantByItemCubit>().state;
    ismoreloading = searchdata.isloading;
    allsearchdata = searchdata.searchdata;
    return allsearchdata.isEmpty
        ? Scaffold(
            body: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Skeleton(
                              height: 100,
                              width: 100,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Skeleton(
                                  height: 20,
                                  width: 340,
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Skeleton(
                                  height: 20,
                                  width: 200,
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Skeleton(
                                  height: 20,
                                  width: 250,
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
                Skeleton(
                  height: 8,
                ),
              ],
            ),
          )
        : Scaffold(
            //! wraped with material color to add elevation
            body:
                // ismoreloading == null
                //     ? Skeleton()
                //     :
                Container(
              color: Colors.grey[50],
              child: Stack(
                children: [
                  //!horizontal list item

                  //! vertical scroll section
                  SingleChildScrollView(
                    controller: controller,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: 135,
                            color: Colors.grey[50],
                          ),
                          RestaurantBlockSection(allsearchdata: allsearchdata),
                          Center(
                            child: ismoreloading!
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Column(
                                      children: [
                                        LoadingAnimationWidget.hexagonDots(
                                            color: Colors.grey, size: 26),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Loading more data',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 18),
                                        )
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                          )
                        ],
                      ),
                    ),
                  ),
                  FloatingAppbarPart(
                    searchitems: searchitems,
                    itemname: widget.itemname,
                  ),
                ],
              ),
            ),
          );
  }
}

class RestaurantBlockSection extends StatelessWidget {
  const RestaurantBlockSection({
    Key? key,
    required this.allsearchdata,
  }) : super(key: key);

  final List<ResturantSearchByItemModel> allsearchdata;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 7),
        shrinkWrap: true,
        itemCount: allsearchdata.length,
        itemBuilder: (context, index) {
          return Container(
              child: Column(
            children: [
              //todo : restaurant name section
              InkWell(
                onTap: () {
                  context.router.push(RestaurantRoute(
                      id: allsearchdata[index].id,
                      itemname: allsearchdata[index].title,
                      iscomingfromsearch: false,
                      index: index));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: allsearchdata[index].img == null
                              ? SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: ClipOval(
                                    child: Image.asset(
                                        'assets/images/foodwifilogo.png',
                                        color: Colors.white.withOpacity(0.2),
                                        colorBlendMode: BlendMode.modulate),
                                  ),
                                )
                              : Image.network(
                                  'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${allsearchdata[index].img}'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: SizedBox(
                          height: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                allsearchdata[index].title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: Row(
                                  children: [
                                    Text(
                                      allsearchdata[index].time,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: const Color.fromARGB(
                                              221, 60, 60, 60)),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 3),
                                      child: Icon(
                                        Icons.circle,
                                        size: 2,
                                      ),
                                    ),
                                    Text(
                                      allsearchdata[index].distance,
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              221, 60, 60, 60),
                                          fontSize: 10),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 3),
                                      child: Icon(
                                        Icons.circle,
                                        size: 2,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.star,
                                      size: 11,
                                      color: Color.fromARGB(255, 220, 204, 52),
                                    ),
                                    Text(
                                      allsearchdata[index].rating.toString(),
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: const Color.fromARGB(
                                              221, 60, 60, 60)),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                allsearchdata[index].description,
                                style: TextStyle(
                                    fontSize: 12,
                                    color:
                                        const Color.fromARGB(221, 60, 60, 60)),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              ListView.builder(
                  padding: EdgeInsets.only(bottom: 4),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: allsearchdata[index].items.length,
                  itemBuilder: (context, itemindex) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 5),
                      child: InkWell(
                        onTap: (() {
                          context.router.push(RestaurantRoute(
                              id: allsearchdata[index].id,
                              itemname: allsearchdata[index].title,
                              iscomingfromsearch: true,
                              index: index));
                          // .pop();
                        }),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    // maxLines: 1,
                                    allsearchdata[index].items[itemindex].name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 0.6,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "₹",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      allsearchdata[index]
                                          .items[itemindex]
                                          .price
                                          .toString(),
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 14,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: allsearchdata[index]
                                            .items[itemindex]
                                            .image ==
                                        null
                                    ? SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: ClipOval(
                                          child: Image.asset(
                                              'assets/images/foodwifilogo.png',
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              colorBlendMode:
                                                  BlendMode.modulate),
                                        ),
                                      )
                                    : Image.network(
                                        'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${allsearchdata[index].items[itemindex].image}'),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              Divider(
                color: Colors.grey[200],
                thickness: 6,
              ),
            ],
          ));
        });
  }
}

class FloatingAppbarPart extends StatefulWidget {
  final String itemname;

  FloatingAppbarPart({
    super.key,
    required this.searchitems,
    required this.itemname,
  });

  final List searchitems;

  @override
  State<FloatingAppbarPart> createState() => _FloatingAppbarPartState();
}

class _FloatingAppbarPartState extends State<FloatingAppbarPart> {
  List<FilterChipData> filterChips = FilterChips.all;

  final double spacing = 8;

  final List<bool> _selectedItems = [false, false, false, false, false, false];

  void _onItemSelect(int index) {
    setState(() {
      _selectedItems[index] = !_selectedItems[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 5,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.grey[50],
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.grey[800],
                        size: 20,
                      ),
                      onPressed: () {
                        context.router.pop();
                      },
                    ),
                  ),
                  title: Text(
                    widget.itemname,
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                  centerTitle: true,
                  elevation: 0,
                ),
                Container(
                  color: Colors.grey[50],
                  // color: Colors.amber,
                  height: 44,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: widget.searchitems.length,
                    // itemCount: 1,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return FilterChip(
                        padding: EdgeInsets.zero,
                        // label: Text(filterChip.label),

                        label: Text(
                          widget.searchitems[index],
                        ),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        backgroundColor: Colors.grey.withOpacity(0.1),

                        // selected: filterChip.isSelected,
                        // checkmarkColor: filterChip.color,
                        showCheckmark: false,
                        selectedColor: Colors.green.withOpacity(0.5),
                        shadowColor: Color.fromARGB(255, 192, 191, 191),
                        elevation: 2,
                        selected: _selectedItems[index],
                        onSelected: (bool selected) {
                          _onItemSelect(index);
                        },
                      );
                      // Wrap(
                      //   runSpacing: spacing,
                      //   spacing: spacing,
                      //   children: filterChips
                      //       .map((filterChip) => Padding(
                      //             padding: const EdgeInsets.only(left: 8.0),
                      //             child:

                      //           ))
                      //       .toList(),
                      // );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FilterChips {
  static final all = <FilterChipData>[
    const FilterChipData(
      // label: Text(widget.searchitems[index]),
      //  widget.searchitems[index]
      label: 'FilterChip_1',
      isSelected: false,
      color: Colors.grey,
    ),
    const FilterChipData(
      label: 'FilterChip_2',
      isSelected: false,
      color: Colors.grey,
    ),
    const FilterChipData(
      label: 'FilterChip_3',
      isSelected: false,
      color: Colors.grey,
    ),
    const FilterChipData(
      label: 'FilterChip_4',
      isSelected: false,
      color: Colors.grey,
    ),
    const FilterChipData(
      label: 'FilterChip_5',
      isSelected: false,
      color: Colors.grey,
    ),
    const FilterChipData(
      label: 'FilterChip_6',
      isSelected: false,
      color: Colors.grey,
    ),
  ];
}
