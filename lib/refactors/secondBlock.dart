//todo Foods near you block

import 'package:flutter/material.dart';
import 'package:foodwifi/model/mainmodel.dart';

class SecondBlock extends StatelessWidget {
  const SecondBlock({
    Key? key,
    required this.firstlistitem,
  }) : super(key: key);

  final List<List<Item?>> firstlistitem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Container(
        color: Colors.white,
        height: 180,
        // height: 320, //!inner
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(
              height: 170,
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: firstlistitem.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              controller:
                                  PageController(viewportFraction: 0.73),
                              scrollDirection: Axis.horizontal,
                              physics: const PageScrollPhysics()
                                  .applyTo(const BouncingScrollPhysics()),
                              itemCount: firstlistitem[1].length,
                              itemBuilder: ((
                                context,
                                index,
                              ) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30, left: 16, right: 16),
                                  child: Container(
                                      color: Colors.white,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitem[1][index]!.img}',
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8, top: 12.0),
                                            child: Text(
                                              firstlistitem[1][index]!.title!,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11),
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
