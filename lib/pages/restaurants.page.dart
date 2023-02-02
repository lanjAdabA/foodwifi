//!_{resturant page }
import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodwifi/model/restaurantsdetails.model.dart';
import 'package:foodwifi/model/restaurantspage.model.dart';
import 'package:foodwifi/refactors/FloatingCard.dart';
import 'package:foodwifi/refactors/menu_item_list_first.dart';
import 'package:foodwifi/refactors/menuitemslist.dart';
import 'package:foodwifi/refactors/reviewBlock.dart';
import 'package:foodwifi/refactors/skeletonBlock.dart';
import 'package:foodwifi/services/serviceApi.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class RestaurantPage extends StatefulWidget {
  final String id;
  final String itemname;

  const RestaurantPage({
    super.key,
    required this.id,
    required this.itemname,
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
  List<RestaurantsDetailsModel?>? restaurantdata;
  ScrollController controller = ScrollController();
  DraggableScrollableController dragController =
      DraggableScrollableController();
  ItemScrollController itemScrollController = ItemScrollController();
  ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  void scrollTo(int index) {
    if (itemScrollController.isAttached) {
      itemScrollController.scrollTo(
          index: index,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOutCubic,
          alignment: 0);
    }
  }

  @override
  void initState() {
    super.initState();
    getdata();

    controller.addListener(() {
      if (controller.hasClients && controller.offset > 700) {
        setState(() {
          showappbar = true;
        });
      } else {
        setState(() {
          showappbar = false;
        });
      }
      scrolloffset = controller.offset;
      log(
        scrolloffset.toString(),
      );
    });
  }

  getdata() async {
    var allrestaurantsdata =
        await ServiceApi().getRestaurantsProductData(id: widget.id);
    var restaurantsdatadetails =
        await ServiceApi().getrestaurantsdetaildata(id: widget.id);

    setState(() {
      alldata = allrestaurantsdata;
      restaurantdata = restaurantsdatadetails;
    });
  }

  Widget build(BuildContext context) {
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
                Stack(
                  children: [
                    //todo {backgroundimage}
                    Column(
                      children: [
                        CachedNetworkImage(
                          fadeInDuration: const Duration(seconds: 1),
                          fit: BoxFit.fitWidth,
                          imageUrl:
                              'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${alldata!.img}',
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  const Skeleton(
                            height: 185,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ],
                    ),
                    //todo {back_icon and fav_icon}
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 42),
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
                ),

                //! <_{front_Sreen-whole}
                Positioned(
                  top: 220,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  //todo ScrollView

                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll) {
                      overscroll.disallowIndicator();
                      return true;
                    },
                    child: SingleChildScrollView(
                      //! scroll controller is disabled in debugging as its laggy in debug mode
                      // controller: controller,
                      clipBehavior: Clip.none,
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          //! <_{floating card}
                          floatingCard(alldata: alldata),
                          //! >_{floating card}
                          Container(
                            child: Column(
                              children: [
                                //? padding btn card and list
                                SizedBox(
                                  height: 14,
                                ),

                                Container(
                                    color: Colors.grey[200],
                                    child: Column(
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Image.asset(
                                              'assets/images/burgerAd.png',
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                            ),
                                          ),
                                        ),
                                        Container(
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
                                                style: TextStyle(fontSize: 16),
                                              )
                                            ],
                                          ),
                                          height: 52,
                                          color: Colors.white,
                                        ),
                                        //todo {non_veg item filtered}
                                        MenuItemsListFirst(
                                          id: widget.id,
                                        ),

                                        //Todo {What people say}

                                        reviewBlock(
                                          id: widget.id,
                                        ),

                                        //!{_restaurant menu item part}

                                        MenuItemsList(
                                          id: widget.id,
                                          itemPositionsListener:
                                              itemPositionsListener,
                                          itemScrollController:
                                              itemScrollController,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ],
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
                          height: 120,
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
                                      top: 10, left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          log('pressed');
                                          showFlexibleBottomSheet<void>(
                                            useRootNavigator: true,
                                            barrierColor: Colors.black38,
                                            draggableScrollableController:
                                                dragController,
                                            duration: const Duration(
                                                milliseconds: 450),
                                            isModal: true,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20))),
                                            isCollapsible: false,
                                            minHeight: 0.1,
                                            initHeight: 0.5,
                                            maxHeight: 0.85,
                                            context: context,
                                            bottomSheetColor: Colors.white,
                                            builder:
                                                (context, controller, offset) {
                                              log('Scrollcntroller :$offset');
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, top: 15),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 5,
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      width: 40,
                                                    ),
                                                    Flexible(
                                                      child: Container(
                                                        child:
                                                            ListView.separated(
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
                                                                      .categoryName;
                                                                });
                                                                scrollTo(index);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 5,
                                                                        bottom:
                                                                            10),
                                                                child: Text(
                                                                  restaurantdata![
                                                                          index]!
                                                                      .categoryName,
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
                                                              thickness: 1,
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
                                        child: Container(
                                          height: 32,
                                          width: 300,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.grey[200],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  itemname,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14),
                                                ),
                                                const Icon(
                                                  Icons
                                                      .keyboard_arrow_down_outlined,
                                                  size: 20,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        height: 32,
                                        width: 140,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.grey[200]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.search,
                                              size: 18,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Search',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                ValueListenableBuilder<Iterable<ItemPosition>>(
                                  valueListenable:
                                      itemPositionsListener.itemPositions,
                                  builder: (context, positions, child) {
                                    int? min;
                                    int? max;
                                    if (positions.isNotEmpty) {
                                      // Determine the first visible item by finding the item with the
                                      // smallest trailing edge that is greater than 0.  i.e. the first
                                      // item whose trailing edge in visible in the viewport.
                                      min = positions
                                          .where((ItemPosition position) =>
                                              position.itemTrailingEdge > 0)
                                          .reduce((ItemPosition min,
                                                  ItemPosition position) =>
                                              position.itemTrailingEdge <
                                                      min.itemTrailingEdge
                                                  ? position
                                                  : min)
                                          .index;
                                      log(min.toString());
                                      // Determine the last visible item by finding the item with the
                                      // greatest leading edge that is less than 1.  i.e. the last
                                      // item whose leading edge in visible in the viewport.
                                      max = positions
                                          .where((ItemPosition position) =>
                                              position.itemLeadingEdge < 1)
                                          .reduce((ItemPosition max,
                                                  ItemPosition position) =>
                                              position.itemLeadingEdge >
                                                      max.itemLeadingEdge
                                                  ? position
                                                  : max)
                                          .index;
                                    }
                                    return SizedBox(
                                      height: 10,
                                    );
                                  },
                                )
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
