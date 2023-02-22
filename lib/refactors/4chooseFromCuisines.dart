//todo {Choose from cuisines} block
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodwifi/model/mainmodel.dart';
import 'package:foodwifi/refactors/skeletonBlock.dart';
import 'package:foodwifi/router/router.gr.dart';

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
                            alldata[2].title!,
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
                                  return InkWell(
                                    onTap: () {
                                      context.router.push(
                                          RestaurantSearchByItemRoute(
                                              itemname: firstlistitem[2][index]!
                                                  .title!,
                                              checkname: '',
                                              cuisinesId: "",
                                              issearchfound: false,
                                              storetypeid: ''));
                                    },
                                    child: Padding(
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
                                                    'https://globizs.sgp1.cdn.digitaloceanspaces.com/foodwifi/${firstlistitem[2][index]!.img}',
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
                                              firstlistitem[2][index]!.title!,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )),
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
