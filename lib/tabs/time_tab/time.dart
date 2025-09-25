import 'package:flutter/material.dart';
import 'package:islami_app/core/constant/app_color.dart';
import 'package:islami_app/tabs/time_tab/widget/custom_prayer_time.dart';
import 'package:islami_app/tabs/time_tab/widget/prayer_list.dart';
import 'package:islami_app/widget/main_background.dart';
import 'package:islami_app/widget/main_header_islami.dart';

import '../../../core/constant/app_style.dart';
import '../../../core/constant/images_path.dart';
import '../../core/constant/app_const.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  static const String routeName = '/timeTab';

  @override
  Widget build(BuildContext context) {
    final size = AppSize(context);
    double w = size.width;
    double h = size.height;
    PageController pageController = PageController(
      viewportFraction: 0.65,
      initialPage: 2,
    );
    return SafeArea(
      child: Stack(
        children: [
          MainBackground(backGroundImage: PngPath.timeBackGround),
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Center(child: MainHeaderIslami()),
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 27),
                          child: Container(
                            height: 0.3 * h,
                            decoration: BoxDecoration(
                              color: AppColor.brownLightColor,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '16 Jul,2024',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '16 Jul, 2024',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Image.asset(PngPath.timePrayerCard),
                        ),
                        Column(
                          children: [
                            Text(
                              'Pray Time',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black45,
                              ),
                            ),
                            Text(
                              'Tuesday',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 0.05 * h),
                            SizedBox(
                              width: w * 0.56,
                              height: 130,
                              child: PageView.builder(
                                scrollDirection: Axis.horizontal,
                                controller: pageController,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: CustomPrayerTimeCard(
                                    name: prayerTimes[index]['name'],
                                    time: prayerTimes[index]['time'],
                                    period: prayerTimes[index]['period'],
                                  ),
                                ),
                                itemCount: prayerTimes.length,
                              ),
                            ),
                            SizedBox(height: 0.02 * h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Next Prayer - ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '02:32',
                                  style: AppStyle(
                                    color: Colors.white,
                                  ).bodyMedium,
                                ),
                                SizedBox(width: 0.05 * w),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.volume_off_outlined),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 10,
                                ),
                                child: Text(
                                  'Azkar',
                                  style: AppStyle(
                                    color: Colors.white,
                                  ).titleSmall,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => CustomAzkar(
                      azkarName: '${azkarList[index]['name']}',
                      azkarImage: '${azkarList[index]['icon']}',
                      onTap: () {},
                    ),
                    childCount: azkarList.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomAzkar extends StatelessWidget {
  CustomAzkar({
    super.key,
    required this.azkarName,
    required this.azkarImage,
    required this.onTap,
  });

  Function onTap;
  String azkarName;
  String azkarImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusGeometry.circular(20),
            border: Border.all(color: AppColor.goldColor, width: 1.0),
          ),
          child: FittedBox(
            child: Column(
              children: [
                Image.asset(azkarImage),
                Text(
                  azkarName,
                  style: AppStyle(color: Colors.white).titleMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final List<Map<String, String>> azkarList = [
  {"name": "أذكار الصباح", "icon": PngPath.morningAzkarIcon},
  {"name": "أذكار المساء", "icon": PngPath.eveningAzkarIcon},
  {"name": "أذكار النوم", "icon": PngPath.sleepingAzkarIcon},
  {"name": "أذكار الاستيقاظ", "icon": PngPath.walkingAzkarIcon},
];
