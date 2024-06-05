import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/country_code_adapter/country_code_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/country_code_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class NumberTextFieldWithCountry extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();
  String? selectedDialCode;
  String? selectedCountryCode;
  dynamic errorText;
  final bool enabled;
  dynamic textstyle = TextStyles.rubikregular16black24w400;
  NumberTextFieldWithCountry({
    super.key,
    this.enabled = true,
    this.errorText,
    this.selectedDialCode,
    this.selectedCountryCode,
    this.textstyle,
    required this.phoneController,
  });

  final FocusNode _phoneFocusNode = FocusNode();

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
          enabled: enabled,
          style: textstyle,
          controller: phoneController,
          disableLengthCheck: true,
          disableAutoFillHints: true,
          focusNode: _phoneFocusNode,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(13),
          ],
          decoration: InputDecoration(
            errorText: errorText,
            contentPadding: EdgeInsets.symmetric(
              horizontal: elempaddingHorizontal,
              vertical: elempaddingVertical,
            ),
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
          initialCountryCode: selectedCountryCode ??
              'IN', // Default to India if not provided
          onChanged: (phone) {
            print(phone.completeNumber);
          },
          onCountryChanged: (country) {
            selectedCountryCode = country.code;
            selectedDialCode = country.dialCode;

            print('Country changed to: ${country.code}');
            print('Dial changed to: $selectedDialCode');

            print(countryCodeBox);
          },
        ),
      ),
    );
  }
}
