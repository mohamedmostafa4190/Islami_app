import 'package:flutter/material.dart';
import 'package:islami_app/core/constant/app_color.dart';
import 'package:islami_app/tabs/radio_tab/widget/build_radio_card.dart';
import 'package:islami_app/tabs/radio_tab/widget/build_tab_button.dart';
import 'package:islami_app/widget/main_background.dart';
import 'package:islami_app/widget/main_header_islami.dart';

import '../../../core/constant/images_path.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  static const String routeName = '/radioTab';

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
        children: [
          MainBackground(backGroundImage: PngPath.radioBackGround),
          Column(
            children: [
              MainHeaderIslami(),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.greyColor.withAlpha(180),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BuildTabButton(
                        text: 'Radio',
                        isSelected: _selectedIndex == 0,
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                      ),
                      BuildTabButton(
                        text: 'Reciters',
                        isSelected: _selectedIndex == 1,
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      BuildRadioCard(height: height, width: width),
                  itemCount: 5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
