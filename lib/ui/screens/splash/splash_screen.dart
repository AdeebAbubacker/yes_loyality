import 'package:Yes_Loyalty/core/constants/common.dart';
import 'package:Yes_Loyalty/core/constants/const.dart';
import 'package:Yes_Loyalty/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = screenHeight(context);

    double spacing1 = screenheight * 320 / FigmaConstants.figmaDeviceHeight;
    double height44 = screenheight * 44 / FigmaConstants.figmaDeviceHeight;
    double height8 = screenheight * 8 / FigmaConstants.figmaDeviceHeight;
    checkAccessToken(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset('assets/yes_loyality_log.png'),
            SizedBox(height: spacing1),
            Text(
              "Version 1.0.2",
              style: TextStyles.rubikregular14black3B,
            ),
            SizedBox(height: height8),
            Text(
              "Copyright @ 2024 Yes Loyalty",
              style: TextStyles.rubikregular14grey66,
            ),
            SizedBox(height: height8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Developed by Cyber Fort Technologies",
                  style: TextStyles.rubikregular14grey66,
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              ],
            ),
            SizedBox(
              height: height44,
            ),
          ],
        ),
      ),
    );
  }

  void checkAccessToken(BuildContext context) async {
    final String? accessToken = await GetSharedPreferences.getAccessToken();
    if (accessToken != null) {
       Future.delayed(const Duration(seconds: 3), () {
         context.go('/home'); // Assuming '/home' is the route for the home screen
      });
     
    } else {
      // If no access token, navigate to sign-in screen after delay
      Future.delayed(const Duration(seconds: 3), () {
        context.go('/sign_in');
      });
    }
  }
}
