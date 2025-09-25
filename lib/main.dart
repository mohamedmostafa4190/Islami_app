import 'package:flutter/material.dart';
import 'package:islami_app/core/constant/app_const.dart';
import 'package:islami_app/presentation/screens/onboarding/on_boarding_screen.dart';
import 'package:islami_app/presentation/screens/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constant/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  final bool onboardingDone = pref.getBool(AppConst.onBoarding) ?? false;
  return runApp(IslamiApp(onboardingDone: onboardingDone));
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key, required this.onboardingDone});

  final bool onboardingDone;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami App',
      initialRoute: onboardingDone
          ? SplashScreen.routeName
          : OnBoardingScreen.routeName,
      routes: routes,
    );
  }
}
