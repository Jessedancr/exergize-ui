import 'package:flutter/material.dart';

class Training extends StatefulWidget {
  const Training({super.key});

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
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
      ),
    );
  }
}
