import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Adds a loading shimmer to the [child] is [loading] is true
class LoadingShimmer extends StatelessWidget {

  final bool isLoading;
  final Widget child;

  const LoadingShimmer({super.key, required this.isLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Shimmer.fromColors(
          enabled: true,
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: child);
    } else {
      return child;
    }

  }

}


/// Multi line loading shimmer text
class ShimmerTextMultiLine extends StatelessWidget {
  final double width;
  final double height;

  /// Width of the last line
  final double? lastWidth;

  /// Height of the last line
  final double? lastHeight;

  /// Distance between the lines
  final double lineSeparation;

  /// Number of lines must be at least one
  final int numberOfLines;
  final CrossAxisAlignment crossAxisAlignment;

  const ShimmerTextMultiLine({
    super.key,
    this.width = double.infinity,
    this.height = 24,
    this.lastWidth,
    this.lastHeight,
    this.lineSeparation = 12,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.numberOfLines = 1}) : assert(numberOfLines > 0);



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        for(int i = 0; i < numberOfLines; i++)
          Padding(
              padding: EdgeInsets.only(bottom: i + 1 != numberOfLines ? lineSeparation : 0),
              child: ShimmerText(
                width:  i + 1 != numberOfLines ? width : (lastWidth ?? width),
                height:  i + 1 != numberOfLines ? height : (lastHeight ?? height),
              ))
      ],
    );
  }



}

/// Single line shimmer
class ShimmerText extends StatelessWidget {

  final double width;
  final double height;

  const ShimmerText({super.key, this.width = double.infinity, this.height = 24});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16)
      )
    );
  }

}