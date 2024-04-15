import 'package:carrimen_app/core/constants/common.dart';
import 'package:carrimen_app/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class PassWordTextfield extends StatefulWidget {
  const PassWordTextfield({
    super.key,
    required this.sizedBoxwidth,
    required this.inputHeight,
    required this.hintText,
  });

  final double sizedBoxwidth;
  final double inputHeight;
  final String hintText;

  @override
  _PassWordTextfieldState createState() => _PassWordTextfieldState();
}

class _PassWordTextfieldState extends State<PassWordTextfield> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double elempaddingHorizontal = elemPaddingHorizontal(context);
    double elempaddingVertical = elemGapVertical(context);
    return SizedBox(
      width: widget.sizedBoxwidth,
      height: widget.inputHeight,
      child: TextField(
        obscureText: _obscureText,
        style: TextStyles.rubikregular16black24w400,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: elempaddingHorizontal,
            vertical: elempaddingVertical,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyles.rubikregular16grey77w400,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 4,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(Radius.circular(9)),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
    );
  }
}
