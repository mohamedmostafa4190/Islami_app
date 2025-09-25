import 'package:flutter/material.dart';

import '../core/constant/images_path.dart';

class MainHeaderIslami extends StatelessWidget {
  const MainHeaderIslami({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(35),
      child: Image.asset(
        PngPath.imageHeader,
        fit: BoxFit.cover,
        height: 140,
        width: 300,
      ),
    );
  }
}
