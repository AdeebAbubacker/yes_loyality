import 'package:carrimen_app/core/constants/text_styles.dart';
import 'package:carrimen_app/core/constants/common.dart';
import 'package:carrimen_app/ui/screens/auth/user_verify/layout_view.dart';
import 'package:carrimen_app/ui/widgets/buttons.dart';
import 'package:carrimen_app/ui/widgets/number_textfield.dart';
import 'package:carrimen_app/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double devicePadding = outerPadding(context);
    double usableWidth = innerWidth(context);
    double inputheight = inputHeight(context);

    double elementPaddingVertical = elemPaddingVertical(context);

    double height669 = screenHeight * 0.0669; // 6.69% of the screen heightwidth
    double width203 = screenWidth * 0.0203; // 2.03% of the screen width
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
            Image.asset('assets/yes_loyality_log.png'),
            SizedBox(height: perc20),
            Text(
              'Create an Account',
              style: TextStyles.rubik24black24w600,
            ),
            SizedBox(height: perc20),
            Text(
              'Sign up to join',
              style: TextStyles.rubiksemibold16grey77w400,
            ),
            SizedBox(height: perc281),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: devicePadding),
              child: Column(
                children: [
                  Textfield(
                    sizedBoxwidth: usableWidth,
                    inputHeight: inputheight,
                    hintText: 'Full Name',
                  ),
                  SizedBox(height: elementPaddingVertical),
                  Textfield(
                    sizedBoxwidth: usableWidth,
                    inputHeight: inputheight,
                    hintText: 'Email',
                  ),
                  SizedBox(height: elementPaddingVertical),
                  NumberTextField(
                    sizedBoxwidth: usableWidth,
                    inputHeight: inputheight,
                    hintText: 'Mobile Number',
                  ),
                  SizedBox(height: elementPaddingVertical),
                  Textfield(
                    sizedBoxwidth: usableWidth,
                    inputHeight: height669,
                    hintText: 'Password',
                  ),
                  SizedBox(height: elementPaddingVertical),
                  Textfield(
                    sizedBoxwidth: usableWidth,
                    inputHeight: inputheight,
                    hintText: 'Confirm Password',
                  ),
                  SizedBox(height: perc375),
                  Row(
                    children: [
                      SvgPicture.asset('assets/tick_icon.svg'),
                      SizedBox(width: width203),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'I agree to the  ',
                              style: TextStyles.rubikregular14grey66w500,
                            ),
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyles.rubikregular14black3Bw500,
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
            ColoredButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VerifyYourAccount()),
                );
              },
              text: 'Sign Up',
            ),
            SizedBox(height: perc187),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Have an account?  ',
                    style: TextStyles.rubikregular16grey77w400,
                  ),
                  TextSpan(
                    text: 'Sign in',
                    style: TextStyles.medium16black3Bw500,
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
