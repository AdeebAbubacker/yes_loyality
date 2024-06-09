import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/country_code_adapter/country_code_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/country_code_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:Yes_Loyalty/ui/animations/point_details_shimmer.dart';
import 'package:Yes_Loyalty/ui/widgets/number_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// class CountryCodeScreen extends StatelessWidget {
//   String dialcode = '+';
//   Future<String> _getCountryCodesAndNames() async {
//     final box = await Hive.openBox<CountryCodeDB>('countryCodeBox');
//     final countryCodesAndNames = box.values.toList().map((user) {
//       // Extract customer ID and name safely
//       dialcode = user.dial_code?.toString() ?? 'N/A';

//       return dialcode; // Combine ID and name with separator
//     });
    
//     return dialcode;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Country Codes'),
//       ),
//       body: FutureBuilder<String>(
//         future: _getCountryCodesAndNames(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }

//           if (snapshot.connectionState == ConnectionState.done) {
//             final countryCodesAndNames = snapshot.data ?? [];
//             {
//               return Text('data ${snapshot.data.toString()}');
//             }

//             // return ListView.builder(
//             //   itemCount: countryCodesAndNames.length,
//             //   itemBuilder: (context, index) {
//             //     final countryCodeAndName = countryCodesAndNames[index];
//             //     return Text(countryCodeAndName);
//             //   },
//             // );
//             // return Column(
//             //   children: [
//             //     NumberTextFieldWithCountry(
//             //       selectedCountryCode: dialcode,
//             //       selectedDialCode: dialcode,
//             //       phoneController: TextEditingController(),
//             //       onCountryChanged:
//             //           (String newDialCode, String newCountryCode) async {},
//             //     ),
//             //   ],
//             // );
//           }

//           return CircularProgressIndicator();
//         },
//       ),
//     );
//   }
// }


// class CountryCodeScreen extends StatefulWidget {
//   @override
//   _CountryCodeScreenState createState() => _CountryCodeScreenState();
// }

// class _CountryCodeScreenState extends State<CountryCodeScreen> {
//   String dialcode = '+';

//   Future<String> _getCountryCodesAndNames() async {
//     final box = await Hive.openBox<CountryCodeDB>('countryCodeBox');
//     final countryCodes = box.values.toList();

//     // Find the first country code (assuming you want just one)
//     final firstCountryCode = countryCodes.isNotEmpty ? countryCodes.first.country_code : 'N/A';

//     // Update dialcode outside setState
//     dialcode = firstCountryCode;
//     return dialcode;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Country Codes'),
//       ),
//       body: 
      
//       FutureBuilder<String>(
//         future: _getCountryCodesAndNames(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }

//           if (snapshot.connectionState == ConnectionState.done) {
//             final countryCode = snapshot.data ?? 'N/A';
//             return Column(
//               children: [
//                 Text('Country Code: $countryCode'), // Display retrieved code
             
//               ],
//             );
//           }

//           return CircularProgressIndicator();
//         },
//       ),
    
    
//     );
//   }
// }