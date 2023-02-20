//! sliver appbar for main dashboard

import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:foodwifi/router/router.gr.dart';

class SLiverAppBar extends StatefulWidget {
  const SLiverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SLiverAppBar> createState() => _SLiverAppBarState();
}

class _SLiverAppBarState extends State<SLiverAppBar> {
  String anitext = '';
  List<String> allnames = [
    'Momo',
    'Chow',
    'Pizza',
    'Burger',
    'Biryani',
    'Donut'
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SliverLayoutBuilder(builder: (context, constraints) {
      var scrollvalue = constraints.scrollOffset;
      return SliverAppBar(
        toolbarHeight: height / 9.99,
        floating: true, pinned: true,
        backgroundColor: Colors.blueGrey[100],

        //!sliver_Appbar_leading

        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.location_on_sharp,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "DELIVER TO",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: width * 0.734,
                                child: Text(
                                  "RW4X=9QR, Kyamgei,Nongpok Inkhol, Imphal, Manipur-795005, India",
                                  // "sample",
                                  maxLines: 1,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey[600],
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 18.0),
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
                  child: InkWell(
                    onTap: () {
                      var ind = allnames.indexOf(anitext);

                      context.router.push(SearchFilterRoute(
                          searchname: allnames[ind >= 1 ? ind - 1 : 5]));
                      log("searchfilters page triggered");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      height: height / 25,
                      child: Center(
                        child: scrollvalue > 0
                            // //?  SEARCHBAR TEXT
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("What are you craving?"),
                                ],
                              )
                            : Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 18, right: 20),
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  AnimatedTextKit(
                                    onNext: (p0, p1) {
                                      setState(() {
                                        anitext = allnames[p0];
                                      });
                                      // log(p0.toString());
                                    },
                                    repeatForever: true,
                                    displayFullTextOnTap: true,
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        anitext,
                                        speed: Duration(milliseconds: 150),
                                        textStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[600]),
                                      ),
                                      TyperAnimatedText(
                                        anitext,
                                        speed: Duration(milliseconds: 150),
                                        textStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[600]),
                                      ),
                                      TyperAnimatedText(
                                        anitext,
                                        speed: Duration(milliseconds: 150),
                                        textStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[600]),
                                      ),
                                      TyperAnimatedText(
                                        anitext,
                                        speed: Duration(milliseconds: 150),
                                        textStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[600]),
                                      ),
                                      TyperAnimatedText(
                                        anitext,
                                        speed: Duration(milliseconds: 150),
                                        textStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[600]),
                                      ),
                                      TyperAnimatedText(
                                        anitext,
                                        speed: Duration(milliseconds: 150),
                                        textStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[600]),
                                      ),
                                    ],
                                    onTap: () {
                                      print("Tap Event");
                                    },
                                  ),
                                ],
                              ),

                        //!_searchbar_using_textField
                        //                           TextField(
                        //                         readOnly: true,
                        //                         onTap: () {
                        //                           var ind = allnames.indexOf(anitext);

                        //                           context.router.push(SearchFilterRoute(
                        //                               searchname: allnames[ind >= 1 ? ind - 1 : 5]));
                        //                           log("searchfilters page triggered");
                        //                         },
                        //                         decoration: InputDecoration(
                        // //?  SEARCHBAR TEXT
                        //                           hintText:
                        //                               scrollvalue > 0 ? "What are you craving?" : '',
                        //                           floatingLabelBehavior: FloatingLabelBehavior.never,
                        //                           icon: const Padding(
                        //                             padding: EdgeInsets.only(left: 18.0),
                        //                             child: Icon(
                        //                               Icons.search,
                        //                               color: Colors.grey,
                        //                             ),
                        //                           ),
                        //                           focusedBorder: OutlineInputBorder(
                        //                             borderRadius: BorderRadius.circular(10),
                        //                             borderSide: const BorderSide(
                        //                               width: 1,
                        //                               color: Color.fromARGB(255, 241, 241, 241),
                        //                             ),
                        //                           ),
                        //                           enabledBorder: OutlineInputBorder(
                        //                             borderRadius: BorderRadius.circular(10),
                        //                             borderSide: const BorderSide(
                        //                               width: 1,
                        //                               color: Color.fromARGB(255, 241, 241, 241),
                        //                             ),
                        //                           ),
                        //                           label: scrollvalue > 0
                        // //?  SEARCHBAR TEXT
                        //                               ? Column(
                        //                                   mainAxisAlignment: MainAxisAlignment.center,
                        //                                   children: [
                        //                                     Text("What are you craving?"),
                        //                                   ],
                        //                                 )
                        //                               : AnimatedTextKit(
                        //                                   onNext: (p0, p1) {
                        //                                     setState(() {
                        //                                       anitext = allnames[p0];
                        //                                     });
                        //                                     // log(p0.toString());
                        //                                   },
                        //                                   repeatForever: true,
                        //                                   displayFullTextOnTap: true,
                        //                                   animatedTexts: [
                        //                                     TyperAnimatedText(
                        //                                       anitext,
                        //                                       speed: Duration(milliseconds: 150),
                        //                                       textStyle: TextStyle(
                        //                                           fontSize: 18,
                        //                                           fontWeight: FontWeight.w400,
                        //                                           color: Colors.grey[600]),
                        //                                     ),
                        //                                     TyperAnimatedText(
                        //                                       anitext,
                        //                                       speed: Duration(milliseconds: 150),
                        //                                       textStyle: TextStyle(
                        //                                           fontSize: 18,
                        //                                           fontWeight: FontWeight.w400,
                        //                                           color: Colors.grey[600]),
                        //                                     ),
                        //                                     TyperAnimatedText(
                        //                                       anitext,
                        //                                       speed: Duration(milliseconds: 150),
                        //                                       textStyle: TextStyle(
                        //                                           fontSize: 18,
                        //                                           fontWeight: FontWeight.w400,
                        //                                           color: Colors.grey[600]),
                        //                                     ),
                        //                                     TyperAnimatedText(
                        //                                       anitext,
                        //                                       speed: Duration(milliseconds: 150),
                        //                                       textStyle: TextStyle(
                        //                                           fontSize: 18,
                        //                                           fontWeight: FontWeight.w400,
                        //                                           color: Colors.grey[600]),
                        //                                     ),
                        //                                     TyperAnimatedText(
                        //                                       anitext,
                        //                                       speed: Duration(milliseconds: 150),
                        //                                       textStyle: TextStyle(
                        //                                           fontSize: 18,
                        //                                           fontWeight: FontWeight.w400,
                        //                                           color: Colors.grey[600]),
                        //                                     ),
                        //                                     TyperAnimatedText(
                        //                                       anitext,
                        //                                       speed: Duration(milliseconds: 150),
                        //                                       textStyle: TextStyle(
                        //                                           fontSize: 18,
                        //                                           fontWeight: FontWeight.w400,
                        //                                           color: Colors.grey[600]),
                        //                                     ),
                        //                                   ],
                        //                                   onTap: () {
                        //                                     print("Tap Event");
                        //                                   },
                        //                                 ),
                        //                         ),
                        //                         showCursor: false,
                        //                       ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
