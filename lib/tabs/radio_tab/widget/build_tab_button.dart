import 'package:flutter/material.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_const.dart';

class BuildTabButton extends StatelessWidget {
  BuildTabButton({
    super.key,
    required this.isSelected,
    required this.text,
    this.onTap,
  });

  final Function()? onTap;
  bool isSelected;
  String text;

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    double w = size.width;
    double h = size.height;
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 0.15 * w),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.goldColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
