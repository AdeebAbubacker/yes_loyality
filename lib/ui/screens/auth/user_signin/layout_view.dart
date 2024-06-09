import 'package:Yes_Loyalty/core/routes/app_route_config.dart';
import 'package:Yes_Loyalty/ui/animations/toast.dart';
import 'package:Yes_Loyalty/ui/screens/auth/user_signup/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/view_model/login/login_bloc.dart';
import 'package:Yes_Loyalty/ui/screens/home/layout_view.dart';
import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:Yes_Loyalty/ui/widgets/password_textfield.dart';
import 'package:Yes_Loyalty/ui/widgets/textfield.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/signIn';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool showDots = false;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailcontroller = TextEditingController();
  final FocusNode emailfocusNode = FocusNode();
  final FocusNode passwordfocusNode = FocusNode();
  String? _emailErrorText;
  String? _passwordErrorText;
  bool _formSubmitted = false; // Add this boolean flag

  @override
  void initState() {
    super.initState();
    _emailcontroller.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _emailcontroller.removeListener(_onEmailChanged);
    _passwordController.removeListener(_onPasswordChanged);
    super.dispose();
  }

  void _onEmailChanged() {
    if (_formSubmitted) {
      // Only validate if the form has been submitted at least once
      _validateEmail(_emailcontroller.text);
    }
  }

  void _validateEmail(String value) {
    if (value.isEmpty) {
      setState(() {
        _emailErrorText = 'Email is required';
      });
    } else {
      // Clear error if value becomes non-empty
      if (_emailErrorText != null) {
        setState(() {
          _emailErrorText = null;
        });
      }
      if (!isEmailValid(value)) {
        setState(() {
          _emailErrorText = 'Enter a valid email address';
        });
      }
    }
  }

  bool isEmailValid(String email) {
    // Basic email validation using regex
    // You can implement more complex validation if needed
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  void _onPasswordChanged() {
    if (_formSubmitted) {
      // Only validate if the form has been submitted at least once
      _validatePassword(_passwordController.text);
    }
  }

  void _validatePassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _passwordErrorText = 'Password is required';
      } else if (value.length < 8) {
        _passwordErrorText = 'Password must be at least 8 characters long';
      } else {
        _passwordErrorText = null;
      }
    });
  }

  void _submitForm() {
    setState(() {
      _formSubmitted =
          true; // Set form submitted to true when the button is clicked
      // Validate password field
      _validateEmail(_emailcontroller.text);
      _validatePassword(_passwordController.text);
    });

    BlocProvider.of<LoginBloc>(context).add(
      LoginEvent.signInWithEmailAndPassword(
        email: _emailcontroller.text,
        password: _passwordController.text,
        // email: emailcontroller.text,
        // password: emailcontroller.text,
      ),
    );
    setState(() {
      showDots = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double devicePadding = outerPadding(context);
    double elementPaddingVertical = elemPaddingVertical(context);
    double perc20 = screenHeight * 0.020;
    double perc187 = screenHeight * 0.0187;
    double perc281 = screenHeight * 0.0281;
    double perc375 = screenHeight * 0.0375;

    return GestureDetector(
      onTap: (){
        emailfocusNode.unfocus();
        passwordfocusNode.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              state.maybeMap(
                authsuccess: (value) {
                  setState(() {
                    showDots = false;
                  });
      
                  return navigateToHomeCleared(context);
      
                  // You can also perform any other actions on success
                },
                authError: (value) {
                  setState(() {
                    showDots = false;
                  });
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text(value.message),
                  //     duration: const Duration(seconds: 2),
                  //   ),
                  // );
                  showCustomToast(
                    context, "${value.message}",
                    MediaQuery.of(context).size.height *
                        0.9, // Adjust vertical position here
                  );
                },
                validationError: (value) {
                  setState(() {
                    showDots = false;
                  });
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text(value.Error),
                  //     duration: const Duration(seconds: 2),
                  //   ),
                  // );
                  showCustomToast(
                    context, "${value.Error}",
                    MediaQuery.of(context).size.height *
                        0.9, // Adjust vertical position here
                  );
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
                        // const SizedBox(
                        //   height: 70,
                        // ),
      
                        FractionallySizedBox(
                          widthFactor: 0.75, // Take full available width
                          child: Image.asset(
                            'assets/yes_loyality_s.png',
                            fit: BoxFit
                                .contain, // Maintain aspect ratio while fitting the image within the box
                          ),
                        ),
      
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
                              Textfield(
                                focusNode: emailfocusNode,
                                errorText: _emailErrorText,
                                hintText: 'Enter Email',
                                textEditingController: _emailcontroller,
                              ),
                              SizedBox(height: elementPaddingVertical),
                              PassWordTextfield(
                                focusNode: passwordfocusNode,
                                errorText: _passwordErrorText,
                                hintText: 'Enter Password',
                                textEditingController: _passwordController,
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
                          onPressed: _submitForm,
                          text: 'Sign In',
                        ),
                        SizedBox(height: perc187),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?  ",
                              style: TextStyles.rubikregular16black24w400,
                            ),
                            InkWell(
                              onTap: () {
                                navigateToSignUp(context);
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyles.medium16black3B,
                              ),
                            ),
                          ],
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
                              color: Color.fromARGB(210, 255, 109, 111),
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
      ),
    );
  }
}
