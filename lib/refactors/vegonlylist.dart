import 'package:flutter/material.dart';

import 'package:foodwifi/model/allbelowmodel.dart';
import 'package:foodwifi/refactors/reviewBlock.dart';

import 'dart:math' as math;

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
        itemname = allvegdatalist[ind]!.categoryName;
      }
    }
    return Column(
      children: [
        itemname.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        itemname.isEmpty
                            ? const SizedBox()
                            : Text(
                                itemname,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: allvegdatalist[ind]!.products.length,
                            shrinkWrap: true,
                            itemBuilder: ((context, itemindex) {
                              return allvegdatalist[ind]!
                                          .products[itemindex]
                                          .type ==
                                      'veg'
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 30),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Stack(
                                                alignment: Alignment.topRight,
                                                children: [
                                                  allvegdatalist[ind]!
                                                          .products[itemindex]
                                                          .img
                                                          .toString()
                                                          .isEmpty
                                                      ? SizedBox(
                                                          height: 80,
                                                          width: 80,
                                                          child: ClipOval(
                                                            child: Image.asset(
                                                                'assets/images/foodwifi.png',
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.2),
                                                                colorBlendMode:
                                                                    BlendMode
                                                                        .modulate),
                                                          ),
                                                        )
                                                      : SizedBox(
                                                          height: 80,
                                                          width: 80,
                                                          child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              child: Image.network(
                                                                  'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${allvegdatalist[ind]!.products[itemindex].img}')),
                                                        ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(1),
                                                    child: Image.asset(
                                                      allvegdatalist[ind]!
                                                                  .products[
                                                                      itemindex]
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
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(allvegdatalist[ind]!
                                                        .products[itemindex]
                                                        .name!),
                                                    SizedBox(
                                                      width: 210,
                                                      child: Text(
                                                        allvegdatalist[ind]!
                                                            .products[itemindex]
                                                            .description!,
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 28,
                                                    ),
                                                    SizedBox(
                                                      width: 240,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          allvegdatalist[ind]!
                                                                      .products[
                                                                          itemindex]
                                                                      .offer!
                                                                      .offerPrice ==
                                                                  allvegdatalist[
                                                                          ind]!
                                                                      .products[
                                                                          itemindex]
                                                                      .price!
                                                              ? Text(
                                                                  '₹${allvegdatalist[ind]!.products[itemindex].offer!.offerPrice!.toInt().toString()}')
                                                              : Row(
                                                                  children: [
                                                                    Text(
                                                                      allvegdatalist[
                                                                              ind]!
                                                                          .products[
                                                                              itemindex]
                                                                          .price!
                                                                          .toString(),
                                                                      style: const TextStyle(
                                                                          decoration:
                                                                              TextDecoration.lineThrough),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Text(
                                                                        '₹${allvegdatalist[ind]!.products[itemindex].offer!.offerPrice.toString()}'),
                                                                  ],
                                                                ),
                                                          allvegdatalist[ind]!
                                                                  .products[
                                                                      itemindex]
                                                                  .offer!
                                                                  .description
                                                                  .toString()
                                                                  .isEmpty
                                                              ? const SizedBox()
                                                              : Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 10),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(2),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          24,
                                                                      color: const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          17,
                                                                          149,
                                                                          138),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(2),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Transform(
                                                                              alignment: Alignment.center,
                                                                              transform: Matrix4.rotationY(math.pi),
                                                                              child: const Icon(
                                                                                Icons.local_offer,
                                                                                color: Colors.white,
                                                                                size: 14,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 5),
                                                                              child: Text(
                                                                                allvegdatalist[ind]!.products[itemindex].offer!.description.toString(),
                                                                                style: TextStyle(color: Colors.white, fontSize: 12),
                                                                              ),
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
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 2,
                                            color: const Color.fromARGB(
                                                255, 238, 236, 236),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          )
                                        ],
                                      ),
                                    )
                                  : const SizedBox();
                            }))
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
        allvegdatalist[ind]!.categoryName == allvegdatalist.last!.categoryName
            ? Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                height: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                        'Prices on this menu are set directly by the Merchant.'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Prices may differ between Delivery and Dine-in'),
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
