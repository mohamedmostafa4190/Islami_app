import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constant/app_color.dart';

class BottomNavBarDecoration extends StatelessWidget {
  const BottomNavBarDecoration({super.key, required this.nameIcon});

  final String nameIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 59,
      height: 34,
      decoration: BoxDecoration(
        color: AppColor.transGreyColor,
        borderRadius: BorderRadius.circular(66),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: SvgPicture.asset(
          alignment: Alignment.center,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          nameIcon,
          height: 19,
          width: 22,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
