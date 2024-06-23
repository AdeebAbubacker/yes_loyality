import 'package:Yes_Loyalty/core/routes/app_route_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/view_model/register/register_bloc.dart';
import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:Yes_Loyalty/ui/widgets/name_textfield.dart';
import 'package:Yes_Loyalty/ui/widgets/number_textfield.dart';
import 'package:Yes_Loyalty/ui/widgets/password_textfield.dart';
import 'package:Yes_Loyalty/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
  String selectedDialCode = "61";
  String? selectedCountryCode = "AU";
  bool isTermsAgreed = false;
  Future<void>? _launched;
  FocusNode namefocusNode = FocusNode();
  FocusNode emailfocusNode = FocusNode();
  FocusNode phonefocusNode = FocusNode();
  FocusNode passwordfocusNode = FocusNode();
  FocusNode confirmpassfocusNode = FocusNode();
  double _bottomInset = 0.0; // Bottom inset (keyboard height)

  @override
  void dispose() {
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _phonecontroller.dispose();
    _passwordController.dispose();
    _confirmpasswordcontroller.dispose();

    namefocusNode.dispose();
    emailfocusNode.dispose();
    phonefocusNode.dispose();
    passwordfocusNode.dispose();
    confirmpassfocusNode.dispose();

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
          _emailErrorText = 'The email field must be a valid email address';
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
        _confirmpasswordErrorText = 'Passwords do not match';
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

  // Future<void> _saveCountryCodeToHive(
  //     String dialCode, String countryCode) async {
  //   final box = await Hive.openBox<CountryCodeDB>('countryCodeBox');
  //   final countryCodeDB =
  //       CountryCodeDB(dial_code: dialCode, country_code: countryCode);
  //   await box.put(0, countryCodeDB);
  //   print("Saved to Hive: $dialCode, $countryCode"); // Debug print
  // }

  void _submitForm() {
    if (isTermsAgreed) {
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
        showDots = true;
      });
      if (_namecontroller.text.isNotEmpty &&
          _emailcontroller.text.isNotEmpty &&
          _phonecontroller.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmpasswordcontroller.text.isNotEmpty) {
        BlocProvider.of<RegisterBloc>(context).add(RegisterEvent.register(
          name: _namecontroller.text.toString(),
          email: _emailcontroller.text.toString(),
          phone:
              '+${selectedDialCode.toString()}${_phonecontroller.text.toString()}',
          password: _passwordController.text.toString(),
          confirmpassword: _confirmpasswordcontroller.text.toString(),
        ));
      }

      print('aaaaaaaaaaaaaa${_phonecontroller.text.toString()}');
      print(
          'vvvvvvvvvvvvvvvvvvv+${selectedDialCode}${_phonecontroller.text.toString()}');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("You must accept the Terms of Service")));
    }
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri termsandService = Uri(
      scheme: 'https',
      host: 'yl.tekpeak.in',
      path: '/term-conditions',
    );
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
    double adeebpadding = MediaQuery.of(context).size.width * 0.04;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: BlocConsumer<RegisterBloc, RegisterState>(
                            listener: (context, state) {
                              state.map(
                                initial: (_) {},
                                loading: (_) {},
                                success: (_) {
                                  Future.delayed(Duration(seconds: 2),
                                      () async {
                                    navigateToAccountCreatedSuccess(context);
                                    // Navigator.of(context).pop();
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Registration Successful')),
                                  );
                                },
                                failure: (state) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Registration Failed')),
                                  );
                                },
                                validationError: (state) {
                                  setState(() {
                                    _nameErrorText = state.nameError;
                                    _emailErrorText = state.emailError;
                                    _phoneErrorText = state.phoneError;
                                    _passwordErrorText = state.passwordError;
                                    _confirmpasswordErrorText =
                                        state.passwordConfirmError;
                                  });
                                  print('Validation Error:');
                                  print('Name Error: ${state.nameError}');
                                  print('Email Error: ${state.emailError}');
                                  print('Phone Error: ${state.phoneError}');
                                  print(
                                      'Password Error: ${state.passwordError}');
                                  print(
                                      'Password Confirm Error: ${state.passwordConfirmError}');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Registration Failed')),
                                  );
                                },
                              );
                            },
                            builder: (context, state) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: perc727),
                                  FractionallySizedBox(
                                    widthFactor:
                                        0.75, // Take full available width
                                    child: Image.asset(
                                      'assets/yes_loyality_s.png',
                                      fit: BoxFit
                                          .contain, // Maintain aspect ratio while fitting the image within the box
                                    ),
                                  ),

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
                                    padding: EdgeInsets.symmetric(
                                        horizontal: devicePadding),
                                    child: Column(
                                      children: [
                                        NameTextfield(
                                            focusNode: namefocusNode,
                                            textstyle: TextStyles
                                                .rubikregular16black24w400,
                                            errorText: _nameErrorText,
                                            textEditingController:
                                                _namecontroller,
                                            hintText: 'Full Name*'),
                                        SizedBox(
                                            height: elementPaddingVertical),
                                        Textfield(
                                          focusNode: emailfocusNode,
                                          errorText: _emailErrorText,
                                          hintText: 'Email*',
                                          textEditingController:
                                              _emailcontroller,
                                        ),
                                        SizedBox(
                                            height: elementPaddingVertical),

                                        NumberTextFieldWithCountry(
                                          focusNode: phonefocusNode,
                                          errorText: _phoneErrorText,
                                          selectedCountryCode:
                                              selectedCountryCode,
                                          selectedDialCode: selectedDialCode,
                                          phoneController: _phonecontroller,
                                          onCountryChanged: (String newDialCode,
                                              String newCountryCode) async {
                                            // await _saveCountryCodeToHive(
                                            //     newDialCode, newCountryCode);

                                            // await StoreNumberDetaisl(
                                            //   newCountryCode,
                                            //   newDialCode,
                                            // );

                                            setState(() {
                                              selectedDialCode = newDialCode;
                                              selectedCountryCode =
                                                  newCountryCode;
                                            });
                                          },
                                        ),

                                        SizedBox(
                                            height: elementPaddingVertical),
                                        //  Spacer(),

                                        PassWordTextfield(
                                          focusNode: passwordfocusNode,
                                          errorText: _passwordErrorText,
                                          hintText: 'Password*',
                                          textEditingController:
                                              _passwordController,
                                        ),
                                        SizedBox(
                                            height: elementPaddingVertical),
                                        PassWordTextfield(
                                          focusNode: confirmpassfocusNode,
                                          errorText: _confirmpasswordErrorText,
                                          hintText: 'Confirm Password*',
                                          textEditingController:
                                              _confirmpasswordcontroller,
                                        ),

                                        //SizedBox(height: perc375),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: adeebpadding),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isTermsAgreed = !isTermsAgreed;
                                            });
                                          },
                                          icon: MSHCheckbox(
                                            size: 20,
                                            value: isTermsAgreed,
                                            colorConfig: MSHColorConfig
                                                .fromCheckedUncheckedDisabled(
                                              checkedColor: Colors.red,
                                            ),
                                            style: MSHCheckboxStyle.stroke,
                                            onChanged: (selected) {
                                              setState(() {
                                                isTermsAgreed = selected;
                                              });
                                            },
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _launched = _launchInBrowser(
                                                  termsandService);
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'I agree to the  ',
                                                      style: TextStyles
                                                          .rubikregular14grey66w500,
                                                    ),
                                                    TextSpan(
                                                      text: 'Terms of Service',
                                                      style: TextStyles
                                                          .rubikregular14black3Bw500,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Padding(
                                  //   padding: EdgeInsets.symmetric(horizontal: adeebpadding),
                                  //   child: Row(
                                  //     children: [
                                  //       IconButton(
                                  //         onPressed: () {
                                  //           setState(() {
                                  //             isTermsAgreed = !isTermsAgreed;
                                  //           });
                                  //         },
                                  //         icon: MSHCheckbox(
                                  //           size: 20,
                                  //           value: isTermsAgreed,
                                  //           colorConfig:
                                  //               MSHColorConfig.fromCheckedUncheckedDisabled(
                                  //             checkedColor: Colors.red,
                                  //           ),
                                  //           style: MSHCheckboxStyle.stroke,
                                  //           onChanged: (selected) {
                                  //             setState(() {
                                  //               isTermsAgreed = selected;
                                  //             });
                                  //           },
                                  //         ),
                                  //       ),
                                  //       GestureDetector(
                                  //         onTap: () {
                                  //           setState(() {
                                  //             _launched = _launchInBrowser(termsandService);
                                  //           });
                                  //         },
                                  //         child: Positioned(
                                  //           left: 49,
                                  //           top: 15,
                                  //           child: Row(
                                  //             children: [
                                  //               RichText(
                                  //                 text: TextSpan(
                                  //                   children: [
                                  //                     TextSpan(
                                  //                       text: 'I agree to the  ',
                                  //                       style:
                                  //                           TextStyles.rubikregular14grey66w500,
                                  //                     ),
                                  //                     TextSpan(
                                  //                       text: 'Terms of Service',
                                  //                       style: TextStyles
                                  //                           .rubikregular14black3Bw500,
                                  //                     ),
                                  //                   ],
                                  //                 ),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),

                                  SizedBox(height: perc187),
                                  ColoredButton(
                                    isactive: isTermsAgreed,
                                    onPressed: _submitForm,
                                    text: 'Sign Up',
                                  ),
                                  SizedBox(height: perc187),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Have an account?  ",
                                        style:
                                            TextStyles.rubikregular16grey77w400,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "Sign In",
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
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
