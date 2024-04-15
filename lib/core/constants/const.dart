import 'package:carrimen_app/core/constants/common.dart';
import 'package:flutter/material.dart';

class ColorConstants {
  static const purpleColor96 = Color(0xFFC83E96);
  static const whiteColorFF = Color(0xFFFFFFFF);
  static const greyF7 = Color(0xFFF7F7F7);
  static const grey = Colors.grey;
  static const greyD9 = Color(0xFFD9D9D9);
  static const greyD7 = Color(0xFFD7D7D7);
  static const greyF5 = Color(0xFFF5F5F5);
  static const Color purpleColorF8 = Color(0xFFFFEBF8);
  static const Color secondaryTextColor = Color(0xFF777777);
  static const Color dividerColor = const Color(0xFFEDEDED);
}

class WidthConstants {
  static const double buttonWidth = 330;
  static const double buttonHeight = 50;
  static const double sizedboxWidth = 25;
}

class PaddingConstant {
  static const outerPadding = const EdgeInsets.only(left: 30, right: 30);
  static const innerPadding =
      const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20);
  static const categoriesPadding = const EdgeInsets.only(left: 30, right: 3);
}

class FigmaConstants {
  static const double figmaDeviceHeight = 852;
  static const double figmaDeviceWidth = 393;
}

class HorizontalSpacing extends StatelessWidget {
  final double width;
  const HorizontalSpacing({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: spacingHorizontal(
      context,
      width: width,
    ));
  }
}

class VerticalSpacing extends StatelessWidget {
  final double height;
  const VerticalSpacing({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: spacingVertical(
      context,
      height: height,
    ));
  }
}
