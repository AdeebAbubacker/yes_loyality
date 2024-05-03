import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes_loyality/core/constants/text_styles.dart';
import 'package:yes_loyality/core/constants/common.dart';
import 'package:yes_loyality/core/view_model/register/register_bloc.dart';
import 'package:yes_loyality/ui/screens/auth/user_verify/layout_view.dart';
import 'package:yes_loyality/ui/widgets/buttons.dart';
import 'package:yes_loyality/ui/widgets/number_textfield.dart';
import 'package:yes_loyality/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
TextEditingController phonecontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
TextEditingController confirmpasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double devicePadding = outerPadding(context);

    double elementPaddingVertical = elemPaddingVertical(context);

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
                      textEditingController: namecontroller,
                      hintText: 'Full Name*',
                    ),
                    SizedBox(height: elementPaddingVertical),
                     Textfield(
                      hintText: 'Email*',
                      textEditingController: emailcontroller,
                    ),
                    SizedBox(height: elementPaddingVertical),
                     NumberTextField(
                      hintText: 'Mobile Number*',
                      textEditingController: phonecontroller,
                    ),
                    SizedBox(height: elementPaddingVertical),
                    //  Spacer(),
                     Textfield(
                      hintText: 'Password*',

                      textEditingController: passwordcontroller,
                    ),
                    SizedBox(height: elementPaddingVertical),

                     Textfield(
                      hintText: 'Confirm Password*',
                      textEditingController: confirmpasswordcontroller,
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
                  BlocProvider.of<RegisterBloc>(context).add(
                      RegisterEvent.register(
                          name: namecontroller.text.toString(),
                          email: emailcontroller.text.toString(),
                          phone: phonecontroller.text.toString(),
                          password: passwordcontroller.text.toString(),
                          confirmpassword: confirmpasswordcontroller.text.toString(),));

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
              SizedBox(height: perc20),
            ],
          ),
        ),
      ),
    );
  }
}
