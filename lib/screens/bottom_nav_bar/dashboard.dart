import 'package:exergizeui/widgets/cta_button.dart';
import 'package:exergizeui/widgets/food_calories_tile.dart';
import 'package:exergizeui/widgets/meditate_tile.dart';
import 'package:exergizeui/widgets/workout_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
              SizedBox(height: 16),

              // * Grid
              SizedBox(
                height: 300,
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  axisDirection: AxisDirection.right,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1.5,
                      child: WorkoutTile(),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1.3,
                      child: FoodCaloriesTile(),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1.21,
                      child: CtaButton(),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1.0,
                      child: MeditateTile(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 42),

              // * STATS
              Text(
                "Weekly Stats",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF252727),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
