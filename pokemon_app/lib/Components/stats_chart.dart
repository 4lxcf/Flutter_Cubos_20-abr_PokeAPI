import 'package:flutter/material.dart';

class StatsChart extends StatelessWidget {
  final String label;
  final int value;
  final double percentage;
  final Color color;

  StatsChart({this.label, this.percentage, this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: 30,
          margin: EdgeInsets.all(5.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  alignment: Alignment.topCenter,
                  width: 30,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      width: 1.5,
                      color: Colors.white.withOpacity(0.3),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6.0,
                        spreadRadius: 1.5,
                        offset: Offset(2, 2),
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
