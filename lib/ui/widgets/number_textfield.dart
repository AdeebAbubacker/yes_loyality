import 'package:yes_loyality/core/constants/common.dart';
import 'package:yes_loyality/core/constants/const.dart';
import 'package:yes_loyality/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class NumberTextField extends StatelessWidget {
  const NumberTextField(
      {Key? key, required this.hintText, this.textEditingController})
      : super(key: key);

  final String hintText;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    double elempaddingHorizontal = elemPaddingHorizontal(context);
    double elempaddingVertical = elemGapVertical(context);
    return Container(
      color: ColorConstants.greyF7,
      width: double.infinity,
      height: 57,
      child: TextField(
        controller: textEditingController,
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

class NumberTextFieldWithCountry extends StatefulWidget {
  final TextEditingController? phoneController;
dynamic errorText;
  final bool enabled;
   NumberTextFieldWithCountry(
      {super.key,
      this.enabled = true,
      required this.errorText,
      this.phoneController});

  @override
  State<NumberTextFieldWithCountry> createState() =>
      _NumberTextFieldWithCountryState();
}

class _NumberTextFieldWithCountryState
    extends State<NumberTextFieldWithCountry> {
  final FocusNode _phoneFocusNode = FocusNode();

  @override
  void dispose() {
    widget.phoneController?.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double elempaddingHorizontal = elemPaddingHorizontal(context);
    double elempaddingVertical = elemGapVertical(context);

    return GestureDetector(
      onTap: () {
        _phoneFocusNode.unfocus();
      },
      child: Container(
        color: ColorConstants.greyF7,
        width: double.infinity,
    
        child: IntlPhoneField(
          
          enabled: widget.enabled,
          style: TextStyles.rubikregular16black24w400,
          controller: widget.phoneController,
          disableLengthCheck: true,
          disableAutoFillHints: true,
          focusNode: _phoneFocusNode,
          decoration: InputDecoration(
            errorText: widget.errorText ,
            contentPadding: EdgeInsets.symmetric(
                horizontal: elempaddingHorizontal,
                vertical: elempaddingVertical),
            hintText: 'Phone Number',
            hintStyle: TextStyles.rubikregular16grey77w400,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 4,
                color: ColorConstants.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(9)),
            ),
          ),
          languageCode: "en",
          initialCountryCode: "AU",
          onChanged: (phone) {
            print(phone.completeNumber);
          },
          onCountryChanged: (country) {
            print('Country changed to: ' + country.name);
          },
        ),
      ),
    );
  }
}
