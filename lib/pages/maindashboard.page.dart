import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodwifi/logics/cubit/fetch_data_cubit.dart';
import 'package:foodwifi/model/mainmodel.dart';
import 'package:foodwifi/refactors/eighthBlock.dart';
import 'package:foodwifi/refactors/fifthBlock.dart';
import 'package:foodwifi/refactors/firstBlock.dart';
import 'package:foodwifi/refactors/fourthBlock.dart';
import 'package:foodwifi/refactors/ninthBlock.dart';
import 'package:foodwifi/refactors/secondBlock.dart';
import 'package:foodwifi/refactors/seventhBlock.dart';
import 'package:foodwifi/refactors/sixthBlock.dart';
import 'package:foodwifi/refactors/sliverAppBar.dart';
import 'package:foodwifi/refactors/thirdBlock.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeDashboardPage extends StatefulWidget {
  const HomeDashboardPage({super.key});

  @override
  State<HomeDashboardPage> createState() => _HomeDashboardPageState();
}

class _HomeDashboardPageState extends State<HomeDashboardPage> {
  @override
  Widget build(BuildContext context) {
    final data = context.watch<FetchdatablocCubit>().state;

    List<Foodwifimodel> alldata = data.alldata;

    List<List<Item?>> firstlistitem = data.firstlistitem;
    log(firstlistitem.toString());
    log("firstlistitem");
    log(alldata.toString());
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: alldata.isEmpty
            ? Center(
                child: LoadingAnimationWidget.twistingDots(
                  // color: Colors.grey,
                  size: 26, leftDotColor: Colors.red,
                  rightDotColor: Colors.blue,
                ),
              )
            : SafeArea(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi, USER NAME",
                                    style: TextStyle(
                                        color: Colors.red[600],
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "Welcome back!",
                                    style: TextStyle(
                                        color: Colors.red[600], fontSize: 12),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.red[600],
                                    child: const Icon(
                                      Icons.favorite,
                                      size: 18,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    //!sliver_Appbar
                    SLiverAppBar(),
                    //!_appbar_ends_here_⬆️

                    //!_<_sliverItem_Starts_from_here

                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          FirstBlock(firstlistitem: firstlistitem),
                          SecondBlock(firstlistitem: firstlistitem),
                          ThirdBlock(
                              alldata: alldata, firstlistitem: firstlistitem),
                          FourthBlock(
                              alldata: alldata, firstlistitem: firstlistitem),
                          FifthBlock(
                              alldata: alldata, firstlistitem: firstlistitem),
                          SixthBlock(
                              alldata: alldata, firstlistitem: firstlistitem),
                          SeventhBlock(
                              alldata: alldata, firstlistitem: firstlistitem),
                          EighthBlock(
                              alldata: alldata, firstlistitem: firstlistitem),
                          NinthBlock(
                              alldata: alldata, firstlistitem: firstlistitem),
                          //
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 32,
                                  color: Colors.grey[300],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
  }
}
