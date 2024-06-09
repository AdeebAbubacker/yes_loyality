import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/view_model/change_password/change_password_bloc.dart';
import 'package:Yes_Loyalty/ui/animations/toast.dart';
import 'package:Yes_Loyalty/ui/screens/home/sub_screen/settings.dart';
import 'package:Yes_Loyalty/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'package:Yes_Loyalty/core/db/hive_db/adapters/country_code_adapter/country_code_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/country_code_box.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/view_model/register/register_bloc.dart';
import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:Yes_Loyalty/ui/widgets/name_textfield.dart';
import 'package:Yes_Loyalty/ui/widgets/number_textfield.dart';
import 'package:Yes_Loyalty/ui/widgets/password_textfield.dart';
import 'package:Yes_Loyalty/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ChangePassWord extends StatefulWidget {
  const ChangePassWord({super.key});

  @override
  State<ChangePassWord> createState() => _ChangePassWordState();
}

class _ChangePassWordState extends State<ChangePassWord> {
  bool showDots = false;
  final _currentpasswordController = TextEditingController();
  final _newpasswordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  var _currentpasswordErorText;
  var _newpasswordErorText;
  var _confirmpasswordErorText;
  final FocusNode currentpassFocusnode = FocusNode();
  final FocusNode newpassFocusnode = FocusNode();
  final FocusNode confirmpassFocusnode = FocusNode();
  bool _formSubmitted = false; // Add this boolean flag
  String? selectedDialCode = "";

  @override
  void initState() {
    super.initState();
    _currentpasswordController.addListener(_onCurrentPasswordChanged);
    _confirmpasswordController.addListener(_onNewPassWordChanged);
  }

  @override
  void dispose() {
    _currentpasswordController.removeListener(_onCurrentPasswordChanged);
    _confirmpasswordController.removeListener(_onNewPassWordChanged);
    super.dispose();
  }

  void _onCurrentPasswordChanged() {
    if (_formSubmitted) {
      // Only validate if the form has been submitted at least once
      _validateCurrentPassword(_currentpasswordController.text);
    }
  }

  void _onNewPassWordChanged() {
    if (_formSubmitted) {
      // Only validate if the form has been submitted at least once
      _validateConfirmPassword(
        confirmpassword: _confirmpasswordController.text.toString(),
        password: _newpasswordController.text.toString(),
      );
    }
  }

  void _validateCurrentPassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _currentpasswordErorText = 'Password is required';
      } else if (value.length < 8) {
        _currentpasswordErorText =
            'Password must be at least 8 characters long';
      } else {
        _currentpasswordErorText = null;
      }
    });
  }

  void _validateConfirmPassword({
    required String password,
    required String confirmpassword,
  }) {
    setState(() {
      if (confirmpassword.isEmpty) {
        _confirmpasswordErorText = 'Password is required';
      } else if (confirmpassword.length < 8) {
        _confirmpasswordErorText =
            'Password must be at least 8 characters long';
      } else if (password != confirmpassword) {
        _confirmpasswordErorText = 'Passwords do not match';
      } else {
        _confirmpasswordErorText = null;
      }
    });
  }

  void _submitForm() {
    setState(() {
      _formSubmitted =
          true; // Set form submitted to true when the button is clicked
      // Validate password field

      _validateCurrentPassword(_currentpasswordController.text);
      _validateConfirmPassword(
          password: _newpasswordController.text,
          confirmpassword: _confirmpasswordController.text);

      BlocProvider.of<ChangePasswordBloc>(context)
          .add(ChangePasswordEvent.changePassWord(
        confirmPassword: _confirmpasswordController.text,
        currentPassword: _currentpasswordController.text,
        newPassword: _newpasswordController.text,
      ));
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

    return GestureDetector(
      onTap: () {
        confirmpassFocusnode.unfocus();
        newpassFocusnode.unfocus();
        currentpassFocusnode.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
                  listener: (context, state) {
                    state.map(
                      initial: (_) {},
                      loading: (_) {},
                      success: (_) {
                        showCustomToast(
                          context, "Password Changed succefully",
                          MediaQuery.of(context).size.height *
                              0.7, // Adjust vertical position here
                        );
                        Future.delayed(const Duration(microseconds: 100),
                            () async {
                          context
                              .go('/sign_in'); // Pop back to the sign-in screen
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Password Chnanged Successfully')),
                        );
                      },
                      failure: (state) {
                        showCustomToast(
                          context, "Password Change Failed",
                          MediaQuery.of(context).size.height *
                              0.7, // Adjust vertical position here
                        );
                      },
                      validationError: (state) {
                        setState(() {
                          _currentpasswordErorText = state.currentPasswordError;
                          _newpasswordErorText = state.newPasswordError;
                          _confirmpasswordErorText = state.confirmPasswordError;
                        });

                        showCustomToast(
                          context, "Password Change Failed",
                          MediaQuery.of(context).size.height *
                              0.7, // Adjust vertical position here
                        );
                      },
                    );
                  },
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        HomeAppBar(
                          onBackTap: () async {
                            Navigator.of(context).pop();
                          },
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Set a new password",
                            style: TextStyles.rubik20black33w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: devicePadding),
                          child: Column(
                            children: [
                              Text(
                                'Create a new password. Ensure it differs from previous ones for security',
                                style: TextStyles.rubik16black77w400,
                              ),
                              const SizedBox(height: 20),
                              PassWordTextfield(
                                focusNode: currentpassFocusnode,
                                errorText: _currentpasswordErorText,
                                hintText: 'Current Password*',
                                textEditingController:
                                    _currentpasswordController,
                              ),
                              SizedBox(height: elementPaddingVertical),
                              PassWordTextfield(
                                focusNode: newpassFocusnode,
                                errorText: _newpasswordErorText,
                                hintText: 'New Password*',
                                textEditingController: _newpasswordController,
                              ),
                              SizedBox(height: elementPaddingVertical),
                              PassWordTextfield(
                                focusNode: confirmpassFocusnode,
                                errorText: _confirmpasswordErorText,
                                hintText: 'Confirm Password*',
                                textEditingController:
                                    _confirmpasswordController,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: perc187),
                        SizedBox(height: perc187),
                        SizedBox(height: perc20),
                      ],
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 90,
                left: 0,
                right: 0,
                child: Center(
                  child: ColoredButton(
                    onPressed: _submitForm,
                    text: 'Update Password',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
