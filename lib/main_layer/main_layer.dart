import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/core/constant/app_color.dart';
import 'package:islami_app/main_layer/widget/bottom_nav_decoration.dart';
import 'package:islami_app/tabs/hadeth_tab/hadeth.dart';
import 'package:islami_app/tabs/quran_tap/quran.dart';
import 'package:islami_app/tabs/sabha_tab/sabha.dart';

import '../core/constant/images_path.dart';
import '../tabs/radio_tab/radio.dart';
import '../tabs/time_tab/time.dart';

class MainLayer extends StatefulWidget {
  const MainLayer({super.key});

  static const String routeName = '/mainLayer';

  @override
  State<MainLayer> createState() => _MainLayerState();
}

List<Widget> currentScreen = [
  QuranTab(),
  HadethTab(),
  SabhaTab(),
  RadioTab(),
  TimeTab(),
];

class _MainLayerState extends State<MainLayer> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: currentScreen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        selectedFontSize: 12,
        currentIndex: currentIndex,
        backgroundColor: AppColor.goldColor,
        items: [
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? BottomNavBarDecoration(nameIcon: SvgPath.quran)
                : SizedBox(
                    width: 25,
                    height: 25,
                    child: SvgPicture.asset(SvgPath.quran),
                  ),
            label: currentIndex == 0 ? 'Quran' : '',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 1
                ? BottomNavBarDecoration(nameIcon: SvgPath.hadeth)
                : SvgPicture.asset(SvgPath.hadeth),
            label: currentIndex == 1 ? 'Hadeth' : '',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 2
                ? BottomNavBarDecoration(nameIcon: SvgPath.sabha)
                : SizedBox(
                    width: 25,
                    height: 25,
                    child: SvgPicture.asset(SvgPath.sabha),
                  ),
            label: currentIndex == 2 ? 'Sabha' : '',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 3
                ? BottomNavBarDecoration(nameIcon: SvgPath.radio)
                : SizedBox(
                    width: 25,
                    height: 25,
                    child: SvgPicture.asset(SvgPath.radio),
                  ),
            label: currentIndex == 3 ? 'Radio' : '',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 4
                ? BottomNavBarDecoration(nameIcon: SvgPath.time)
                : SizedBox(
                    width: 25,
                    height: 25,
                    child: SvgPicture.asset(SvgPath.time),
                  ),
            label: currentIndex == 4 ? 'Time' : '',
          ),
        ],
      ),
    );
  }
}
