//! Item/Product details page
//! dashboard>OffersForYou>restaurantsPage>item/ProductDetails
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodwifi/logics/item_details/cubit/item_detailed_cubit.dart';
import 'package:foodwifi/model/review_modal_modified.model.dart';

import '../refactors/skeletonBlock.dart';

class ProductDetailPage extends StatefulWidget {
  final Product? product;
  const ProductDetailPage({super.key, this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<ItemDetailedCubit>()
        .getproductdetail(widget.product!.id.toString());
  }

  int? _selectedIndex;
  int counter = 1;

  void addnum() {
    setState(() {
      counter = counter + 1;
    });
  }

  void subnum() {
    if (counter > 1) {
      setState(() {
        counter = counter - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Productdetail = context.watch<ItemDetailedCubit>().state;

    final ProductDetaildata = Productdetail.productdetail;

    return Scaffold(
        body: Stack(children: [
      Column(
        children: [
          Expanded(
            flex: 100,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: widget.product!.img.toString().isEmpty
                            ? Image.asset('assets/images/foodwifilogo.png',
                                fit: BoxFit.cover,
                                alignment: const Alignment(0, -1),
                                color: Colors.white.withOpacity(0.2),
                                colorBlendMode: BlendMode.modulate)
                            : Image.network(
                                'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${widget.product!.img}',
                                alignment: const Alignment(0, -0.8),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, bottom: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.product!.name!,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[800]),
                          ),
                          Row(
                            children: [
                              Text(
                                '₹${widget.product!.price}',
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 18),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                //? to rounf up to 2 decimal place

                                // '₹${num.parse(widget.product.offer.offerPrice.toStringAsFixed(2))}',
                                '₹${widget.product!.offer.offerPrice.toStringAsFixed(2)}', //!working for amarjit
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 22,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Color.fromARGB(255, 35, 119, 138),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  children: [
                                    const RotatedBox(
                                      quarterTurns: 01,
                                      child: Icon(
                                        Icons.local_offer,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 5,
                                      ),
                                      child: Text(
                                        widget.product!.offer.description
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 11),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Text('Starting price')
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 7),
                      child: Text(widget.product!.description!),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        thickness: 5,
                        color: Colors.grey[200],
                      ),
                    ),
                    ProductDetaildata == null
                        ? Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(bottom: 13),
                                child: Skeleton(
                                  height: 50,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 13),
                                child: Skeleton(
                                  height: 50,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 13),
                                child: Skeleton(
                                  height: 50,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Select one',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 7),
                                          child: Icon(
                                            Icons.emergency,
                                            size: 8.8,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      color: Colors.yellowAccent,
                                      child: Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.warning_amber_rounded,
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              'Required',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.grey[800]),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 15,
                                ),
                                child: Divider(
                                  thickness: 1,
                                  color: Color.fromARGB(255, 218, 218, 218),
                                ),
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: ProductDetaildata.variants.length,
                                itemBuilder: (BuildContext context, int index) {
                                  if (ProductDetaildata.variants.length == 1) {
                                    _selectedIndex = 0;
                                  }
                                  return Column(
                                    children: [
                                      RadioListTile(
                                        visualDensity: const VisualDensity(
                                          horizontal:
                                              VisualDensity.minimumDensity,
                                          vertical:
                                              VisualDensity.minimumDensity,
                                        ),
                                        dense: true,
                                        activeColor: const Color.fromARGB(
                                            255, 236, 28, 60),
                                        value: index,
                                        groupValue: _selectedIndex,
                                        title: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                ProductDetaildata
                                                    .variants[index].unit,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '₹${ProductDetaildata.variants[index].price}',
                                                    style: const TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        fontSize: 18),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    '₹${ProductDetaildata.variants[index].offerPrice.toString()}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedIndex = value!;
                                          });
                                        },
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 82),
                                        child: Divider(
                                          thickness: 1,
                                          color: Color.fromARGB(
                                              255, 218, 218, 218),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                    Divider(thickness: 10, color: Colors.grey[200]),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                      child: Row(
                        children: [
                          Text(
                            'Note to restaurant',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' Optional',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Add your request (subject to restuarant\'s discretion',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 221, 220, 220),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 60, right: 60, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              subnum();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 236, 233, 233),
                                    width: 1,
                                  )),
                              height: 28,
                              width: 37,
                              child: const Icon(
                                Icons.remove,
                                color: Color.fromARGB(255, 96, 233, 101),
                              ),
                            ),
                          ),
                          Text(counter.toString()),
                          InkWell(
                            onTap: () {
                              addnum();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 236, 233, 233),
                                    width: 1,
                                  )),
                              height: 28,
                              width: 37,
                              child: const Icon(
                                Icons.add,
                                color: Color.fromARGB(255, 96, 233, 101),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Divider(
                        thickness: 4,
                        color: Colors.grey[200],
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 8,
              child: Material(
                elevation: 50,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 1,
                            color: Colors.grey,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 18),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  backgroundColor:
                                      const Color.fromARGB(255, 236, 28, 60)),
                              onPressed: ProductDetaildata == null
                                  ? null
                                  : _selectedIndex != null ||
                                          ProductDetaildata.variants.length == 1
                                      ? () {}
                                      : null,
                              child: Text(
                                'Add To Cart',
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ))
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 35, left: 15),
        child: InkWell(
          onTap: () {
            context.router.pop();
          },
          child: const CircleAvatar(
            backgroundColor: Colors.black38,
            child: Icon(
              Icons.close_sharp,
              color: Colors.white70,
            ),
          ),
        ),
      )
    ]));
  }
}
