import 'package:flutter/material.dart';
import 'package:islami_app/core/constant/app_color.dart';
import 'package:islami_app/core/constant/app_const.dart';
import 'package:islami_app/core/constant/app_style.dart';
import 'package:islami_app/core/constant/images_path.dart';
import 'package:islami_app/main_layer/main_layer.dart';
import 'package:islami_app/widget/main_header_islami.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const String routeName = 'OnBoarding';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.center,
            child: MainHeaderIslami(),
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: onBoardingScreens.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset('${onBoardingScreens[index].image}'),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '${onBoardingScreens[index].title}',
                      style: AppStyle(
                        color: AppColor.goldColor,
                      ).titleMedium.copyWith(fontSize: 24),
                    ),
                    SizedBox(height: 40),
                    Text(
                      '${onBoardingScreens[index].subtitle}',
                      style: AppStyle(color: AppColor.goldColor).bodyLarge,
                    ),
                    SizedBox(height: 120),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          index == 0
                              ? Container()
                              : TextButton(
                                  onPressed: () {
                                    pageController.previousPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  child: Text(
                                    "Back",
                                    style: AppStyle(
                                      color: AppColor.goldColor,
                                    ).titleSmall,
                                  ),
                                ),
                          SmoothPageIndicator(
                            controller: pageController,
                            count: 5,
                            effect: ExpandingDotsEffect(
                              activeDotColor: Colors.amber,
                              dotColor: Colors.grey,
                              dotHeight: 8,
                              dotWidth: 8,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              currentPage == (onBoardingScreens.length - 1)
                                  ? _finishOnBoarding(context)
                                  : pageController.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                            },
                            child: Text(
                              "Next",
                              style: AppStyle(
                                color: AppColor.goldColor,
                              ).titleSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _finishOnBoarding(BuildContext context) async {
  final pref = await SharedPreferences.getInstance();
  await pref.setBool(AppConst.onBoarding, true);
  Navigator.pushReplacementNamed(context, MainLayer.routeName);
}

class OnBoarding {
  final String? image;
  final String? title;
  final String? subtitle;

  OnBoarding({this.image, this.title, this.subtitle});
}

List<OnBoarding> onBoardingScreens = [
  OnBoarding(
    image: PngPath.onBoardingScreenImg1,
    title: 'Welcome To Islmi App',
    subtitle: '',
  ),
  OnBoarding(
    image: PngPath.onBoardingScreenImg2,
    title: 'Welcome To Islami',
    subtitle: 'We Are Very Excited To Have You In Our Community',
  ),
  OnBoarding(
    image: PngPath.onBoardingScreenImg3,
    title: 'Reading the Quran',
    subtitle: 'Read, and your Lord is the Most Generous',
  ),
  OnBoarding(
    image: PngPath.onBoardingScreenImg4,
    title: 'Bearish',
    subtitle: 'Praise the name of your Lord, the Most High',
  ),
  OnBoarding(
    image: PngPath.onBoardingScreenImg5,
    title: 'Holy Quran Radio',
    subtitle:
        'You can listen to the Holy Quran Radio through the application for free and easily',
  ),
];
