//todo {new on foodwifi} block
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodwifi/model/mainmodel.dart';
import 'package:foodwifi/refactors/skeletonBlock.dart';

class FifthBlock extends StatelessWidget {
  const FifthBlock({
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
        height: 340,
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(
              // !boxcontainer
              height: 340,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    //! top of { new on foodwifi}
                    padding: const EdgeInsets.only(top: 28.0, left: 16),
                    child: Row(
                      children: [
                        Text(
                          alldata[4].title!,
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
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: firstlistitem.isEmpty
                          ? const Skeleton(
                              height: 300,
                            )
                          : ListView.builder(
                              controller:
                                  PageController(viewportFraction: 0.73),
                              scrollDirection: Axis.horizontal,
                              physics: const PageScrollPhysics()
                                  .applyTo(const BouncingScrollPhysics()),
                              itemCount: firstlistitem[4].length,
                              itemBuilder: ((
                                context,
                                index,
                              ) {
                                return Padding(
                                  padding:
                                      //!top_of_{new on foodwifi}
                                      const EdgeInsets.only(
                                          top: 14, left: 16, right: 1),
                                  child: Container(
                                      color: Colors.white,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitem[4][index]!.img}',
                                              height: 180,
                                              width: 180,
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
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8, top: 12.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  firstlistitem[4][index]!
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
                                                  firstlistitem[4][index]!
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
                                                    Text(
                                                      firstlistitem[4][index]!
                                                          .time
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Colors.grey[700]),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      child: Icon(
                                                        Icons.circle,
                                                        size: 2,
                                                      ),
                                                    ),
                                                    Text(
                                                      firstlistitem[4][index]!
                                                          .distance
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Colors.grey[700]),
                                                    ),
                                                  ],
                                                ),
                                                //! > rating n time n distance
                                              ],
                                            ),
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
