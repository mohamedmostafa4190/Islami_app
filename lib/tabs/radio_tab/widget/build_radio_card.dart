import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_style.dart';
import '../../../core/constant/images_path.dart';

class BuildRadioCard extends StatelessWidget {
  const BuildRadioCard({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        color: AppColor.goldColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 4),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image.asset(
                PngPath.mosqueDecoration,
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  Text(
                    'Ibrahim Al-Akdar',
                    style: AppStyle(color: Colors.black).bodyLarge,
                  ),
                  SizedBox(height: 0.1 * height),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 0.13 * width),
                      SvgPicture.asset(SvgPath.playRadio),
                      const SizedBox(width: 20),
                      SvgPicture.asset(SvgPath.volumeRadio),
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
