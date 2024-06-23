import 'package:Yes_Loyalty/core/routes/app_route_config.dart';
import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        const SizedBox(height: 10),
        SettingsContent(
            description: 'User Settings',
            icon: SvgPicture.asset('assets/user_settings.svg'),
            onTap: () {
              print("sss");

              navigateToUserSettings(context);
            }),
        SettingsContent(
            description: 'Get Support',
            icon: SvgPicture.asset('assets/support_settings.svg'),
            onTap: () {
              navigateToGetSupport(context);
              //  context.push("/user_signup");
            }),
        SettingsContent(
            description: 'Privacy Policy',
            icon: SvgPicture.asset('assets/privacy_settings.svg'),
            onTap: () {
              setState(() {
                _launched = _launchInBrowser(privacyLink);
              });
              print("sss");
              // context.push("/user_signup");
            }),
        //ccc
        SettingsContent(
          description: 'Terms and Conditions',
          icon: SvgPicture.asset('assets/terms&c.svg'),
          onTap: () {
            setState(() {
              _launched = _launchInBrowser(termsandService);
            });
          },
        ),
        ApppVersionContent(
          description: 'App Version',
          icon: SvgPicture.asset('assets/app_version_settings.svg'),
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
                    icon,
                    SizedBox(width: 30),
                    Text(description, style: TextStyles.rubik16black33w400),
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

class ApppVersionContent extends StatelessWidget {
  final icon;
  final description;
  final VoidCallback onTap;
  const ApppVersionContent({
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
                child: icon,
              ),
              SizedBox(width: 30),
              Expanded(
                child: Text(description, style: TextStyles.rubik16black33w400),
              ),
              Text('V.1.0.1', style: TextStyles.rubik16black33w400),
              SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}
