import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/core/constant/app_color.dart';
import 'package:islami_app/core/constant/app_style.dart';
import 'package:islami_app/main_layer/main_layer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, MainLayer.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Align(
                alignment: AlignmentDirectional.center,
                child: Image.asset(
                  'assets/images/splash2/splash_screen2.png',
                  width: 180,
                  height: 165,
                ),
              ),
              Spacer(),
              Image.asset(
                'assets/images/splash2/route_branding.png',
                width: 180,
                height: 80,
              ),
              Text(
                'Supervised by Mohamed Nabil',
                style: AppStyle(color: AppColor.goldColor).labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
