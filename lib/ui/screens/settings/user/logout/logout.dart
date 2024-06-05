import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:Yes_Loyalty/ui/screens/home/sub_screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class Logout extends StatefulWidget {
  const Logout({
    super.key,
  });

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
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
          const SizedBox(height: 50),
          Center(child: const Text("Logout Account"))
        ],
      ),
    ));
  }
}
