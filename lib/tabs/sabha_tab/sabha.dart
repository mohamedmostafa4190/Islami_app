import 'package:flutter/material.dart';
import 'package:islami_app/widget/main_background.dart';
import 'package:islami_app/widget/main_header_islami.dart';

import '../../../core/constant/app_style.dart';
import '../../../core/constant/images_path.dart';

class SabhaTab extends StatefulWidget {
  SabhaTab({super.key});

  static const String routeName = '/sabhaTab';

  @override
  State<SabhaTab> createState() => _SabhaTabState();
}

class _SabhaTabState extends State<SabhaTab> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    PageController pageController = PageController();
    return SafeArea(
      child: Stack(
        children: [
          MainBackground(backGroundImage: PngPath.sabhaBackGround),
          Column(
            children: [
              MainHeaderIslami(),
              Text(
                'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                style: AppStyle(color: Colors.white).headlineLarge,
              ),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: tasbihList.length,
                  itemBuilder: (context, index) => Stack(
                    alignment: Alignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (counter[index] > 0) {
                              counter[index]--;
                            } else if (index < tasbihList.length - 1) {
                              pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              counter = List.filled(10, 33);
                              pageController.jumpToPage(0);
                            }
                          });
                        },
                        child: Image.asset(
                          PngPath.sabhaBody,
                          height: 0.45 * height,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 0.07 * height),
                          Container(
                            constraints: BoxConstraints(maxWidth: width * 0.6),
                            padding: EdgeInsets.all(16),
                            child: Text(
                              tasbihList[index],
                              style: AppStyle(color: Colors.white).titleLarge,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${counter[index]}',
                            style: AppStyle(color: Colors.white).titleLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<int> counter = List.filled(10, 33);
  List<String> tasbihList = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
    'أستغفر الله',
    'سبحان الله وبحمده',
    'سبحان الله العظيم',
    'لا حول ولا قوة إلا بالله',
    'اللهم صل على محمد وعلى آل محمد',
    'سبحان الله وبحمده سبحان الله العظيم',
  ];
}
