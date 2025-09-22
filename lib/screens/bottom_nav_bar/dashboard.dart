import 'package:exergizeui/widgets/cta_button.dart';
import 'package:exergizeui/widgets/food_calories_tile.dart';
import 'package:exergizeui/widgets/meditate_tile.dart';
import 'package:exergizeui/widgets/weekly_stats.dart';
import 'package:exergizeui/widgets/workout_tile.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // * APPBAR
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "EVERYDAY WE’RE MUSCLE’N",
                style: TextStyle(fontSize: 12, color: Color(0xFF7B7B7B)),
              ),

              const SizedBox(height: 10),
              Text(
                "Hello, Jessedancr",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Color(0xFF252727),
                ),
              ),
            ],
          ),
        ),

        // * BODY
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // * "My plan"
              Row(
                children: [
                  Text(
                    'My Plan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF252727),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: h * 0.02),

              // * Grid
              SizedBox(
                // color: Colors.deepPurple,
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    WorkoutTile(),
                    MeditateTile(),
                    FoodCaloriesTile(),
                    CtaButton(),
                  ],
                ),
              ),
              // SizedBox(height: h * 0.05),

              // * STATS
              Text(
                "Weekly Stats",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF252727),
                ),
              ),

              // SizedBox(height: h * 0.03),
              WeeklyStats(),
            ],
          ),
        ),
      ),
    );
  }
}
