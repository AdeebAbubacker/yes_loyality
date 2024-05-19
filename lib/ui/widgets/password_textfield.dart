import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class PassWordTextfield extends StatefulWidget {
   PassWordTextfield({
    super.key,
    required this.hintText,
    this.textEditingController,
    this.errorText,
  });

  final String hintText;
  var errorText;
  final TextEditingController? textEditingController;

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
      width: double.infinity,
     // height: 57,
      child: TextField(
        controller: widget.textEditingController,
        obscureText: _obscureText,
        style: TextStyles.rubikregular16black24w400,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: elempaddingHorizontal,
            vertical: elempaddingVertical,
          ),
          hintText: widget.hintText,
          errorText: widget.errorText,
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
