// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodwifi/logics/cubit/fetch_data_cubit.dart';
import 'package:foodwifi/logics/searchfilter/cubit/searchfilter_cubit.dart';

import 'package:foodwifi/model/search_filters.model.dart';
import 'package:foodwifi/pages/restaurantSearchByItem.page.dart';
import 'package:foodwifi/refactors/skeletonBlock.dart';

import '../model/mainmodel.dart';

class SearchFilterPage extends StatefulWidget {
  late String searchname;

  SearchFilterPage({
    super.key,
    required this.searchname,
  });

  @override
  State<SearchFilterPage> createState() => _SearchFilterPageState();
}

class _SearchFilterPageState extends State<SearchFilterPage> {
  TextEditingController? controller;
  List<List<Item?>> firstlistitems = [];
  bool? isitemfound;
  int itemlength = 0;
  bool isvisible = true;
  bool isitemfound2 = false;
  String cuisindata = '';
  String storetypeid = '';
  String checkname = '';

  final _formKey = GlobalKey<FormState>();
  SearchFilterModel? finaltopdata;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    isitemfound = false;

    setState(() {
      controller!.text = widget.searchname;
    });
    context.read<SearchfilterCubit>().gettopsearchdata();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final topdata = context.watch<SearchfilterCubit>().state;
    finaltopdata = topdata.searchfilterdata;
    final data = context.watch<FetchdatablocCubit>().state;

    firstlistitems = data.firstlistitem;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: height * .1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  context.router.pop();
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.grey[800],
                                )),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10)),
                              height: height / 25,
                              width: width / 1.15,
                              child: Center(
                                child: TextField(
                                  cursorWidth: 4,
                                  cursorColor: Colors.grey,
                                  cursorHeight: 20,
                                  controller: controller,
                                  decoration: InputDecoration(
//?  SEARCHBAR TEXT

                                    suffixIcon: Icon(
                                      Icons.close,
                                      color: Colors.grey,
                                    ),

                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    icon: const Padding(
                                      padding: EdgeInsets.only(left: 18.0),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 241, 241, 241),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 241, 241, 241),
                                      ),
                                    ),
                                  ),
                                  showCursor: false,
                                ),
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: height * .006,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.007,
              ),
              Container(
                color: Colors.white,
                height: height,
                child: isitemfound!
                    ? RestaurantSearchByItemPage(
                        itemname: controller!.text,
                        issearchfound: true,
                        cuisinesId: cuisindata,
                        storetypeid: storetypeid,
                        checkname: checkname,
                      )
                    : Visibility(
                        replacement: RestaurantSearchByItemPage(
                          itemname: controller!.text,
                          issearchfound: true,
                          cuisinesId: cuisindata,
                          storetypeid: storetypeid,
                          checkname: checkname,
                        ),
                        visible: isvisible,
                        child: Container(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Cuisines',
                                        style: TextStyle(
                                            color: Colors.red[600],
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text('Store types',
                                          style: TextStyle(
                                              color: Colors.red[600],
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              ),
                              finaltopdata == null
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: ListView.builder(
                                        itemCount: 5,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Column(
                                            children: const [
                                              Skeleton(
                                                height: 24,
                                                radius: 08,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    )
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: finaltopdata!
                                                          .cuisines.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              isitemfound =
                                                                  true;

                                                              cuisindata =
                                                                  finaltopdata!
                                                                      .cuisines[
                                                                          index]
                                                                      .id
                                                                      .toString();
                                                              checkname =
                                                                  'Cuisines';
                                                            });
                                                            FocusScopeNode
                                                                currentFocus =
                                                                FocusScope.of(
                                                                    context);

                                                            if (!currentFocus
                                                                .hasPrimaryFocus) {
                                                              currentFocus
                                                                  .unfocus();
                                                            }
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom: 20),
                                                            child: Text(
                                                                finaltopdata!
                                                                    .cuisines[
                                                                        index]
                                                                    .cuisineName,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15)),
                                                          ),
                                                        );
                                                      }),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: finaltopdata!
                                                          .storeTypes.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              isitemfound =
                                                                  true;
                                                              storetypeid =
                                                                  finaltopdata!
                                                                      .storeTypes[
                                                                          index]
                                                                      .id
                                                                      .toString();
                                                              checkname =
                                                                  'Store types';
                                                            });
                                                            FocusScopeNode
                                                                currentFocus =
                                                                FocusScope.of(
                                                                    context);

                                                            if (!currentFocus
                                                                .hasPrimaryFocus) {
                                                              currentFocus
                                                                  .unfocus();
                                                            }
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom: 20),
                                                            child: Text(
                                                                finaltopdata!
                                                                    .storeTypes[
                                                                        index]
                                                                    .name,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15)),
                                                          ),
                                                        );
                                                      }),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        )),
              )
            ],
          )),
    );
  }
}
