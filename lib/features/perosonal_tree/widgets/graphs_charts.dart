import 'dart:math';
import 'package:flutter/material.dart';

class GraphsCharts extends StatefulWidget {
  const GraphsCharts({super.key});

  @override
  State<GraphsCharts> createState() => _GraphsChartsState();
}

class _GraphsChartsState extends State<GraphsCharts> {
  List<Map<String, dynamic>> data = [
    {'label': 'MON', 'value': 1, 'color': Color(0xFFEABDA8)},
    {'label': 'TUE', 'value': 3, 'color': Color(0xFFB6B7B1)},
    {'label': 'WED', 'value': 2, 'color': Color(0xFF484C5A)},
    {'label': 'FRI', 'value': 3, 'color': Color(0xFF44A48B)},
    {'label': 'SAT', 'value': 1, 'color': Color(0xFFB6B7B1)},
    {'label': 'SUN', 'value': 2, 'color': Color(0xFFE05B3C)},
  ];

  void randomizeData() {
    setState(() {
      final random = Random();
      data =
          data.map((item) {
            return {
              ...item,
              'value': random.nextInt(4), // 0 to 3
            };
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Progress Overview',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xFF484C5A),
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 220,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Y-axis
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        '03',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      SizedBox(height: 24),
                      Text(
                        '02',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      SizedBox(height: 24),
                      Text(
                        '01',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      SizedBox(height: 24),
                      Text(
                        '0',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  // Bars
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(data.length, (index) {
                          final item = data[index];
                          final double maxBarHeight = 140;
                          final double barHeight =
                              (item['value'] / 3) * maxBarHeight;
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AnimatedContainer(
                                margin: EdgeInsets.only(right: 4),
                                duration: const Duration(milliseconds: 500),
                                width: 38,
                                height: barHeight,
                                decoration: BoxDecoration(
                                  color: item['color'],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                item['label'],
                                style: const TextStyle(
                                  color: Color(0xFF484C5A),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
