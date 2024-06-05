import 'dart:math';

import 'package:Yes_Loyalty/ui/animations/offer_shimmer.dart';
import 'package:Yes_Loyalty/ui/screens/settings/user/user_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/core/view_model/offers_list/offers_list_bloc.dart';
import 'package:Yes_Loyalty/ui/widgets/buttons.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<void>? _launched;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    final Uri privacyLink = Uri(
      scheme: 'https',
      host: 'yl.tekpeak.in',
      path: '/privacy-policy',
    );

    final Uri termsandService = Uri(
      scheme: 'https',
      host: 'yl.tekpeak.in',
      path: '/term-conditions',
    );

    EdgeInsets outerpadding = OuterPaddingConstant(context);
    double screenheight = screenHeight(context);
    // double screenwidth = screenWidth(context);
    double height23 = screenheight * 23 / FigmaConstants.figmaDeviceHeight;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            "Settings",
            style: TextStyles.ibm20black77w700,
          ),
        ),
        const SizedBox(height: 10),
        SettingsContent(
            description: 'User Settings',
            icon: Icons.settings,
            onTap: () {
              print("sss");
              context.push("/user_settings");
           
            }),
        SettingsContent(
            description: 'Get Support',
            icon: Icons.support,
            onTap: () {
              print("sss");
              //  context.push("/user_signup");
            }),
        SettingsContent(
            description: 'Privacy Policy',
            icon: Icons.privacy_tip,
            onTap: () {
              setState(() {
                _launched = _launchInBrowser(privacyLink);
              });
              print("sss");
              // context.push("/user_signup");
            }),
        //ccc
        SettingsContent(
          description: 'Terms and conditions',
          icon: Icons.app_blocking,
          onTap: () {
            setState(() {
              _launched = _launchInBrowser(termsandService);
            });
          },
        ),
        SettingsContent(
          description: 'App Version',
          icon: Icons.app_blocking,
          onTap: () {
           //  context.push("/testing");
          },
        ),
      ],
    );
  }
}

class SettingsContent extends StatelessWidget {
  final icon;
  final description;
  final VoidCallback onTap;
  const SettingsContent({
    super.key,
    this.icon,
    this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(top: 24, bottom: 24),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30, right: 5),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: const Color.fromARGB(168, 244, 67, 54),
                      size: 30,
                    ),
                    SizedBox(width: 30),
                    Text(description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
