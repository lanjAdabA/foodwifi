//todo {Order and win cashback block}
import 'package:flutter/material.dart';
import 'package:foodwifi/model/mainmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foodwifi/refactors/skeletonBlock.dart';

class FirstBlock extends StatelessWidget {
  const FirstBlock({
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
        height: 310,
        // height: 320, //!inner
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(
              height: 308,
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: firstlistitem.isEmpty
                          ? const Skeleton(
                              height: 237,
                            )
                          : ListView.builder(
                              controller:
                                  PageController(viewportFraction: 0.73),
                              scrollDirection: Axis.horizontal,
                              physics: const PageScrollPhysics()
                                  .applyTo(const BouncingScrollPhysics()),
                              itemCount: firstlistitem[0].length,
                              itemBuilder: ((
                                context,
                                index,
                              ) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    top: 28,
                                    left: 16,
                                  ),
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
                                              fadeInDuration:
                                                  const Duration(seconds: 1),
                                              fit: BoxFit.fitWidth,
                                              imageUrl:
                                                  'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitem[0][index]!.img!}',
                                              height: 242,
                                              width: 432,
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      const Skeleton(
                                                height: 185,
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Text(
                                              firstlistitem[0][index]!.title!,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13),
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
