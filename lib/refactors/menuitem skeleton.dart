import 'package:flutter/material.dart';
import 'package:foodwifi/refactors/skeletonBlock.dart';

class MenuItemSkeleton extends StatefulWidget {
  const MenuItemSkeleton({super.key});

  @override
  State<MenuItemSkeleton> createState() => _MenuItemSkeletonState();
}

class _MenuItemSkeletonState extends State<MenuItemSkeleton> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //!image
            SizedBox(height: 120, width: 120, child: Skeleton()),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Padding(
                padding: EdgeInsets.only(top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //!name
                    Skeleton(
                      height: height / 50,
                      width: width / 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Skeleton(
                        height: height / 60,
                        width: width / 5,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: 310,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //! price
                          Row(
                            children: [
                              Skeleton(
                                height: height / 50,
                                width: width / 8,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Skeleton(
                                height: height / 50,
                                width: width / 8,
                              ),
                            ],
                          ),
                          //! tag
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Skeleton(
                                      height: height / 50,
                                      width: width / 4,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                ],
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
  }
}
