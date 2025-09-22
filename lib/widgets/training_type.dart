import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TrainingType extends StatelessWidget {
  final String svgPath;
  const TrainingType({super.key, required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // * Outer circle
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFC0B6FF).withOpacity(0.3),
          ),
        ),

        // * Inner circle
        Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFC0B6FF).withOpacity(0.9),
          ),
          child: SvgPicture.asset(svgPath, color: Color(0xFF262049)),
        ),
      ],
    );
  }
}
