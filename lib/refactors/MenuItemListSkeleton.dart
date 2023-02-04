import 'package:flutter/material.dart';
import 'package:foodwifi/refactors/menuitem%20skeleton.dart';
import 'package:foodwifi/refactors/skeletonBlock.dart';

class MenuItemListSkeleton extends StatelessWidget {
  const MenuItemListSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Skeleton(
              height: MediaQuery.of(context).size.height / 40,
              width: MediaQuery.of(context).size.width / 5,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          MenuItemSkeleton(),
          Divider(),
          MenuItemSkeleton(),
          Divider(),
          MenuItemSkeleton(),
        ],
      ),
    );
  }
}
