import 'package:flutter/material.dart';
import 'package:islami_app/main_layer/main_layer.dart';
import 'package:islami_app/presentation/screens/on_boarding_screen.dart';
import 'package:islami_app/tabs/quran_tap/sura_details.dart';

import '../../tabs/hadeth_tab/hadeth.dart';
import '../../tabs/quran_tap/quran.dart';
import '../../tabs/radio_tab/radio.dart';
import '../../tabs/sabha_tab/sabha.dart';
import '../../tabs/time_tab/time.dart';

Map<String, WidgetBuilder> routes = {
  OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
  MainLayer.routeName: (context) => MainLayer(),
  QuranTab.routeName: (context) => QuranTab(),
  HadethTab.routeName: (context) => HadethTab(),
  RadioTab.routeName: (context) => RadioTab(),
  SabhaTab.routeName: (context) => SabhaTab(),
  TimeTab.routeName: (context) => TimeTab(),
  SuraDetails.routeName: (context) => SuraDetails(),
};
