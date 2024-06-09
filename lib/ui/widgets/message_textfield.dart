import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';



class MessageTextfield extends StatelessWidget {
  MessageTextfield({
    super.key,
    this.hintText,
    required this.textEditingController,
    required this.focusNode,
    TextStyle? textstyle,
    this.errorText,
    this.enabled = true,
  }) : textstyle = textstyle ?? TextStyles.rubikregular16black24w400;

  var errorText;
  final String? hintText;
  final bool enabled;
  final TextEditingController textEditingController;
  final TextStyle textstyle;
  final FocusNode focusNode;

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
        focusNode: focusNode,
        style: textstyle,
        enabled: enabled,
        controller: textEditingController,
        maxLines: 3,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: elempaddingHorizontal, vertical: elempaddingVertical),
          hintText: hintText,
          errorText: errorText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1, // Adjust border width as needed
              color: Colors.grey, // Adjust border color as needed
            ),
            borderRadius: BorderRadius.all(Radius.circular(9)),
          ),
        ),
      ),
    );
  }
}
