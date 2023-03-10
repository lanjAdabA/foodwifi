//! restaurantPage
//! loc: dashboard>OffersForYou>restaurantsPage

import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodwifi/logics/restaurantsMenuDetails/cubit/restaurants_menu_list_cubit.dart';
import 'package:foodwifi/model/review_modal_modified.model.dart';
import 'package:foodwifi/model/restaurantspage.model.dart';
import 'package:foodwifi/refactors/FloatingCard.dart';
import 'package:foodwifi/refactors/MenuItemListSkeleton.dart';
import 'package:foodwifi/refactors/menulistwithreviews.dart';
import 'package:foodwifi/refactors/skeletonBlock.dart';
import 'package:foodwifi/refactors/vegonlylist.dart';
import 'package:foodwifi/router/router.gr.dart';
import 'package:foodwifi/services/serviceApi.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class RestaurantPage extends StatefulWidget {
  final Product? product;
  final int index;
  final bool iscomingfromsearch;
  final String id;
  final String itemname;

  const RestaurantPage({
    super.key,
    required this.id,
    required this.itemname,
    this.product,
    required this.index,
    required this.iscomingfromsearch,
  });

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  bool isSwitched = false;
  bool showappbar = false;
  double scrolloffset = 0;
  String itemname = '';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }

  RestaurantsPageModel? alldata;
  List<ReviewModalModified?>? restaurantdata;
  ScrollController? controller;
  DraggableScrollableController dragController =
      DraggableScrollableController();
  ItemScrollController itemScrollController = ItemScrollController();
  ScrollDirection? direction;
  ScrollDirection? direction2;
  ItemPositionsListener? itemPositionsListener;
  @override
  void initState() {
    super.initState();
    itemPositionsListener = ItemPositionsListener.create();
    controller = ScrollController();

    getdata();
    context
        .read<RestaurantsMenuListCubit>()
        .getrestaurantsdetaildata(id: widget.id);

    //<
    if (widget.iscomingfromsearch) {
      Future.delayed(const Duration(seconds: 1), () {
        controller!
            .animateTo(
          controller!.position.maxScrollExtent / 1.11,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 600),
        )
            .whenComplete(() {
          setState(() {
            showappbar = true;
          });
          log('index  :${widget.index}');
          scrollTo(widget.index);
        }).whenComplete(() {
          Future.delayed(const Duration(milliseconds: 1200), () {
            context.router.push(ProductDetailRoute(product: widget.product!));
          });
        });
      });
    }
    //>

    controller!.addListener(() {
      if (direction2 == ScrollDirection.reverse) {
        log('??????');
        if (controller!.hasClients && controller!.offset > 700) {
          setState(() {
            showappbar = true;
          });
        } else {
          setState(() {
            showappbar = false;
          });
        }
      } else if (direction2 == ScrollDirection.forward) {
        log("??????");
        if (controller!.hasClients && controller!.offset < 700) {
          setState(() {
            showappbar = false;
          });
        }
      }
      log("singlechild" + controller!.offset.toString());
    });
  }

  int? min;
  double? progress;
  void scrollTo(int index) => itemScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
      alignment: widget.iscomingfromsearch ? 0.05 : 0.12);

  getdata() async {
    var allrestaurantsdata =
        await ServiceApi().getRestaurantsProductData(id: widget.id);

    setState(() {
      alldata = allrestaurantsdata;
    });
  }

  Widget build(BuildContext context) {
    final allproductbelowdata = context.watch<RestaurantsMenuListCubit>().state;

    List<ReviewModalModified?>? allvegdatalist = allproductbelowdata.vegdata;
    List<ReviewModalModified?>? allbelowitems =
        allproductbelowdata.allbelowitems;
    restaurantdata = allproductbelowdata.allbelowitems;

    return Scaffold(
      body: alldata == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(
                      'Serving You is our pleasure',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  LoadingAnimationWidget.waveDots(
                    color: Colors.grey,
                    size: 26,
                  ),
                ],
              ),
            )
          : Stack(
              children: [
                //! {background/}
                BackgroundSection(alldata: alldata),

                //! <_{front_Sreen-whole}
                Positioned(
                  top: 220,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  //todo ScrollView

                  child: NotificationListener<UserScrollNotification>(
                    onNotification: (notification) {
                      direction2 = notification.direction;

                      log('Progress :$progress');

                      return true;
                    },
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowIndicator();
                        return true;
                      },
                      child: SingleChildScrollView(
                        physics: progress == null
                            ? const AlwaysScrollableScrollPhysics()
                            : progress == 0.0
                                ? const AlwaysScrollableScrollPhysics()
                                : const NeverScrollableScrollPhysics(),
                        //!
                        //!
                        //!
                        //! scroll controller is disabled in debugging as its laggy in debug mode
                        //!
                        //!
                        //!
                        controller: controller, //todo: to be used for scrolling
                        clipBehavior: Clip.none,
                        child: Column(
                          children: [
                            //! <_{floating card}
                            floatingCard(alldata: alldata),
                            //! >_{floating card}
                            Container(
                              child: Column(
                                children: [
                                  //? padding btn Floatingcard and list
                                  SizedBox(
                                    height: 14,
                                  ),

                                  Container(
                                      color: Colors.grey[200],
                                      child: Column(
                                        children: [
                                          //! burger Ads
                                          Container(
                                            color: Colors.white,
                                            child: Padding(
                                              //! burger Ads
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Image.asset(
                                                'assets/images/burgerAd.png',
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                              ),
                                            ),
                                          ),
                                          //! veg nonveg toggle button height
                                          Container(
                                            height: 52,
                                            color: Colors.white,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(6.0),
                                                  child: Switch(
                                                    onChanged: toggleSwitch,
                                                    value: isSwitched,
                                                    activeColor:
                                                        Colors.greenAccent[400],
                                                    activeTrackColor:
                                                        Colors.greenAccent,
                                                    inactiveThumbColor:
                                                        Colors.white,
                                                    inactiveTrackColor:
                                                        Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  "Veg only",
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                )
                                              ],
                                            ),
                                          ),
                                          //! toggle Button end postition
                                          isSwitched
                                              ? Column(
                                                  children: [
                                                    SizedBox(
                                                      child: ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          physics: showappbar
                                                              ? const BouncingScrollPhysics()
                                                              : const NeverScrollableScrollPhysics(),
                                                          itemCount:
                                                              allvegdatalist
                                                                  .length,
                                                          shrinkWrap: true,
                                                          itemBuilder:
                                                              ((context,
                                                                  index) {
                                                            return VegetableonlyListPage(
                                                                allvegdatalist:
                                                                    allvegdatalist,
                                                                ind: index,
                                                                id: widget.id);
                                                          })),
                                                    )
                                                  ],
                                                )
                                              : Column(
                                                  children: [
                                                    allbelowitems.isEmpty
                                                        ? MenuItemListSkeleton()
                                                        : SizedBox(
                                                            height:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height,
                                                            child: NotificationListener<
                                                                UserScrollNotification>(
                                                              onNotification:
                                                                  (notification) {
                                                                direction =
                                                                    notification
                                                                        .direction;
                                                                progress =
                                                                    notification
                                                                        .metrics
                                                                        .pixels;
                                                                log('Pixels :${notification.metrics.pixels}');
                                                                log('max scroll index :${notification.metrics.maxScrollExtent}');

                                                                if (direction ==
                                                                    ScrollDirection
                                                                        .reverse) {
                                                                  log('down');

                                                                  setState(() {
                                                                    showappbar =
                                                                        true;
                                                                  });
                                                                } else if (direction ==
                                                                    ScrollDirection
                                                                        .forward) {
                                                                  if (progress ==
                                                                      0) {
                                                                    setState(
                                                                        () {
                                                                      showappbar =
                                                                          false;
                                                                    });
                                                                  }
                                                                }

                                                                log('Progress :$progress');

                                                                return true;
                                                              },
                                                              child:
                                                                  ScrollablePositionedList
                                                                      .builder(
                                                                itemPositionsListener:
                                                                    itemPositionsListener,
                                                                itemScrollController:
                                                                    itemScrollController,
                                                                physics: showappbar
                                                                    ? const AlwaysScrollableScrollPhysics()
                                                                    : const NeverScrollableScrollPhysics(),
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount:
                                                                    allbelowitems
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  //! restaurent menu details list
                                                                  return MenuItemList(
                                                                    allbelowdata:
                                                                        allbelowitems,
                                                                    nameindex:
                                                                        index,
                                                                    id: widget
                                                                        .id,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                  ],
                                                )
                                        ],
                                      )),
                                ],
                              ),
                            ),

                            alldata == null
                                ? SizedBox()
                                : Container(
                                    color: Colors.grey[50],
                                    height: 80,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Prices on this menu are set directly by the Merchant.",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 13),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              "Prices may differ between Delivery and Dine_in. ",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                //!>_{front_screen-whole}

                //!_<{pop up appbar}
                showappbar
                    ? Material(
                        elevation: 4,
                        child: Container(
                          height: 116,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: SafeArea(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: InkWell(
                                              onTap: () {
                                                context.router.pop();
                                              },
                                              child: Icon(
                                                Icons.arrow_back_ios_new,
                                                size: 20,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            widget.itemname,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'CLOSED',
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.redAccent),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.favorite_outline,
                                        color: Colors.grey[600],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16, left: 15, right: 15),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            log('pressed');
                                            showFlexibleBottomSheet<void>(
                                              useRootNavigator: true,
                                              //! background Trenslucent
                                              barrierColor: Colors.black38,
                                              draggableScrollableController:
                                                  dragController,
                                              duration: const Duration(
                                                  milliseconds: 450),
                                              isModal: true,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20))),
                                              isCollapsible: false,
                                              minHeight: 0.1,
                                              initHeight: 0.5,
                                              maxHeight: 0.85,
                                              context: context,
                                              bottomSheetColor:
                                                  Colors.transparent,
                                              builder: (context, controller,
                                                  offset) {
                                                log('Scrollcntroller :$offset');
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, top: 15),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 5,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .grey[400],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            13,
                                                      ),
                                                      Flexible(
                                                        child: Container(
                                                          child: ListView
                                                              .separated(
                                                            shrinkWrap: true,
                                                            physics:
                                                                const BouncingScrollPhysics(),
                                                            controller:
                                                                controller,
                                                            itemCount:
                                                                restaurantdata!
                                                                    .length,
                                                            padding:
                                                                EdgeInsets.zero,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    itemname = restaurantdata![
                                                                            index]!
                                                                        .categoryName!;
                                                                  });
                                                                  log('Index :$index');

                                                                  scrollTo(
                                                                      index);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 5,
                                                                      bottom:
                                                                          10),
                                                                  child: Text(
                                                                    restaurantdata![
                                                                            index]!
                                                                        .categoryName!,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            separatorBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return const Divider(
                                                                color:
                                                                    Colors.grey,
                                                                thickness: .5,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              anchors: [0.1, 0.8],
                                            );
                                          },
                                          child: ValueListenableBuilder<
                                              Iterable<ItemPosition>>(
                                            valueListenable:
                                                itemPositionsListener!
                                                    .itemPositions,
                                            builder:
                                                (context, positions, child) {
                                              if (positions.isNotEmpty) {
                                                min = positions
                                                    .where((ItemPosition
                                                            position) =>
                                                        position
                                                            .itemTrailingEdge >
                                                        0.14)
                                                    .reduce((ItemPosition min,
                                                        ItemPosition position) {
                                                  return position
                                                              .itemTrailingEdge <
                                                          min.itemTrailingEdge
                                                      ? position
                                                      : min;
                                                }).index;
                                                log('min :$min');
                                                if (restaurantdata != null) {
                                                  itemname =
                                                      restaurantdata![min!]!
                                                          .categoryName!;
                                                }
                                              }
                                              return ItemDropDown(
                                                  itemname: itemname);
                                            },
                                          ),
                                        ),
                                        //! <search button
                                        SearchInAppbar()
                                        //! >search button
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox()
                //!_>{pop up appbar}
              ],
            ),
    );
  }
}

class ItemDropDown extends StatelessWidget {
  const ItemDropDown({
    Key? key,
    required this.itemname,
  }) : super(key: key);

  final String itemname;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              itemname.isEmpty ? "checking..." : itemname,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}

class SearchInAppbar extends StatelessWidget {
  const SearchInAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.search,
            size: 14,
          ),
          SizedBox(
            width: 5,
          ),
          Text('Search')
        ],
      ),
    );
  }
}

class BackgroundSection extends StatelessWidget {
  const BackgroundSection({
    Key? key,
    required this.alldata,
  }) : super(key: key);

  final RestaurantsPageModel? alldata;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //todo {backgroundimage}
        Column(
          children: [
            CachedNetworkImage(
              fadeInDuration: const Duration(seconds: 1),
              fit: BoxFit.fitWidth,
              imageUrl:
                  'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${alldata!.img}',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const Skeleton(
                height: 185,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ],
        ),
        //todo {back_icon and fav_icon}
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 42),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  context.router.pop();
                  log("back");
                },
                child: CircleAvatar(
                  backgroundColor: Colors.black26,
                  radius: 24,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.black26,
                radius: 24,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
