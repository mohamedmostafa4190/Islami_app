import 'package:flutter/material.dart';

import '../../../core/constant/app_color.dart';

class CustomPrayerTimeCard extends StatelessWidget {
  final String? name;
  final String? time;
  final String? period;

  const CustomPrayerTimeCard({Key? key, this.name, this.time, this.period})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.black, AppColor.goldColor],
          stops: [0, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          transform: GradientRotation(12),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$name',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Text(
            '$time',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Text(
            '$period',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
