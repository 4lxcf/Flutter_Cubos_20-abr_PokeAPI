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
              // Container(
              //   decoration: BoxDecoration(
              //       border: Border.all(
              //         color: Colors.grey,
              //         width: 1.0,
              //       ),
              //       borderRadius: BorderRadius.circular(8.0)),
              // ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  alignment: Alignment.topCenter,
                  width: 30,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    '$value',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
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
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
