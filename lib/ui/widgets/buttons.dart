import 'package:carrimen_app/core/constants/common.dart';
import 'package:carrimen_app/core/constants/const.dart';
import 'package:carrimen_app/core/constants/text_styles.dart';
import 'package:flutter/material.dart';


class ColorlessButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const ColorlessButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);
    double screenwidth = screenWidth(context);
    final buttonwidth = screenwidth * 335 / FigmaConstants.figmaDeviceWidth;
    final buttonheigth = screenheight * 56 / FigmaConstants.figmaDeviceHeight;
    return SizedBox(
      width: buttonwidth,
      height: buttonheigth,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            ColorConstants.whiteColorFF,
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(
                color: Color(0xFFEE1F23),
                width: 1.0,
              ),
            ),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyles.semibold16red23,
        ),
      ),
    );
  }
}

class GreyColorButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const GreyColorButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);
    double screenwidth = screenWidth(context);
    final buttonwidth = screenwidth * 335 / FigmaConstants.figmaDeviceWidth;
    final buttonheigth = screenheight * 56 / FigmaConstants.figmaDeviceHeight;
    return SizedBox(
      width: buttonwidth,
      height: buttonheigth,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            ColorConstants.greyF5,
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(
                color: ColorConstants.greyF5,
                width: 1.0,
              ),
            ),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyles.medium14grey77,
        ),
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const AddToCartButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);
    double screenwidth = screenWidth(context);
    final buttonwidth = screenwidth * 133 / FigmaConstants.figmaDeviceWidth;
    final buttonheight = screenheight * 36 / FigmaConstants.figmaDeviceHeight;

    return SizedBox(
      width: buttonwidth,
      height: buttonheight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.purpleColor96,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(text, style: TextStyles.semiBold14whiteFF),
      ),
    );
  }
}

class ColoredButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const ColoredButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);
    double screenwidth = screenWidth(context);
    final buttonwidth = screenwidth * 335 / FigmaConstants.figmaDeviceWidth;
    final buttonheight = screenheight * 56 / FigmaConstants.figmaDeviceHeight;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: buttonwidth,
        height: buttonheight,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFF6D70),
                      Color(0xFFEE1F23),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: buttonwidth,
              height: buttonheight,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(5),
                  onTap: onPressed,
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyles.rubikmedium16whiteFF,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
