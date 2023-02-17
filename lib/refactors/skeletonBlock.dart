import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width, this.radius})
      : super(key: key);

  final double? height, width, radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      // This is the default value
      enabled: true,

      // This is the default value
      direction: ShimmerDirection.ltr,

      baseColor: Colors.grey[400]!,
      highlightColor: Color.fromARGB(255, 225, 219, 219),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.all(
                Radius.circular(radius == null ? 6 : radius!))),
      ),
    );
  }
}
