import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:yes_loyality/core/constants/common.dart';
import 'package:yes_loyality/core/constants/text_styles.dart';
import 'package:yes_loyality/core/view_model/login/login_bloc.dart';
import 'package:yes_loyality/ui/widgets/buttons.dart';
import 'package:yes_loyality/ui/widgets/password_textfield.dart';
import 'package:yes_loyality/ui/widgets/textfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool showDots = false;


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double devicePadding = outerPadding(context);
    double elementPaddingVertical = elemPaddingVertical(context);
    double perc20 = screenHeight * 0.020;
    double perc187 = screenHeight * 0.0187;
    double perc281 = screenHeight * 0.0281;
    double perc375 = screenHeight * 0.0375;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            state.maybeMap(
              authsuccess: (value) {
                setState(() {
                  // showDots = false;
                });
                // Navigate to home screen on successful login
                context.go('/home');
                // You can also perform any other actions on success
              },
              authError: (value) {
                setState(() {
                  showDots = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Login failed: ${value.message}'),
                    duration: const Duration(seconds: 2),
                  ),
                );
                // You can also perform any other actions on failure
              },
              loading: (_) {
                // You can show loading indicators or perform other actions during loading
              },
              orElse: () {
                // Handle other states or do nothing
              },
            );
          },
          builder: (context, state) {
            return Center(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      Image.asset('assets/yes_loyality_log.png'),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: devicePadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Textfield(
                              hintText: 'Enter Email',
                            ),
                            SizedBox(height: elementPaddingVertical),
                            const PassWordTextfield(
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
                        onPressed: () {
                          BlocProvider.of<LoginBloc>(context).add(
                            const LoginEvent.signInWithEmailAndPassword(
                              email: 'adeep@gmail.com',
                              password: 'Rishi@123',
                            ),
                          );
                          setState(() {
                            showDots = true;
                          });
                        },
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
                   Align(
      alignment: Alignment.bottomCenter,
      child: Visibility(
        visible: showDots,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Container(
            width: 120,
            height: 40,
            decoration: const BoxDecoration(
              color: Color.fromARGB(137, 212, 210, 210),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: JumpingDots(
              color: const Color.fromARGB(255, 129, 106, 205),
            ),
          ),
        ),
      ),
    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
