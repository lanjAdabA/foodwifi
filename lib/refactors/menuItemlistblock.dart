import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:foodwifi/model/allbelowmodel.dart';
import 'package:foodwifi/model/restaurantsdetails.model.dart';
import 'package:foodwifi/refactors/reviewBlock.dart';
import 'package:foodwifi/router/router.gr.dart';

class MenuItemList extends StatefulWidget {
  final List<ReviewModalModified?> allbelowdata;
  final int nameindex;
  final String id;
  const MenuItemList({
    super.key,
    required this.allbelowdata,
    required this.nameindex,
    required this.id,
  });

  @override
  State<MenuItemList> createState() => _MenuItemListState();
}

class _MenuItemListState extends State<MenuItemList> {
  List<RestaurantsDetailsModel?>? restaurantdata;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Container(
            color: Colors.white,
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    // 'try',
                    widget.allbelowdata[widget.nameindex]!.categoryName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child:
                        //!_{nested scrollview}
                        ListView.separated(
                      // padding: EdgeInsets.all(1),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget
                          .allbelowdata[widget.nameindex]!.products.length,
                      shrinkWrap: true,
                      itemBuilder: ((context, itemindex) {
                        return InkWell(
                          // ! params
                          onTap: () {
                            context.router.push(
                              ProductDetailRoute(
                                product: widget.allbelowdata[widget.nameindex]!
                                    .products[itemindex],
                              ),
                            );
                          },

                          child: SizedBox(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    widget.allbelowdata[widget.nameindex]!
                                            .products[itemindex].img
                                            .toString()
                                            .isEmpty
                                        ? SizedBox(
                                            height: 120,
                                            width: 120,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ClipOval(
                                                child: Image.asset(
                                                    'assets/images/foodwifilogo.png',
                                                    color: Colors.white
                                                        .withOpacity(0.2),
                                                    colorBlendMode:
                                                        BlendMode.modulate),
                                              ),
                                            ),
                                          )
                                        : SizedBox(
                                            height: 120,
                                            width: 120,
                                            child: Padding(
                                              padding: const EdgeInsets.all(0),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                      'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${widget.allbelowdata[widget.nameindex]!.products[itemindex].img}')),
                                            ),
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Image.asset(
                                        widget.allbelowdata[widget.nameindex]!
                                                    .products[itemindex].type ==
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
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 4),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.allbelowdata[widget.nameindex]!
                                              .products[itemindex].name!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: 210,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4.0),
                                            child: Text(
                                              widget
                                                  .allbelowdata[
                                                      widget.nameindex]!
                                                  .products[itemindex]
                                                  .description!,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey[600]),
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    '₹',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    widget
                                                        .allbelowdata[
                                                            widget.nameindex]!
                                                        .products[itemindex]
                                                        .price
                                                        .toString(),
                                                    style: const TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    '₹${widget.allbelowdata[widget.nameindex]!.products[itemindex].offer!.offerPrice.toString()}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  child: Container(
                                                    height: 24,
                                                    color: Color.fromARGB(
                                                        255, 57, 137, 157),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 6,
                                                          ),
                                                          Transform(
                                                            alignment: Alignment
                                                                .center,
                                                            transform: Matrix4
                                                                .rotationY(60),
                                                            child: const Icon(
                                                              Icons.local_offer,
                                                              color:
                                                                  Colors.white,
                                                              size: 12,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 5),
                                                            child: Text(
                                                              widget
                                                                  .allbelowdata[
                                                                      widget
                                                                          .nameindex]!
                                                                  .products[
                                                                      itemindex]
                                                                  .offer!
                                                                  .description
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 10),
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
                        );
                      }),
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          thickness: 1,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        widget.allbelowdata[widget.nameindex]!.reviewdata == null
            ? Container()
            : reviewBlock(
                reviewdata: widget.allbelowdata[widget.nameindex]!.reviewdata,
                id: widget.id,
              ),
      ],
    );
  }
}
