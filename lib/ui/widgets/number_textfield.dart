
import 'package:carrimen_app/core/constants/common.dart';
import 'package:carrimen_app/core/constants/const.dart';
import 'package:carrimen_app/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class NumberTextField extends StatelessWidget {
  const NumberTextField({
    Key? key,
    required this.sizedBoxwidth,
    required this.inputHeight,
    required this.hintText,
  }) : super(key: key);

  final double sizedBoxwidth;
  final double inputHeight;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    double elempaddingHorizontal = elemPaddingHorizontal(context);
    double elempaddingVertical = elemGapVertical(context);
    return Container(
      color: ColorConstants.greyF7,
      width: sizedBoxwidth,
      height: inputHeight,
      child: TextField(
        keyboardType: TextInputType.number, // Set keyboard type to number
        style: TextStyles.rubikregular16black24w400,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: elempaddingHorizontal, vertical: elempaddingVertical),
          hintText: hintText,
          hintStyle: TextStyles.rubikregular16grey77w400,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 4,
              color: ColorConstants.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(9)),
          ),
        ),
      ),
    );
  }
}
