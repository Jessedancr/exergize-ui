import 'package:exergizeui/screens/bottom_nav_bar/nav_bar_wrapper.dart';
import 'package:exergizeui/widgets/exergize_button.dart';
import 'package:exergizeui/widgets/my_custom_clipper.dart';
import 'package:exergizeui/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final String moreInfo =
    'Our recipes and workouts are the perfect way to start your day. Sweat hard, then have a snack or drink. Whatever you prefer!';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // * TOP SECTION
                ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    width: double.infinity,
                    height: h * 0.6,
                    decoration: BoxDecoration(
                      color: Color(0xFFC0B6FF),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),
                ),

                // * Stopwatch
                Positioned(
                  bottom: 0,
                  child: Image.asset('assets/stopwatch.png'),
                ),

                // * Jar
                Positioned(
                  top: 90,
                  left: w * 0.2,
                  child: Image.asset('assets/jar.png'),
                ),

                // * Dumbell
                Image.asset('assets/dumbell_image.png'),

                // * Strength grip
                Positioned(
                  right: 0,
                  bottom: -100,
                  child: Image.asset('assets/grip_strength.png'),
                ),

                // * Text
                Positioned(
                  top: 55,
                  left: w * 0.35,
                  child: Image.asset('assets/exergize.png'),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Waffles are just\n pancakes with abs',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF252727),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 14),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                moreInfo,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),

            TouchableOpacity(
              onTap: () {
                Get.to(() => NavBarWrapper(), transition: Transition.fadeIn);
              },
              child: ExergizeButton(),
            ),
          ],
        ),
      ),
    );
  }
}
