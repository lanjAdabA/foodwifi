import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:foodwifi/model/review_modal_modified.model.dart';
import 'package:foodwifi/refactors/reviewBlock.dart';

import 'package:foodwifi/router/router.gr.dart';

class VegetableonlyListPage extends StatelessWidget {
  final String id;
  final List<ReviewModalModified?> allvegdatalist;
  final int ind;
  VegetableonlyListPage(
      {super.key,
      required this.allvegdatalist,
      required this.ind,
      required this.id});

  String itemname = '';

  @override
  Widget build(BuildContext context) {
    for (var element in allvegdatalist[ind]!.products) {
      if (element.type == 'veg') {
        itemname = allvegdatalist[ind]!.categoryName!;
      }
    }
    return Column(
      children: [
        //!empty part above the review section
        itemname.isEmpty
            ? SizedBox()
            : Padding(
                //! divider
                padding: const EdgeInsets.only(bottom: 4),
                child: Container(
                  color: Colors.white,
                  // color: Colors.amber,
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            itemname,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 1.0),
                          child:
                              //!_{nested scrollview}
                              ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: allvegdatalist[ind]!.products.length,
                            shrinkWrap: true,
                            itemBuilder: ((context, itemindex) {
                              return InkWell(
                                  // ! params
                                  onTap: () {
                                    context.router.push(
                                      ProductDetailRoute(
                                        product: allvegdatalist[ind]!
                                            .products[itemindex],
                                      ),
                                    );
                                  },
                                  //!!
                                  child:
                                      allvegdatalist[ind]!
                                                  .products[itemindex]
                                                  .type ==
                                              'veg'
                                          ? Container(
                                              color: Colors.white,
                                              // color: Colors.red,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Stack(
                                                          alignment: Alignment
                                                              .topRight,
                                                          children: [
                                                            allvegdatalist[ind]!
                                                                    .products[
                                                                        itemindex]
                                                                    .img
                                                                    .toString()
                                                                    .isEmpty
                                                                ? SizedBox(
                                                                    height: 120,
                                                                    width: 120,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          ClipOval(
                                                                        child: Image.asset(
                                                                            'assets/images/foodwifilogo.png',
                                                                            color:
                                                                                Colors.white.withOpacity(0.2),
                                                                            colorBlendMode: BlendMode.modulate),
                                                                      ),
                                                                    ),
                                                                  )
                                                                : SizedBox(
                                                                    height: 120,
                                                                    width: 120,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              0),
                                                                      child: ClipRRect(
                                                                          borderRadius: BorderRadius.circular(
                                                                              10),
                                                                          child:
                                                                              Image.network('https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${allvegdatalist[ind]!.products[itemindex].img}')),
                                                                    ),
                                                                  ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              child:
                                                                  Image.asset(
                                                                allvegdatalist[ind]!
                                                                            .products[itemindex]
                                                                            .type ==
                                                                        'non_veg'
                                                                    ? 'assets/images/nonveglogo.png'
                                                                    : 'assets/images/veglogo.png',
                                                                height: 17,
                                                                width: 17,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 12),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 4),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  allvegdatalist[
                                                                          ind]!
                                                                      .products[
                                                                          itemindex]
                                                                      .name!,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                                SizedBox(
                                                                  width: 210,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            4.0),
                                                                    child: Text(
                                                                      allvegdatalist[
                                                                              ind]!
                                                                          .products[
                                                                              itemindex]
                                                                          .description!,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color:
                                                                              Colors.grey[600]),
                                                                    ),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 28,
                                                                ),
                                                                Container(
                                                                  width: 310,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            '₹',
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.w500),
                                                                          ),
                                                                          Text(
                                                                            allvegdatalist[ind]!.products[itemindex].price.toString(),
                                                                            style:
                                                                                const TextStyle(decoration: TextDecoration.lineThrough),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          Text(
                                                                            '₹${allvegdatalist[ind]!.products[itemindex].offer.offerPrice.toStringAsFixed(2)}',
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.w600),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(left: 10),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(4),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                24,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                57,
                                                                                137,
                                                                                157),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(2),
                                                                              child: Row(
                                                                                children: [
                                                                                  SizedBox(
                                                                                    width: 6,
                                                                                  ),
                                                                                  Transform(
                                                                                    alignment: Alignment.center,
                                                                                    transform: Matrix4.rotationY(60),
                                                                                    child: const Icon(
                                                                                      Icons.local_offer,
                                                                                      color: Colors.white,
                                                                                      size: 12,
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(left: 5),
                                                                                    child: Text(
                                                                                      allvegdatalist[ind]!.products[itemindex].offer.description.toString(),
                                                                                      style: TextStyle(color: Colors.white, fontSize: 10),
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
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    thickness: 2,
                                                    color: Colors.grey[200],
                                                  )
                                                ],
                                              ),
                                            )
                                          : SizedBox());
                            }),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

        allvegdatalist[ind]!.reviewdata == null
            ? const SizedBox()
            : reviewBlock(
                reviewdata: allvegdatalist[ind]!.reviewdata!,
                id: id,
              ),
        // allvegdatalist[ind]!.categoryName == allvegdatalist.last!.categoryName
        //     ? Container(
        //         width: MediaQuery.of(context).size.width,
        //         color: Colors.white,
        //         height: 70,
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: const [
        //             Text(
        //                 'Prices on this menu are set directly by the Merchant.'),
        //             SizedBox(
        //               height: 5,
        //             ),
        //             Text('Prices may differ between Delivery and Dine-in'),
        //           ],
        //         ),
        //       )
        //     : const SizedBox(),
      ],
    );
  }
}
