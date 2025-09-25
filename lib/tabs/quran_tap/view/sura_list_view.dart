import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constant/images_path.dart';
import '../suras_list.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({super.key, required this.onTap, required this.index});

  final int index;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap!();
      },
      leading: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(SvgPath.imageSuraFrame),
          Text(
            '${index + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      title: Text(
        QuranSura.englishQuranSuraList[index],
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        '${QuranSura.versesNumberList[index]} Verses',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: Text(
        QuranSura.arabicQuranSuraList[index],
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
