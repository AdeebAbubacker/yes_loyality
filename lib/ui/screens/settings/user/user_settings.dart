import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/ui/screens/auth/user_signin/layout_view.dart';
import 'package:Yes_Loyalty/ui/screens/home/sub_screen/settings.dart';
import 'package:Yes_Loyalty/ui/screens/settings/user/change_password/change_password.dart';
import 'package:Yes_Loyalty/ui/screens/settings/user/delete_account/delete_account.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({
    super.key,
  });

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets outerpadding = OuterPaddingConstant(context);
    double screenheight = screenHeight(context);
    // double screenwidth = screenWidth(context);
    double height23 = screenheight * 23 / FigmaConstants.figmaDeviceHeight;

    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              "User Settings",
              style: TextStyles.ibm20black77w700,
            ),
          ),
          const SizedBox(height: 10),
          SettingsContent(
              description: 'Change Password',
              icon: Icons.lock,
              onTap: () {
                print("sss");
                
                 context.push("/change_password");
               
              }),
          SettingsContent(
              description: 'Delete Account',
              icon: Icons.person_remove,
              onTap: () {
                print("sss");
                 context.push("/delete_account");
               
              }),
          SettingsContent(
            description: 'Logout',
            icon: Icons.logout,
            onTap: () {
               context.push("/logout");

             
            },
          ),
        ],
      ),
    ));
  }
}
