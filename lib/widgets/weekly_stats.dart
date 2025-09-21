import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyStats extends StatelessWidget {
  WeeklyStats({super.key});

  final chartData = [
    {'day': 'Mon', 'toY': 20},
    {'day': 'Tue', 'toY': 40},
    {'day': 'Wed', 'toY': 30},
    {'day': 'Thu', 'toY': 50},
    {'day': 'Fri', 'toY': 80},
    {'day': 'Sat', 'toY': 25},
    {'day': 'Sun', 'toY': 55},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Color(0xFF252727).withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // * Header text
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Most Active: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF252727).withOpacity(0.5),
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: 'Friday',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF252726),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // * Bar chart
          AspectRatio(
            aspectRatio: 2.0,
            child: BarChart(
              BarChartData(
                maxY: 100,

                // * BARS
                barGroups: [
                  for (int i = 0; i < chartData.length; i++)
                    BarChartGroupData(
                      barsSpace: 21,
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: (chartData[i]['toY'] as num).toDouble(),
                          color: i == 4 ? Color(0xFFCEFF69) : Color(0xFFB9AFF5),
                          width: 25,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                      ],
                    ),
                ],

                // * LABELS (LEFT, RIGHT , TOP, BOTTOM)
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        final index = value.toInt();
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            (index >= 0 && index < chartData.length
                                    ? chartData[index]['day']
                                    : '')
                                .toString(),
                            style: TextStyle(
                              color: Color(0xFF252727),
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),

                // * GRID
                gridData: FlGridData(show: false),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                    bottom: BorderSide(color: Colors.black, width: 0.5),
                    left: BorderSide.none,
                    right: BorderSide.none,
                    top: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
