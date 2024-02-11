import "package:flutter/material.dart";
import 'package:fl_chart/fl_chart.dart';

class Charts extends StatefulWidget {
  const Charts({super.key});

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
                LineChartData( 
                  minX: 0,
                  maxX: 20,
                  minY: 0,
                  maxY: 6,
                  lineBarsData: [
                    LineChartBarData( 
                      spots: [
                        FlSpot(0, 3),
                        FlSpot(1, 4),
                        FlSpot(2, 6),
                        FlSpot(3, 7),
                        FlSpot(4, 3),
                        FlSpot(5, 2),
                        FlSpot(6, 9),
                      ]
                    )
                  ]                 
                ),
              );
  }
}