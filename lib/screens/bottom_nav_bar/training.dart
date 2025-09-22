import 'package:exergizeui/widgets/touchable_opacity.dart';
import 'package:exergizeui/widgets/training_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Training extends StatefulWidget {
  const Training({super.key});

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  final List<String> svgPaths = [
    'assets/kettlebell.svg',
    'assets/shoe.svg',
    'assets/gym_rings.svg',
  ];

  final levels = [
    {'level': 'Beginner', 'isSelected': true},
    {'level': 'Intermediate', 'isSelected': false},
    {'level': 'Advanced', 'isSelected': false},
  ];

  final List<Map<String, dynamic>> trainingInfo = [
    {
      'title': 'Strength training',
      'descr': 'Build strength and power with kettlebell exercises',
      'levels': {'Beginner': '5KG', 'Intermediate': '10KG', 'Advanced': '20KG'},
    },
    {
      'title': 'Cardio',
      'descr': 'Improve your cardio and endurance with running',
      'levels': {'Beginner': '5Km', 'Intermediate': '10Km', 'Advanced': '20Km'},
    },
    {
      'title': 'Body weight',
      'descr': 'Master bodyweight movements with gymnastic rings',
      'levels': {
        'Beginner': '5 Reps',
        'Intermediate': '10 Reps',
        'Advanced': '20 Reps',
      },
    },
  ];

  int _currentIndex = 0;
  Rx<int> currentIndex = Rx(0);

  String getSelectedLevel() {
    for (var level in levels) {
      if (level['isSelected'] == true) {
        return level['level'] as String;
      }
    }
    return 'Beginner';
  }

  String getLevelData() {
    String selectedLevel = getSelectedLevel();
    return trainingInfo[_currentIndex]['levels'][selectedLevel];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TOO MUCH PROTEIN? NO WHEY, MATE!",
                style: TextStyle(fontSize: 12, color: Color(0xFF7B7B7B)),
              ),
              const SizedBox(height: 10),

              Text(
                "Choose a training\nfor today!",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF252727),
                ),
              ),
            ],
          ),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // * Page View
            SizedBox(
              height: 300,
              child: PageView.builder(
                itemCount: svgPaths.length,
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return TrainingType(svgPath: svgPaths[index]);
                },
              ),
            ),

            // * Title
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                trainingInfo[_currentIndex]['title']!,
                key: ValueKey<int>(_currentIndex),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF252727),
                  height: 1.4,
                ),
              ),
            ),

            // * Choice chips
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: levels.length,
                itemBuilder: (context, index) {
                  final isSelected = levels[index]['isSelected'] as bool;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: RawChip(
                      showCheckmark: false,
                      color: WidgetStatePropertyAll(
                        isSelected ? Color(0xFF252727) : Color(0xFFF5F5DC),
                      ),
                      labelStyle: TextStyle(
                        color: isSelected
                            ? Color(0xFFF6F6F6)
                            : Color(0xFF252727),
                        fontSize: 12,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(50),
                      ),
                      label: Text(levels[index]['level'].toString()),
                      selected: isSelected,
                      onSelected: (value) {
                        setState(() {
                          // Reset all selections
                          for (var level in levels) {
                            level['isSelected'] = false;
                          }
                          // Set the selected one
                          levels[index]['isSelected'] = value;
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            // * Descr
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                trainingInfo[_currentIndex]['descr']!,
                key: ValueKey<int>(_currentIndex),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7B7B7B),
                  height: 1.4,
                ),
              ),
            ),

            // * CTA Button
            TouchableOpacity(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFCEFF69),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Start - ${getLevelData()}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF252727),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
