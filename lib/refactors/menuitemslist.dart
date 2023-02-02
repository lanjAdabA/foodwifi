import 'package:flutter/material.dart';
import 'package:foodwifi/model/restaurantsdetails.model.dart';
import 'package:foodwifi/services/serviceApi.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MenuItemsList extends StatefulWidget {
  final String id;
  final ItemScrollController itemScrollController;
  final ItemPositionsListener itemPositionsListener;
  const MenuItemsList(
      {super.key,
      required this.id,
      required this.itemScrollController,
      required this.itemPositionsListener});

  @override
  State<MenuItemsList> createState() => _MenuItemsListState();
}

class _MenuItemsListState extends State<MenuItemsList> {
  List<RestaurantsDetailsModel?>? restaurantdata;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    var restaurantsdatadetails =
        await ServiceApi().getrestaurantsdetaildata(id: widget.id);

    setState(() {
      restaurantdata = restaurantsdatadetails;
    });
  }

  Widget build(BuildContext context) {
    return restaurantdata == null
        ? SizedBox()
        // ? LoadingAnimationWidget.waveDots(
        //     color: Colors.grey,
        //     size: 26,
        //   )
        : ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: restaurantdata!.length - 1,
            itemBuilder: ((context, nameindex) {
              var testindex1 = nameindex + 1;
              return Padding(
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
                          restaurantdata![testindex1]!.categoryName,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: ListView.separated(
                            // padding: EdgeInsets.all(1),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                restaurantdata![testindex1]!.products.length,
                            shrinkWrap: true,
                            itemBuilder: ((context, newindex) {
                              // var newindextry = newindex + 1;
                              return SizedBox(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        restaurantdata![testindex1]!
                                                .products[newindex]
                                                .img
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
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                          'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${restaurantdata![testindex1]!.products[newindex].img}')),
                                                ),
                                              ),
                                        Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Image.asset(
                                            restaurantdata![testindex1]!
                                                        .products[newindex]
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
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 4),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              restaurantdata![testindex1]!
                                                  .products[newindex]
                                                  .name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 210,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4.0),
                                                child: Text(
                                                  restaurantdata![testindex1]!
                                                      .products[newindex]
                                                      .description,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '₹',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Text(
                                                        restaurantdata![
                                                                testindex1]!
                                                            .products[newindex]
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
                                                        '₹${restaurantdata![testindex1]!.products[newindex].offer.offerPrice.toString()}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
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
                                                                child:
                                                                    const Icon(
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
                                                                        left:
                                                                            5),
                                                                child: Text(
                                                                  restaurantdata![
                                                                          testindex1]!
                                                                      .products[
                                                                          newindex]
                                                                      .offer
                                                                      .description
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10),
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
                              );
                            }),
                            separatorBuilder:
                                (BuildContext context, int index) {
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
              );
            }));
  }
}
