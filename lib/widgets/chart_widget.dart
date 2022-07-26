import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyChartWidget extends StatelessWidget {
  //const MyChartWidget({Key? key}) : super(key: key);
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 7,
        minY: 0,
        maxY: 6,
        gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return FlLine(color: const Color(0xff37434d), strokeWidth: 1);
            }),
        titlesData: FlTitlesData(
          show: true,
          topTitles: SideTitles(showTitles: false),
          rightTitles: SideTitles(showTitles: false),
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTitles: (value) {
              switch (value.toInt()) {
                case 0:
                  return 'Mon';
                case 1:
                  return 'Tue';
                case 2:
                  return 'Wed';
                case 3:
                  return 'Thu';
                case 4:
                  return 'Fri';
                case 5:
                  return 'Sat';
                case 6:
                  return 'Sun';
              }
              return '';
            },
            // getTextStyles: (value) => TextStyle(
            //   color: Color(0xff67727d),
            //   fontWeight: FontWeight.bold,
            //   fontSize: 15,
            // ),
            margin: 8,
          ),
          leftTitles: SideTitles(
            showTitles: true,
            // getTextStyles: (value) => const TextStyle(
            //   color: Color(0xff67727d),
            //   fontWeight: FontWeight.bold,
            //   fontSize: 15,
            // ),
            reservedSize: 28,
            margin: 12,
          ),
        ),
        borderData: FlBorderData(
          show: true,
          // border: Border.all(color: Color(0xff37434d), width: 1),
          border: Border(
            bottom: BorderSide(color: Color(0xff37434d), width: 1),
            left: BorderSide(color: Color(0xff37434d), width: 1),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            colors: gradientColors,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
                show: true,
                colors: gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList()),
            spots: [
              FlSpot(0, 3),
              FlSpot(1, 2),
              FlSpot(2, 5),
              FlSpot(3, 2),
              FlSpot(4, 2),
              FlSpot(5, 5),
              FlSpot(6, 4),
            ],
          )
        ],
      ),
    );
  }
}
