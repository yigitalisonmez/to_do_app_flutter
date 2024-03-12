import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todoey_flutter/helpers/theme_constants.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer(
      {super.key, required this.height, required this.width, this.border});
  final double height;
  final double width;
  final BorderRadiusGeometry? border;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 750),
      baseColor: kShimmerBaseColor,
      highlightColor: kShimmerHighlightColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: border ?? BorderRadius.circular(10),
          color: Colors.red,
        ),
        width: width,
        height: height,
      ),
    );
  }
}

class TodoShimmer extends StatelessWidget {
  final BorderRadiusGeometry? border;

  const TodoShimmer({super.key, this.border});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 750),
      baseColor: kShimmerBaseColor,
      highlightColor: kShimmerHighlightColor,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Container(height: 40, width: 40))),
          Expanded(
            flex: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Container(height: 40, width: 200),
            ),
          ),
        ],
      ),
    );
  }
}
