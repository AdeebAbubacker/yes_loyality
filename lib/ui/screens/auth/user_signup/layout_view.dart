import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yes_loyality/core/constants/text_styles.dart';
import 'package:yes_loyality/core/constants/common.dart';
import 'package:yes_loyality/core/view_model/register/register_bloc.dart';
import 'package:yes_loyality/ui/widgets/buttons.dart';
import 'package:yes_loyality/ui/widgets/number_textfield.dart';
import 'package:yes_loyality/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool showDots = false;
  final _namecontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailcontroller = TextEditingController();
  var _emailErrorText;
  var _phoneErrorText;
  var _passwordErrorText;
  var _confirmpasswordErrorText;
  var _nameErrorText;
  bool _formSubmitted = false; // Add this boolean flag

  @override
  void initState() {
    super.initState();
    _namecontroller.addListener(_onNameChanged);
    _emailcontroller.addListener(_onEmailChanged);
    _phonecontroller.addListener(_onPhoneChanged);
    _passwordController.addListener(_onPasswordChanged);
    _confirmpasswordcontroller.addListener(_onConfirmPasswordChanged);
  }

  @override
  void dispose() {
    _namecontroller.removeListener(_onNameChanged);
    _emailcontroller.removeListener(_onEmailChanged);
    _phonecontroller.removeListener(_onPhoneChanged);
    _passwordController.removeListener(_onPasswordChanged);
    _confirmpasswordcontroller.removeListener(_onConfirmPasswordChanged);
    super.dispose();
  }

  void _onNameChanged() {
    if (_formSubmitted) {
      // Only validate if the form has been submitted at least once
      _validateName(_namecontroller.text);
    }
  }

  void _onEmailChanged() {
    if (_formSubmitted) {
      // Only validate if the form has been submitted at least once
      _validateEmail(_emailcontroller.text);
    }
  }

  void _onPasswordChanged() {
    if (_formSubmitted) {
      // Only validate if the form has been submitted at least once
      _validatePassword(_passwordController.text);
    }
  }

  void _onConfirmPasswordChanged() {
    if (_formSubmitted) {
      // Only validate if the form has been submitted at least once
      _validateConfirmPassword(
          password: _passwordController.text,
          confirmpassword: _confirmpasswordcontroller.text);
    }
  }

  void _onPhoneChanged() {
    if (_formSubmitted) {
      // Only validate if the form has been submitted at least once
      _validatePhone(_phonecontroller.text);
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

  void _validateConfirmPassword({
    required String password,
    required String confirmpassword,
  }) {
    setState(() {
      if (confirmpassword.isEmpty) {
        _confirmpasswordErrorText = 'Password is required';
      } else if (confirmpassword.length < 8) {
        _confirmpasswordErrorText =
            'Password must be at least 8 characters long';
      } else if (password != confirmpassword) {
        _confirmpasswordErrorText = 'Passwords do not match';
      } else {
        _confirmpasswordErrorText = null;
      }
    });
  }

  void _validatePhone(String value) {
    setState(() {
      if (value.isEmpty) {
        _phoneErrorText = 'Phone no is required';
      } else if (value.length < 10) {
        _phoneErrorText = 'Phone no must be at least 10 characters long';
      } else {
        _phoneErrorText = null;
      }
    });
  }

  void _validateName(String value) {
    setState(() {
      if (value.isEmpty) {
        _nameErrorText = 'Name is required';
      } else {
        _nameErrorText = null;
      }
    });
  }

  void _submitForm() {
    setState(() {
      _formSubmitted =
          true; // Set form submitted to true when the button is clicked
      // Validate password field
      _validateName(_namecontroller.text);
      _validateEmail(_emailcontroller.text);
      _validatePassword(_passwordController.text);
      _validateConfirmPassword(
          password: _passwordController.text,
          confirmpassword: _confirmpasswordcontroller.text);
      _validatePhone(_phonecontroller.text);
    });

    BlocProvider.of<RegisterBloc>(context).add(RegisterEvent.register(
      name: _namecontroller.text.toString(),
      email: _emailcontroller.text.toString(),
      phone: _phonecontroller.text.toString(),
      password: _confirmpasswordcontroller.text.toString(),
      confirmpassword: _confirmpasswordcontroller.text.toString(),
    ));

    setState(() {
      showDots = true;
    });
  }

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
          child: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state.isError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(' error in Registration'),
                    duration: Duration(seconds: 2),
                  ),
                );
              } else if (state.isLoading) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(' loading in Registration'),
                    duration: Duration(seconds: 2),
                  ),
                );
              } else if (state.register != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Registration Succeesfull'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Column(
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
                          errorText: _nameErrorText,
                          textEditingController: _namecontroller,
                          hintText: 'Full Name*',
                        ),
                        SizedBox(height: elementPaddingVertical),
                        Textfield(
                          errorText: _emailErrorText,
                          hintText: 'Email*',
                          textEditingController: _emailcontroller,
                        ),
                        SizedBox(height: elementPaddingVertical),
                        NumberTextFieldWithCountry(
                          errorText: _phoneErrorText,
                          phoneController: _phonecontroller,
                        ),
                        SizedBox(height: elementPaddingVertical),
                        //  Spacer(),
                        Textfield(
                          errorText: _passwordErrorText,
                          hintText: 'Password*',
                          textEditingController: _passwordController,
                        ),
                        SizedBox(height: elementPaddingVertical),

                        Textfield(
                          errorText: _confirmpasswordErrorText,
                          hintText: 'Confirm Password*',
                          textEditingController: _confirmpasswordcontroller,
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
                    onPressed: _submitForm,
                    text: 'Sign Up',
                  ),
                  SizedBox(height: perc187),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account?  ",
                        style: TextStyles.rubikregular16grey77w400,
                      ),
                      InkWell(
                        onTap: () {
                          context.go("/sign_in");
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyles.medium16black3Bw500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: perc20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
