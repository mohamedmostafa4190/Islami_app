import 'package:flutter/material.dart';
import 'package:islami_app/tabs/quran_tap/suras_list.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_style.dart';
import '../../../core/constant/images_path.dart';

class MostRecentlyCard extends StatelessWidget {
  const MostRecentlyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Container(
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
                          QuranSura.englishQuranSuraList[index],
                          style: AppStyle(color: Colors.black).titleMedium,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          QuranSura.arabicQuranSuraList[index],
                          style: AppStyle(color: Colors.black).titleMedium,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${QuranSura.versesNumberList[index]} Verses',
                          style: AppStyle(color: Colors.black).bodySmall,
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
        ),
      ),
    );
  }
}
