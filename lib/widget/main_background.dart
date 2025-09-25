import 'package:flutter/material.dart';

class MainBackground extends StatelessWidget {
  MainBackground({super.key, this.backGroundImage});

  String? backGroundImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Image.asset('$backGroundImage', fit: BoxFit.cover),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black.withAlpha(130), Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}
