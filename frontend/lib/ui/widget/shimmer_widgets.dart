import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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