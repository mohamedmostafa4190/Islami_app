import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/constant/app_color.dart';
import 'package:islami_app/widget/main_header_islami.dart';

import '../../core/constant/app_style.dart';
import '../../core/constant/images_path.dart';
import '../../widget/main_background.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  static const String routeName = '/HadethTab';

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  int currentIndex = 0;
  PageController? pageController;
  List<Hadeth> hadethList = [];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 5, viewportFraction: 0.8);
    loadHadeth();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
        children: [
          MainBackground(backGroundImage: PngPath.hadethBackGround),
          Column(
            children: [
              MainHeaderIslami(),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemCount: hadethList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: currentIndex == index ? 10 : 30,
                      horizontal: 2,
                    ),
                    child: SizedBox(
                      height: height * 0.25,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: AppColor.goldColor,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      color: Colors.black,
                                      PngPath.imageLhsCorner,
                                      width: width * 0.17,
                                      fit: BoxFit.contain,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: FittedBox(
                                          child: Text(
                                            '${hadethList[index].title}',
                                            style: AppStyle(
                                              color: Colors.black,
                                            ).titleLarge,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                      color: Colors.black,
                                      PngPath.imageRhtCorner,
                                      width: width * 0.17,
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                                Text(
                                  '${hadethList[index].content}',
                                  style: AppStyle(
                                    color: Colors.black,
                                  ).bodyLarge,
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> loadHadeth() async {
    List<Hadeth> loadedHadiths = [];

    for (int i = 1; i <= 50; i++) {
      String fileContent = await rootBundle.loadString(
        'assets/Hadeeth/h$i.txt',
      );
      List<String> lines = fileContent.trim().split('\n');

      if (lines.isNotEmpty) {
        String title = lines[0];
        String content = lines.skip(1).join('\n');
        loadedHadiths.add(Hadeth(title, content));
      }
    }

    setState(() {
      hadethList = loadedHadiths;
    });

    print("Loaded ${hadethList.length} Hadeths");
  }
}

class Hadeth {
  String? title;
  String? content;

  Hadeth(this.title, this.content);
}
