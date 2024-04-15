
import 'package:carrimen_app/ui/screens/auth/user_otp/layout_view.dart';
import 'package:carrimen_app/ui/screens/home/layout_view.dart';
import 'package:carrimen_app/ui/screens/misc/full_screen_alert/layout_view.dart';
import 'package:carrimen_app/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///----------------lock in portrait mode----------------------------------
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      title: 'Flutter Demo',
      home: const HomeScreen(),
    );
  }
}
