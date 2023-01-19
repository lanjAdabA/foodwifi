//todo {Choose from cuisines} block
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodwifi/model/mainmodel.dart';
import 'package:foodwifi/refactors/skeletonBlock.dart';

class FourthBlock extends StatelessWidget {
  const FourthBlock({
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
        height: 380,
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(
              // !boxcontainer
              height: 380,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    //! top of { Choose from cuisines}
                    padding: const EdgeInsets.only(top: 28.0, left: 16),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            alldata[3].title!,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
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
                            : GridView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 30 / 23.5,
                                        crossAxisCount: 2),
                                itemCount: 8,
                                itemBuilder: (
                                  context,
                                  index,
                                ) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      color: Colors.white,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitem[3][index]!.img}',
                                              height: 100,
                                              width: 100,
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
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            firstlistitem[3][index]!.title!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )

                        // : ListView.builder(
                        //     controller: PageController(
                        //         viewportFraction: 0.73),
                        //     scrollDirection:
                        //         Axis.horizontal,
                        //     physics:
                        //         const PageScrollPhysics()
                        //             .applyTo(
                        //                 const BouncingScrollPhysics()),
                        //     itemCount:
                        //         firstlistitem[3].length,
                        //     itemBuilder: ((
                        //       context,
                        //       index,
                        //     ) {
                        //       return Padding(
                        //         padding:
                        //             const EdgeInsets
                        //                     .only(
                        //                 top: 14,
                        //                 left: 16,
                        //                 right: 16),
                        //         child: Container(
                        //             color: Colors.white,
                        //             child: Column(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment
                        //                       .start,
                        //               children: [
                        //                 ClipRRect(
                        //                   borderRadius:
                        //                       BorderRadius
                        //                           .circular(
                        //                               10),
                        //                   child: Image
                        //                       .network(
                        //                     'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitem[2][index]!.img}',
                        //                     height: 172,
                        //                     width: 300,
                        //                     fit: BoxFit
                        //                         .cover,
                        //                   ),
                        //                 ),
                        //                 Padding(
                        //                   padding: const EdgeInsets
                        //                           .only(
                        //                       bottom: 8,
                        //                       top:
                        //                           12.0),
                        //                   child: Column(
                        //                     crossAxisAlignment:
                        //                         CrossAxisAlignment
                        //                             .start,
                        //                     children: [
                        //                       Text(
                        //                         firstlistitem[3][index]!
                        //                             .title!,
                        //                         style: TextStyle(
                        //                             fontWeight:
                        //                                 FontWeight.w600,
                        //                             fontSize: 12),
                        //                       ),
                        //                       SizedBox(
                        //                         height:
                        //                             6,
                        //                       ),
                        //                       Text(
                        //                         firstlistitem[3][index]!
                        //                             .description!,
                        //                         style: TextStyle(
                        //                             fontWeight:
                        //                                 FontWeight.w400,
                        //                             fontSize: 10),
                        //                       ),
                        //                       SizedBox(
                        //                         height:
                        //                             4,
                        //                       ),
                        //                       //! < rating n time n distance
                        //                       Row(
                        //                         // crossAxisAlignment:
                        //                         //     CrossAxisAlignment.end,
                        //                         children: [
                        //                           Column(
                        //                             children: [
                        //                               Icon(
                        //                                 Icons.star,
                        //                                 color: Colors.yellow[800],
                        //                                 size: 11,
                        //                               ),
                        //                               SizedBox(
                        //                                 height: 2,
                        //                               )
                        //                             ],
                        //                           ),
                        //                           SizedBox(
                        //                             width:
                        //                                 2,
                        //                           ),
                        //                           Text(
                        //                             firstlistitem[3][index]!.rating.toString(),
                        //                             style: TextStyle(
                        //                                 fontSize: 10,
                        //                                 fontWeight: FontWeight.w600,
                        //                                 color: Colors.grey[700]),
                        //                           ),
                        //                           Padding(
                        //                             padding:
                        //                                 const EdgeInsets.all(2.0),
                        //                             child:
                        //                                 Icon(
                        //                               Icons.circle,
                        //                               size: 2,
                        //                             ),
                        //                           ),
                        //                           Text(
                        //                             firstlistitem[3][index]!.time.toString(),
                        //                             style: TextStyle(
                        //                                 fontSize: 10,
                        //                                 fontWeight: FontWeight.w600,
                        //                                 color: Colors.grey[700]),
                        //                           ),
                        //                           Padding(
                        //                             padding:
                        //                                 const EdgeInsets.all(2.0),
                        //                             child:
                        //                                 Icon(
                        //                               Icons.circle,
                        //                               size: 2,
                        //                             ),
                        //                           ),
                        //                           Text(
                        //                             firstlistitem[2][index]!.distance.toString(),
                        //                             style: TextStyle(
                        //                                 fontSize: 10,
                        //                                 fontWeight: FontWeight.w600,
                        //                                 color: Colors.grey[700]),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                       //! > rating n time n distance
                        //                     ],
                        //                   ),
                        //                 )
                        //               ],
                        //             )),
                        //       );
                        //     }),
                        //   ),
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
