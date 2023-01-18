//todo {Imphal's most fav} block
import 'package:flutter/material.dart';
import 'package:foodwifi/model/mainmodel.dart';

class SixthBlock extends StatelessWidget {
  const SixthBlock({
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
        height: 360,
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(
              // !boxcontainer
              height: 360,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    //! top of Imphal's most fav
                    padding: const EdgeInsets.only(top: 28.0, left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              alldata[5].title!,
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
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          alldata[5].description!,
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
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              controller: PageController(viewportFraction: .09),
                              scrollDirection: Axis.horizontal,
                              physics: const PageScrollPhysics()
                                  .applyTo(const BouncingScrollPhysics()),
                              itemCount: firstlistitem[5].length,
                              itemBuilder: ((
                                context,
                                index,
                              ) {
                                return Padding(
                                  padding:
                                      //!top_of_image_tajkirah
                                      const EdgeInsets.only(
                                          top: 16, left: 16, right: 1),
                                  child: Container(
                                      color: Colors.white,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitem[5][index]!.img}',
                                              height: 182,
                                              width: 333,
                                              fit: BoxFit.cover,
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
                                                  firstlistitem[5][index]!
                                                      .title!,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),

                                                firstlistitem[5][index]!
                                                            .description ==
                                                        null
                                                    ? SizedBox()
                                                    : Text(
                                                        firstlistitem[5][index]!
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
                                                      firstlistitem[5][index]!
                                                          .rating
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
                                                      firstlistitem[5][index]!
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
                                                      firstlistitem[5][index]!
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
