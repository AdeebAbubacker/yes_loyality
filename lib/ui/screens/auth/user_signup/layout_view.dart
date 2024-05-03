import 'package:yes_loyality/core/constants/text_styles.dart';
import 'package:yes_loyality/core/constants/common.dart';
import 'package:yes_loyality/core/constants/const.dart';
import 'package:yes_loyality/ui/widgets/number_textfield.dart';
import 'package:yes_loyality/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});

  TextEditingController namecontoller = TextEditingController();
    TextEditingController emailcontoller = TextEditingController();
      TextEditingController passwordcontoller = TextEditingController();
        TextEditingController confirmpasswordcontoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double devicePadding = outerPadding(context);
 
    double elementPaddingVertical = elemPaddingVertical(context);
    double width203 = screenWidth * 0.0203; // 2.03% of the screen width
    double buttonwidth = screenWidth * 0.8524; // 85.24% of the screen width
    double buttonheight = screenHeight * 0.0657; // 6.57% of the screen width
    double perc727 = screenHeight * 0.0727; // 7.27% of the screen height
    double perc20 = screenHeight * 0.020; // 2.00% of the screen height
    double perc187 = screenHeight * 0.0187; // 1.87% of the screen height
    double perc281 = screenHeight * 0.0281; // 2.81% of the screen height
    // double elementPaddingVertical =
    //     screenHeight * 0.0240; // 2.81% of the screen height
    double perc375 = screenHeight * 0.0375; // 3.75% of the screen height

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: perc727),
            Image.asset('assets/verified_success.png'),
            SizedBox(height: perc20),
            Text(
              'Create an Account',
              style: TextStyles.bold24black24,
            ),
            SizedBox(height: perc20),
            Text(
              'Sign up to join',
              style: TextStyles.semibold16grey77,
            ),
            SizedBox(height: perc281),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: devicePadding),
              child: Column(
                children: [
                  Textfield(
                
                    hintText: 'Full Name',
                  ),
                  SizedBox(height: elementPaddingVertical),
                  Textfield(
                
                    hintText: 'Email',
                  ),
                  SizedBox(height: elementPaddingVertical),
                  NumberTextField(
                   
                    hintText: 'Mobile Number',
                  ),
                  SizedBox(height: elementPaddingVertical),
                  Textfield(
              
                    hintText: 'Create Password',
                  ),
                  SizedBox(height: elementPaddingVertical),
                  Textfield(
             
                    hintText: 'Re-enter Password',
                  ),
                  SizedBox(height: perc375),
                  Row(
                    children: [
                      Image.asset('assets/tick_icon.png'),
                      SizedBox(width: width203),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'I agree to the  ',
                              style: TextStyles.rubikregular16black24w400,
                            ),
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyles.medium16black3B,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: perc187),
            SizedBox(
              width: buttonwidth,
              height: buttonheight,
              child: ElevatedButton(
                onPressed: () {
                   context.go('/user_verify'); 
                  // Add your onPressed logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.purpleColor96,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Sign Up', style: TextStyles.semibold16whiteFF),
              ),
            ),
            SizedBox(height: perc187),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Have an account?  ',
                    style: TextStyles.rubikregular16black24w400,
                  ),
                  TextSpan(
                    text: 'Sign in',
                    style: TextStyles.medium16black3B,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// class NumberTextField extends StatelessWidget {
//   const NumberTextField({
//     super.key,
//     required this.sizedBoxwidth,
//     required this.inputHeight,
//     required this.hintText,
//   });

//   final double sizedBoxwidth;
//   final double inputHeight;
//   final String hintText;

//   @override
//   Widget build(BuildContext context) {
//     double elempaddingHorizontal = elemPaddingHorizontal(context);
//     double elempaddingVertical = elemGapVertical(context);
//     return SizedBox(
//       width: sizedBoxwidth,
//       height: inputHeight,
//       child: TextField(
//         keyboardType: TextInputType.number,
//         style: TextStyles.rubikregular16black24w400,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(
//               horizontal: elempaddingHorizontal, vertical: elempaddingVertical),
//           hintText: hintText,
//           hintStyle: TextStyles.rubikregular16grey77w400,
//           border: const OutlineInputBorder(
//             borderSide: BorderSide(
//               width: 4,
//               color: ColorConstants.grey,
//             ),
//             borderRadius: BorderRadius.all(Radius.circular(9)),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NumberTextField extends StatelessWidget {
//   const NumberTextField({
//     Key? key,
//     required this.sizedBoxwidth,
//     required this.inputHeight,
//     required this.hintText,
//   }) : super(key: key);

//   final double sizedBoxwidth;
//   final double inputHeight;
//   final String hintText;

//   @override
//   Widget build(BuildContext context) {
//     double elempaddingHorizontal = elemPaddingHorizontal(context);
//     double elempaddingVertical = elemGapVertical(context);
//     return Row(
//       children: [
//         CountryCodePicker(
//           onChanged: (CountryCode? countryCode) {
//             // Handle country code change
//           },
//           initialSelection: 'IN', // Initial country code set to India
//           favorite: ['IN'], // Optional: Set India as a favorite country
//           showCountryOnly: false,
//           showOnlyCountryWhenClosed: false,
//           alignLeft: false,
//         ),
//         SizedBox(width: 8), // Adjust as needed for spacing
//         Expanded(
//           child: SizedBox(
//             width: sizedBoxwidth,
//             height: inputHeight,
//             child: TextField(
//               keyboardType: TextInputType.number,
//               style: TextStyles.rubikregular16black24w400,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(
//                   horizontal: elempaddingHorizontal,
//                   vertical: elempaddingVertical,
//                 ),
//                 hintText: hintText,
//                 hintStyle: TextStyles.rubikregular16grey77w400,
//                 border: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     width: 4,
//                     color: ColorConstants.grey,
//                   ),
//                   borderRadius: BorderRadius.all(Radius.circular(9)),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
