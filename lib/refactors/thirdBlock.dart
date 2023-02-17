//todo{ offers for you block}
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodwifi/model/mainmodel.dart';
import 'package:foodwifi/refactors/skeletonBlock.dart';
import 'package:foodwifi/router/router.gr.dart';

class ThirdBlock extends StatelessWidget {
  const ThirdBlock({
    Key? key,
    required this.alldata,
    required this.firstlistitem,
  }) : super(key: key);

  final List<Foodwifimodel> alldata;
  final List<List<Item?>> firstlistitem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        // height: 320, //!inner //!whitecontainer
        height: 320,
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(
              // !boxcontainer
              height: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    //! top of{ offer_for_you}
                    padding: const EdgeInsets.only(top: 28.0, left: 16),
                    child: Row(
                      children: [
                        Text(
                          alldata[1].title!,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 10,
                            child: Icon(
                              Icons.arrow_forward_outlined,
                              size: 12,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: firstlistitem.isEmpty
                          ? const Skeleton(
                              height: 280,
                            )
                          : ListView.builder(
                              controller:
                                  PageController(viewportFraction: 0.67),
                              scrollDirection: Axis.horizontal,
                              physics: const PageScrollPhysics()
                                  .applyTo(const BouncingScrollPhysics()),
                              itemCount: firstlistitem[1].length,
                              itemBuilder: ((
                                context,
                                index,
                              ) {
                                return InkWell(
                                  onTap: () {
                                    log("clicked on restaurants block");
                                    context.router.push(RestaurantRoute(
                                        id: firstlistitem[1][index]!
                                            .id
                                            .toString(),
                                        itemname:
                                            firstlistitem[1][index]!.title!,
                                        index: index,
                                        iscomingfromsearch: false));
                                  },
                                  child: Padding(
                                    padding:
                                        //!top_of_image {offers for you block}
                                        const EdgeInsets.only(
                                            top: 14, left: 16, right: 1),
                                    child: Container(
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              alignment: Alignment.topLeft,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitem[1][index]!.img}',
                                                    height: 172,
                                                    width: 310,
                                                    fit: BoxFit.cover,
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                downloadProgress) =>
                                                            const Skeleton(
                                                      height: 75,
                                                    ),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Icon(Icons.error),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, top: 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    child: Container(
                                                      height: 24,
                                                      color: Color.fromARGB(
                                                          255, 57, 137, 157),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 6,
                                                            ),
                                                            Transform(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              transform: Matrix4
                                                                  .rotationY(
                                                                      60),
                                                              child: const Icon(
                                                                Icons
                                                                    .local_offer,
                                                                color: Colors
                                                                    .white,
                                                                size: 12,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 5),
                                                              child: Text(
                                                                firstlistitem[1]
                                                                        [index]!
                                                                    .offerDescription!,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 6,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8, top: 12.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    firstlistitem[1][index]!
                                                        .title!,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12),
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Text(
                                                    firstlistitem[1][index]!
                                                        .description!,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 10),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  //! < rating n time n distance
                                                  Row(
                                                    // crossAxisAlignment:
                                                    //     CrossAxisAlignment.end,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color: Colors
                                                                .yellow[800],
                                                            size: 11,
                                                          ),
                                                          SizedBox(
                                                            height: 2,
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 2,
                                                      ),
                                                      Text(
                                                        firstlistitem[1][index]!
                                                            .rating
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors
                                                                .grey[700]),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: Icon(
                                                          Icons.circle,
                                                          size: 2,
                                                        ),
                                                      ),
                                                      Text(
                                                        firstlistitem[1][index]!
                                                            .time
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors
                                                                .grey[700]),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: Icon(
                                                          Icons.circle,
                                                          size: 2,
                                                        ),
                                                      ),
                                                      Text(
                                                        firstlistitem[1][index]!
                                                            .distance
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors
                                                                .grey[700]),
                                                      ),
                                                    ],
                                                  ),
                                                  //! > rating n time n distance
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                );
                              }),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
