import 'package:flutter/material.dart';

class CtaButton extends StatelessWidget {
  const CtaButton({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: w * 0.43,
      decoration: BoxDecoration(
        color: Color(0xFF252727),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Let’s Go!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF6F6F6),
              ),
            ),
            Divider(
              color: Color(0xFFCEFF67),
              height: 4,
              thickness: 8.0,
              indent: 40.0,
              endIndent: 40.0,
              radius: BorderRadius.circular(12),
            ),
          ],
        ),
      ),
    );
  }
}
