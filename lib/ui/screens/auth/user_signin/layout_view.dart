import 'package:carrimen_app/core/constants/text_styles.dart';
import 'package:carrimen_app/core/constants/common.dart';
import 'package:carrimen_app/ui/widgets/buttons.dart';
import 'package:carrimen_app/ui/widgets/number_textfield.dart';
import 'package:carrimen_app/ui/widgets/password_textfield.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
  //  double screenWidth = MediaQuery.of(context).size.width;
    double devicePadding = outerPadding(context);
    double usableWidth = innerWidth(context);
    double inputheight = inputHeight(context);
    double elementPaddingVertical = elemPaddingVertical(context);
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
            Image.asset('assets/carrimen_logo_1.png'),
            SizedBox(height: perc20),
            Text(
              'Hello, Welcome back!',
              style: TextStyles.bold24black24,
            ),
            SizedBox(height: perc20),
            Text(
              'Sign in to continue',
              style: TextStyles.semibold16grey77,
            ),
            SizedBox(height: perc281),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: devicePadding),
              child: Column(
                children: [
                  NumberTextField(
                    sizedBoxwidth: usableWidth,
                    inputHeight: inputheight,
                    hintText: 'Mobile Number',
                  ),
                  SizedBox(height: elementPaddingVertical),
                  PassWordTextfield(
                    sizedBoxwidth: usableWidth,
                    inputHeight: inputheight,
                    hintText: 'Enter Password',
                  ),
                  SizedBox(height: perc187),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Forgot your password ?',
                      style: TextStyles.medium11grey66,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: perc375),
            ColoredButton(
        
              onPressed: () {},
              text: 'Sign In',
            ),
            SizedBox(height: perc187),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account?  ",
                    style: TextStyles.rubikregular16black24w400,
                  ),
                  TextSpan(
                    text: 'Sign Up',
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
