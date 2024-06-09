import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/country_code_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/selected_branch_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/routes/app_route_config.dart';
import 'package:Yes_Loyalty/core/view_model/logout/logout_bloc.dart';
import 'package:Yes_Loyalty/ui/animations/toast.dart';

import 'package:Yes_Loyalty/ui/screens/auth/user_signin/layout_view.dart';
import 'package:Yes_Loyalty/ui/screens/home/sub_screen/settings.dart';
import 'package:Yes_Loyalty/ui/screens/settings/user/change_password/change_password.dart';
import 'package:Yes_Loyalty/ui/screens/settings/user/delete_account/delete_account.dart';
import 'package:Yes_Loyalty/ui/screens/settings/user/logout/logout.dart';
import 'package:Yes_Loyalty/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      child:
      
       BlocListener<LogoutBloc, LogoutState>(
        listener: (context, state) async {
          if (state.isError) {
            showCustomToast(context, 'Failed to logout',
                MediaQuery.of(context).size.height * 0.7);
          } else if (!state.isLoading && state.statusCode != 0) {
            await GetSharedPreferences.deleteAccessToken();
            await selectedBranchBox.clear();
            await UserDetailsBox.clear();
            await countryCodeBox.clear();
           if (context.mounted) {
              return  navigateTosiginCleared(context);
              }
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            HomeAppBar(
              onBackTap: () async {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 10),
            SettingsContent(
                description: 'Change Password',
                icon: SvgPicture.asset('assets/change_p_settings.svg'),
                onTap: () {
                  print("sss");

                  navigateToChangePassword(context);
                }),
            SettingsContent(
                description: 'Delete Account',
                icon: SvgPicture.asset('assets/delete_settings.svg'),
                onTap: () {
                  print("sss");

                  navigateTodeleteAcc(context);
                }),
            SettingsContent(
              description: 'Logout',
              icon: SvgPicture.asset('assets/logout_settings.svg'),
              onTap: () {
                showExitPopup(context);
              },
            ),
          ],
        ),
      ),
    ));
  }

  Future showExitPopup(context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Do you want to exit?"),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            context
                                .read<LogoutBloc>()
                                .add(const LogoutEvent.logout());
                          } catch (e) {
                            // Handle any errors that occur during the asynchronous operations
                            print('Error during logout: $e');
                            showCustomToast(
                                context,
                                'Failed to log out. Please try again.',
                                MediaQuery.of(context).size.height * 0.7);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade800),
                        child: const Text("Yes"),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        // ignore: avoid_print
                        print('no selected');
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text("No",
                          style: TextStyle(color: Colors.black)),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
