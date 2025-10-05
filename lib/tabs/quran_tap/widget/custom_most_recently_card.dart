import 'package:flutter/material.dart';
import 'package:islami_app/core/constant/app_const.dart';
import 'package:islami_app/tabs/quran_tap/suras_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_style.dart';
import '../../../core/constant/images_path.dart';

class MostRecentlyCard extends StatefulWidget {
  MostRecentlyCard({super.key, this.onSuraUpdated});

  final VoidCallback? onSuraUpdated;

  static Future<void> saveMostRecentlySura(int newSuraIndex) async {
    try {
      final pref = await SharedPreferences.getInstance();
      final savedList = pref.getStringList(AppConst.mostRecently) ?? [];

      if (!savedList.contains(newSuraIndex.toString())) {
        savedList.insert(0, newSuraIndex.toString());
        if (savedList.length > 5) {
          savedList.removeLast();
        }
        await pref.setStringList(AppConst.mostRecently, savedList);
      }
    } catch (e) {
      print('Error saving most recently sura: $e');
    }
  }

  @override
  State<MostRecentlyCard> createState() => _MostRecentlyCardState();
}

class _MostRecentlyCardState extends State<MostRecentlyCard> {
  List<int> mostRecentlyList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMostRecentlySura();
  }

  @override
  void didUpdateWidget(covariant MostRecentlyCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    getMostRecentlySura();
  }

  @override
  Widget build(BuildContext context) {
    return mostRecentlyList.isEmpty
        ? Center(
            child: Text(
              "No recently viewed suras yet",
              style: AppStyle(color: AppColor.goldColor).titleMedium,
            ),
          )
        : SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mostRecentlyList.length,
              itemBuilder: (context, index) {
                final suraId = mostRecentlyList[index];
                return Container(
                  width: 280,
                  margin: index == 0
                      ? EdgeInsets.only(left: 10)
                      : EdgeInsets.symmetric(horizontal: 2),
                  child: Card(
                    color: AppColor.goldColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  QuranSura.englishQuranSuraList[suraId],
                                  style: AppStyle(
                                    color: Colors.black,
                                  ).titleMedium,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  QuranSura.arabicQuranSuraList[suraId],
                                  style: AppStyle(
                                    color: Colors.black,
                                  ).titleMedium,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  '${QuranSura.versesNumberList[suraId]} Verses',
                                  style: AppStyle(
                                    color: Colors.black,
                                  ).bodySmall,
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              PngPath.imageCard,
                              fit: BoxFit.cover,
                              height: 120,
                              width: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }

  Future<void> getMostRecentlySura() async {
    final pref = await SharedPreferences.getInstance();
    final savedList = pref.getStringList(AppConst.mostRecently);
    if (savedList != null) {
      mostRecentlyList = savedList.map((e) => int.parse(e)).toList();
    }
    setState(() {});
  }
}
