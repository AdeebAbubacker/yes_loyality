import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:yes_loyality/core/constants/common.dart';
import 'package:yes_loyality/core/constants/text_styles.dart';
import 'package:yes_loyality/core/view_model/login/login_bloc.dart';
import 'package:yes_loyality/ui/screens/home/layout_view.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailcontroller = TextEditingController();
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
                // context.go('/home');
                // You can also perform any other actions on success
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const HomeScreen();
                  },
                ));
              },
              authError: (value) {
                setState(() {
                  showDots = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please Enter valid email or password'),
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
                            Textfield(
                              errorText: _emailErrorText,
                              hintText: 'Enter Email',
                              textEditingController: _emailcontroller,
                            ),
                            SizedBox(height: elementPaddingVertical),
                            PassWordTextfield(
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
                              context.go("/user_signup");
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
