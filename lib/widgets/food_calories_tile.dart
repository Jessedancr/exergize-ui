import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FoodCaloriesTile extends StatelessWidget {
  const FoodCaloriesTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
        border: Border.all(width: 1.5, color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * Texts
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Food',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '1832 kcal',
                  style: TextStyle(fontSize: 14, color: Color(0xFF252727)),
                ),
              ],
            ),

            CircleAvatar(
              radius: 25,
              backgroundColor: Color(0xFFB9AFF5),
              child: SvgPicture.asset('assets/food.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
