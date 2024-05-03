import 'package:yes_loyality/core/routes/app_route_config.dart';
import 'package:yes_loyality/core/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes_loyality/core/view_model/login/login_bloc.dart';
import 'package:yes_loyality/core/view_model/register/register_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///----------------lock in portrait mode----------------------------------
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(useMaterial3: false),
//       title: 'Flutter Demo',
//       home:  HomeScreen(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(ApiService()),
        ),
         BlocProvider(
          create: (context) => RegisterBloc(ApiService()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        routerConfig: MyappRoutes.routes,
      ),
    );
  }
}
