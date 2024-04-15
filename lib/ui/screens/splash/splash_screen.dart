import 'package:carrimen_app/ui/screens/auth/user_login/layout_view.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async{
     await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return const SignupScreen();
        }),
      );
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/yes_loyality_log.png'),
          ],
        ),
      ),
    );
  }
}
