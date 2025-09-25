import 'package:flutter/material.dart';
import 'package:islami_app/tabs/quran_tap/sura_details.dart';
import 'package:islami_app/tabs/quran_tap/suras_list.dart';
import 'package:islami_app/tabs/quran_tap/view/sura_list_view.dart';
import 'package:islami_app/tabs/quran_tap/widget/custom_most_recently_card.dart';
import 'package:islami_app/tabs/quran_tap/widget/custom_search.dart';

import '../../../core/constant/app_style.dart';
import '../../../core/constant/images_path.dart';
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
                          const MostRecentlyCard(),
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
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              SuraDetails.routeName,
                              arguments: filterList[index],
                            );
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
