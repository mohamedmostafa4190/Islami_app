import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/constant/app_color.dart';
import 'package:islami_app/tabs/quran_tap/suras_list.dart';

import '../../../core/constant/app_style.dart';
import '../../../core/constant/images_path.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});

  static const String routeName = '/suraDetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  @override
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColor.goldColor),
        ),
        centerTitle: true,
        title: Text(
          QuranSura.englishQuranSuraList[index],
          textAlign: TextAlign.center,
          style: AppStyle(color: AppColor.goldColor).titleMedium,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(PngPath.imageLhsCorner, width: 93, height: 92),
                  Text(
                    QuranSura.arabicQuranSuraList[index],
                    style: AppStyle(color: AppColor.goldColor).titleMedium,
                  ),
                  Image.asset(PngPath.imageRhtCorner, width: 93, height: 92),
                ],
              ),
            ),
            verses.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: RichText(
                          text: TextSpan(
                            style: AppStyle(
                              color: AppColor.goldColor,
                            ).bodyLarge,
                            children: verses
                                .map(
                                  (verse) => TextSpan(
                                    text:
                                        '$verse(${verses.indexOf(verse) + 1}) ',
                                  ),
                                )
                                .toList(),
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
            Image.asset(PngPath.imgBottomDecoration),
          ],
        ),
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/Suras/${index + 1}.txt',
    );
    setState(() {
      List<String> suraContents = fileContent.trim().split('\n');
      verses = suraContents.map((verse) => '$verse').toList();
    });
  }
}
