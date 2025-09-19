import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from top-left
    path.lineTo(0, 0);

    // Line to top-right
    path.lineTo(size.width, 0);

    // Line down the right side, stopping before the bottom
    path.lineTo(size.width, size.height - 80);

    // Diagonal line from bottom-right (higher) to bottom-left (lower)
    path.lineTo(0, size.height);

    // Close the path back to top-left
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
