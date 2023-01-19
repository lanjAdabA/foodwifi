import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //! {background/}
          Stack(
            children: [
              //todo {backgroundimage}
              Column(
                children: [
                  Container(
                    height: 270,
                    decoration: BoxDecoration(color: Colors.deepOrangeAccent),
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
          ),
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 220.0),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      // side: BorderSide(width: 5, color: Colors.green),
                    ),
                    elevation: 12,
                    child: Container(
                      decoration: BoxDecoration(
                          // color: Colors.white,
                          // borderRadius: BorderRadius.circular(30),
                          ),
                      height: 228,
                    ),
                  ),
                ),
              ),
              //!sliver_Appbar
              //!_appbar_ends_here_⬆️

              //!_<_sliverItem_Starts_from_here

              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: 14,
                    ),
                    // FirstBlock(firstlistitem: firstlistitem),
                    // SecondBlock(firstlistitem: firstlistitem),

                    //
                    Container(
                      color: Colors.white,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 8,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 120,
                              color: Colors.grey[300],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
