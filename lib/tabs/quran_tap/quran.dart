import 'package:flutter/material.dart';
import 'package:islami_app/tabs/quran_tap/sura_details.dart';
import 'package:islami_app/tabs/quran_tap/suras_list.dart';
import 'package:islami_app/tabs/quran_tap/view/sura_list_view.dart';
import 'package:islami_app/tabs/quran_tap/widget/custom_most_recently_card.dart';
import 'package:islami_app/tabs/quran_tap/widget/custom_search.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constant/app_style.dart';
import '../../../core/constant/images_path.dart';
import '../../core/constant/app_const.dart';
import '../../widget/main_background.dart';
import '../../widget/main_header_islami.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  static const String routeName = '/quranTap';

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          MainBackground(backGroundImage: PngPath.backGroundMosque),
          Column(
            children: [
              MainHeaderIslami(),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      sliver: SliverToBoxAdapter(
                        child: CustomSearch(
                          onChange: (value) {
                            _filterSura(value);
                          },
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 15),
                            child: Text(
                              'Most Recently',
                              style: AppStyle(color: Colors.white).titleSmall,
                            ),
                          ),
                          const SizedBox(height: 10),
                          MostRecentlyCard(
                            onSuraUpdated: () {
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          'Sura List',
                          style: AppStyle(color: Colors.white).titleSmall,
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => SuraItem(
                          index: filterList[index],
                          onTap: () async {
                            await MostRecentlyCard.saveMostRecentlySura(
                              filterList[index],
                            );
                            await Navigator.of(context).pushNamed(
                              SuraDetails.routeName,
                              arguments: filterList[index],
                            );
                            setState(() {});
                          },
                        ),
                        childCount: filterList.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> mostRecently({required int value}) async {
    final pref = await SharedPreferences.getInstance();
    List<String> recentList = pref.getStringList(AppConst.mostRecently) ?? [];
    if (!recentList.contains(value.toString())) {
      recentList.insert(0, value.toString());
    }
    if (recentList.length > 5) {
      recentList = recentList.sublist(0, 5);
    }
    await pref.setStringList(AppConst.mostRecently, recentList);
    setState(() {});
  }

  List<int> filterList = List.generate(114, (index) => index);

  void _filterSura(String value) {
    List<int> searchResultList = [];
    if (value.isNotEmpty) {
      for (int i = 0; i < 114; i++) {
        if (QuranSura.englishQuranSuraList[i].toLowerCase().contains(value)) {
          searchResultList.add(i);
        }
        if (QuranSura.arabicQuranSuraList[i].toLowerCase().contains(value)) {
          searchResultList.add(i);
        }
      }
      filterList = searchResultList;
    }
    setState(() {});
  }
}
