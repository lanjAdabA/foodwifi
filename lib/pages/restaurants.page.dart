//!_{}
import 'dart:developer';
import 'package:auto_route/auto_route.dart';
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

class RestaurantPage extends StatefulWidget {
  final String id;

  const RestaurantPage({super.key, required this.id});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  bool isSwitched = false;

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

  @override
  void initState() {
    super.initState();
    getdata();
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
                    child: SingleChildScrollView(
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
                                        // ListView.builder(
                                        //   physics:
                                        //       NeverScrollableScrollPhysics(),
                                        //   itemCount: 2,
                                        //   shrinkWrap: true,
                                        //   itemBuilder: (BuildContext context,
                                        //       int index) {
                                        //     return Container(
                                        //       color: Colors.white,
                                        //       height: 190,
                                        //     );
                                        //   },
                                        // ),
                                        //Todo {What people say}

                                        reviewBlock(
                                          id: widget.id,
                                        ),
                                        // Container(
                                        //   height: 138,
                                        //   color: Colors.green,
                                        // ),

                                        //!{_restaurant menu item part}

                                        MenuItemsList(
                                          id: widget.id,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                //!>_{front_screen-whole}
              ],
            ),
    );
  }
}
