import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/country_code_adapter/country_code_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/country_code_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/ui/animations/point_details_shimmer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

// class NumberTextFieldWithCountry extends StatefulWidget {
//   TextEditingController phoneController = TextEditingController();
//   String? selectedDialCode;
//   String? selectedCountryCode;
//   final Function(String, String)? onCountryChanged;
//   dynamic errorText;
//   final bool enabled;
//   dynamic textstyle = TextStyles.rubikregular16black24w400;
//   NumberTextFieldWithCountry({
//     super.key,
//     this.enabled = true,
//     this.errorText,
//     this.selectedDialCode = 'AU',
//     this.selectedCountryCode = '+91',
//     this.textstyle,   this.onCountryChanged,
//     required this.phoneController,
//   });

//   @override
//   State<NumberTextFieldWithCountry> createState() => _NumberTextFieldWithCountryState();
// }

// class _NumberTextFieldWithCountryState extends State<NumberTextFieldWithCountry> {

// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//    // _loadCountryDataFromHive(countryCodeBox);
//   }

//   // _loadCountryDataFromHive(countryCodeBox) async {
//   //   CountryCodeDB codeDB = countryCodeBox.get(0);
//   //   if (codeDB != null) {
//   //     setState(() {
//   //      widget. selectedDialCode = codeDB.dial_code ?? 'AU';
//   //       widget.selectedCountryCode = codeDB.country_code ?? 'AU';
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     double elempaddingHorizontal = elemPaddingHorizontal(context);
//     double elempaddingVertical = elemGapVertical(context);

//     return Container(
//       color: ColorConstants.greyF7,
//       width: double.infinity,
//       child: IntlPhoneField(

//         enabled: widget.enabled,
//         style: widget.textstyle,
//         controller: widget.phoneController,
//         disableLengthCheck: true,
//         disableAutoFillHints: true,
//         inputFormatters: [
//           FilteringTextInputFormatter.digitsOnly,
//           LengthLimitingTextInputFormatter(13),
//         ],
//         decoration: InputDecoration(
//           errorText: widget.errorText,
//           contentPadding: EdgeInsets.symmetric(
//             horizontal: elempaddingHorizontal,
//             vertical: elempaddingVertical,
//           ),
//           hintStyle: TextStyles.rubikregular16grey77w400,
//           border: const OutlineInputBorder(
//             borderSide: BorderSide(
//               width: 4,
//               color: ColorConstants.grey,
//             ),
//             borderRadius: BorderRadius.all(Radius.circular(9)),
//           ),
//         ),
//         languageCode: "en",

//         initialCountryCode:
//            widget.selectedCountryCode, // Default to India if not provided
//         onChanged: (phone) {
//           print(phone.completeNumber);
//         },
//         onCountryChanged: (country) {
//           if (widget.onCountryChanged != null) {
//             widget.onCountryChanged!(country.dialCode, country.code);
//             print("Country changed to: ${country.code}, Dial code: ${country.dialCode}"); // Debug print
//           }
//         },
//       ),
//     );
//   }
// }

class NumberTextFieldWithCountry extends StatefulWidget {
  TextEditingController phoneController = TextEditingController();
  String? selectedDialCode;
  String? selectedCountryCode;
  final Function(String, String)? onCountryChanged;
  dynamic errorText;
  final bool enabled;
  final FocusNode focusNode;
  dynamic textstyle = TextStyles.rubikregular16black24w400;

  NumberTextFieldWithCountry({
    super.key,
    this.enabled = true,
    this.errorText,
    this.selectedDialCode = '61',
    this.selectedCountryCode = 'AU',
    this.textstyle,
    this.onCountryChanged,
    required this.phoneController,
    required this.focusNode
  });

  @override
  State<NumberTextFieldWithCountry> createState() =>
      _NumberTextFieldWithCountryState();
}

class _NumberTextFieldWithCountryState
    extends State<NumberTextFieldWithCountry> {
  @override
  void initState() {
    super.initState();
    _loadCountryCode();
  }

  Future<void> _loadCountryCode() async {
    String? countryCode = await GetSharedPreferences.getCountrycodes();

    setState(() {
      widget.selectedCountryCode = countryCode ?? 'AU';
    });
  }

  @override
  Widget build(BuildContext context) {
    double elempaddingHorizontal = elemPaddingHorizontal(context);
    double elempaddingVertical = elemGapVertical(context);

    return Container(
      color: ColorConstants.greyF7,
      width: double.infinity,
      child: IntlPhoneField(
        focusNode: widget.focusNode,
        key: ValueKey(widget.selectedCountryCode), // Add this line
        enabled: widget.enabled,
        style: widget.textstyle,
        controller: widget.phoneController,
        disableLengthCheck: true,
        disableAutoFillHints: true,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(13),
        ],
        decoration: InputDecoration(
          errorText: widget.errorText,
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
        initialCountryCode: widget.selectedCountryCode!.isEmpty ? 'AU' : widget.selectedCountryCode,
        onChanged: (phone) {
          print(phone.completeNumber);
        },
        onCountryChanged: (country) {
          if (widget.onCountryChanged != null) {
            widget.onCountryChanged!(country.dialCode, country.code);
            print(
                "Country changed to: ${country.code}, Dial code: ${country.dialCode}");
          }
        },
      ),
    );
  }
}
