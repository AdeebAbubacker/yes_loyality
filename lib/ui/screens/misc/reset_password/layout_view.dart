import 'dart:async';

import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:Yes_Loyalty/ui/widgets/password_textfield.dart';
import 'package:Yes_Loyalty/ui/widgets/textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/branch_list_adater/branch_list_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/selected_branch_adater/selected_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/branch_list_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/selected_branch_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';

import 'package:Yes_Loyalty/core/view_model/store_details/store_details_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/store_list/store_list_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/transaction_details/transaction_details_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/user_details/user_details_bloc.dart';
import 'package:Yes_Loyalty/ui/screens/home/sub_screen/history.dart';
import 'package:Yes_Loyalty/ui/screens/home/sub_screen/profile.dart';
import 'package:Yes_Loyalty/ui/screens/home/sub_screen/offers.dart';
import 'package:Yes_Loyalty/ui/screens/home/widgets/location_details.dart';
import 'package:Yes_Loyalty/ui/widgets/appbar.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var a = '22';

  @override
  void initState() {
    context
        .read<UserDetailsBloc>()
        .add(const UserDetailsEvent.fetchUserDetails());
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      a = GetSharedPreferences.getAccessToken.toString();

      
      context
          .read<StoreDetailsBloc>()
          .add(StoreDetailsEvent.fetchStoreDetails(storeId: '1'));
      context
          .read<UserDetailsBloc>()
          .add(const UserDetailsEvent.fetchUserDetails());
    });
  }

  Map bankData = {};
  var bank;

  @override
  Widget build(BuildContext context) {
    context
        .read<UserDetailsBloc>()
        .add(const UserDetailsEvent.fetchUserDetails());
    double screenheight = screenHeight(context);
    double height23 = screenheight * 23 / FigmaConstants.figmaDeviceHeight;

    // Fetch user details when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context
          .read<UserDetailsBloc>()
          .add(const UserDetailsEvent.fetchUserDetails());
      context.read<StoreListBloc>().add(const StoreListEvent.fetchStoreList());
    });

    double screenwidth = screenWidth(context);
    final spacebtwotp = screenwidth * 10 / FigmaConstants.figmaDeviceWidth;

    final otpwidth = screenwidth * 74 / FigmaConstants.figmaDeviceWidth;
    final otpheight = screenheight * 57 / FigmaConstants.figmaDeviceHeight;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height23),
            const HomeAppBar(
              isthereQr: false,
            ),
            SizedBox(height: height23),
            SizedBox(height: 20),
            Padding(
              padding: OuterPaddingConstant(context),
              child: ResetPasswordWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);
    double screenwidth = screenWidth(context);
    final spacebtwotp = screenwidth * 10 / FigmaConstants.figmaDeviceWidth;

    final otpwidth = screenwidth * 74 / FigmaConstants.figmaDeviceWidth;
    final otpheight = screenheight * 57 / FigmaConstants.figmaDeviceHeight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Forgot password",
          style: TextStyles.rubik20black33w600,
        ),
        SizedBox(height: 22),
        RichText(
          textAlign: TextAlign.left,
          softWrap: true,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Please enter your email to reset the password',
                style: TextStyles.rubik16black77w400, // Bold style
              ),
            ],
          ),

          // TextSpan(
          //   text:
          //       "",
          //   style: TextStyles.rubik16black77w400,
          // ),
        ),
        SizedBox(height: 18),
        Text(
          "Your Email",
          style: TextStyles.rubik16black33w600,
        ),
        SizedBox(height: 13),
        Textfield(hintText: "Enter your mail"),
        SizedBox(height: 22),
        SizedBox(height: 26),
        ColoredButton(text: "Reset Password", onPressed: () {}),
      ],
    );
  }
}
