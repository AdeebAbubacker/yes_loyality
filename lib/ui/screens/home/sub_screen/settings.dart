import 'package:Yes_Loyalty/core/routes/app_route_config.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        SettingsContent(
            description: 'User Settings',
            icon: SvgPicture.asset('assets/user_settings.svg'),
            onTap: () {
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
              navigateToPrivacyPolicy(context);
              //  context.push("/user_signup");
            }),
        //ccc
        SettingsContent(
          description: 'Terms and Conditions',
          icon: SvgPicture.asset('assets/terms&c.svg'),
          onTap: () {
            navigateToTermsandCond(context);
            //  context.push("/user_signup");
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
          padding: const EdgeInsets.only(top: 24, bottom: 24),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 5),
                child: icon,
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Text(description, style: TextStyles.rubik16black33w400),
              ),
              Text('v1.0.20', style: TextStyles.rubik16black33w400),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}
