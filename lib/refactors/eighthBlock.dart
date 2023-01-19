//todo {best of local} block
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodwifi/model/mainmodel.dart';
import 'package:foodwifi/refactors/skeletonBlock.dart';

class EighthBlock extends StatelessWidget {
  const EighthBlock({
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
        height: 358,
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(
              // !boxcontainer
              height: 358,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    //! top of {best of local}
                    padding: const EdgeInsets.only(top: 28.0, left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              alldata[7].title!,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 6.0),
                            //   child: CircleAvatar(
                            //     backgroundColor: Colors.grey[300],
                            //     radius: 10,
                            //     child: Icon(
                            //       Icons.arrow_forward_outlined,
                            //       size: 12,
                            //       color: Colors.black,
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          alldata[7].description!,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.grey[600]),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: firstlistitem.isEmpty
                          ? const Center(
                              child: Skeleton(
                                height: 320,
                              ),
                            )
                          : ListView.builder(
                              controller: PageController(viewportFraction: .09),
                              scrollDirection: Axis.horizontal,
                              physics: const PageScrollPhysics()
                                  .applyTo(const BouncingScrollPhysics()),
                              itemCount: firstlistitem[7].length,
                              itemBuilder: ((
                                context,
                                index,
                              ) {
                                return Padding(
                                  padding:
                                      //!top_of_image_{best of local}
                                      const EdgeInsets.only(
                                          top: 18, left: 16, right: 16),
                                  child: Container(
                                      color: Colors.white,
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitem[7][index]!.img}',
                                              height: 242,
                                              width: 420,
                                              fit: BoxFit.cover,
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      const Skeleton(
                                                radius: 50,
                                                height: 75,
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: 420,
                                                decoration: BoxDecoration(
                                                    gradient:
                                                        const LinearGradient(
                                                            colors: [
                                                          Color.fromARGB(
                                                              0, 255, 255, 255),
                                                          Colors.black26,
                                                          Colors.black54,
                                                          Color.fromARGB(
                                                              221, 19, 19, 19)
                                                        ],
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding: const EdgeInsets.only(
                                                    left: 16,
                                                    bottom: 8,
                                                    top: 12.0),
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        firstlistitem[7][index]!
                                                            .title!,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      SizedBox(
                                                        height: 6,
                                                      ),

                                                      firstlistitem[7][index]!
                                                                  .description ==
                                                              null
                                                          ? SizedBox()
                                                          : Text(
                                                              firstlistitem[7]
                                                                      [index]!
                                                                  .description!,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      //! < rating n time n distance
                                                      Row(
                                                        // crossAxisAlignment:
                                                        //     CrossAxisAlignment.end,
                                                        children: [
                                                          Text(
                                                            firstlistitem[7]
                                                                    [index]!
                                                                .distance
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .white),
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
                                                            firstlistitem[7]
                                                                    [index]!
                                                                .time
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .white),
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
                                                          Column(
                                                            children: [
                                                              Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                        .yellow[
                                                                    800],
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
                                                            firstlistitem[7]
                                                                    [index]!
                                                                .rating
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ],
                                                      ),
                                                      //! > rating n time n distance
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 32,
                                              )
                                            ],
                                          )
                                        ],
                                      )),
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
