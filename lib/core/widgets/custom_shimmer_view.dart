import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerView extends StatelessWidget {
  final double width, height;
  const CustomShimmerView(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 211, 209, 209),
      highlightColor: const Color.fromARGB(255, 223, 220, 220),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
