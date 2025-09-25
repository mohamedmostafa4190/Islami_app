import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_style.dart';
import '../../../core/constant/images_path.dart';

class CustomSearch extends StatelessWidget {
  CustomSearch({super.key, required this.controller, required this.onChange});

  TextEditingController controller = TextEditingController();
  void Function(String) onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) => onChange(value),
      cursorColor: AppColor.goldColor,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(
            SvgPath.quran,
            colorFilter: ColorFilter.mode(AppColor.goldColor, BlendMode.srcIn),
          ),
        ),
        hint: Text(
          'Sura Name',
          style: AppStyle(color: Colors.white).titleSmall,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.goldColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.goldColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.goldColor),
        ),
      ),
    );
  }
}
