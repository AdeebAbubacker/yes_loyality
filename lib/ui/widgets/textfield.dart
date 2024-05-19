import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:flutter/material.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';

class Textfield extends StatelessWidget {
   Textfield({
    super.key,
    required this.hintText,
    this.textEditingController,
    this.errorText,
    this.enabled = true,
  });
  var errorText;
  final String hintText;
  final bool enabled;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    double elempaddingHorizontal = elemPaddingHorizontal(context);
    double elempaddingVertical = elemGapVertical(context);
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorConstants.greyF7,
        borderRadius: BorderRadius.all(Radius.circular(9)),
      ),
      child: TextField(
        enabled: enabled,
        controller: textEditingController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: elempaddingHorizontal, vertical: elempaddingVertical),
          hintText: hintText,
          errorText: errorText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 4,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(Radius.circular(9)),
          ),
        ),
      ),
    );
  }
}
