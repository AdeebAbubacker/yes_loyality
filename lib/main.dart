import 'package:Yes_Loyalty/core/db/hive_db/adapters/country_code_adapter/country_code_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/country_code_box.dart';
import 'package:Yes_Loyalty/core/view_model/change_password/change_password_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/delete_account/delete_account_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/get_support/get_support_bloc.dart';
import 'package:Yes_Loyalty/firebase_options.dart';
import 'package:Yes_Loyalty/testing/call_mapi.dart';
import 'package:Yes_Loyalty/ui/screens/auth/user_signin/layout_view.dart';
import 'package:Yes_Loyalty/ui/screens/auth/user_signup/layout_view.dart';
import 'package:Yes_Loyalty/ui/screens/home/layout_view.dart';
import 'package:Yes_Loyalty/ui/screens/misc/profile_edit/layout_view.dart';
import 'package:Yes_Loyalty/ui/screens/settings/support/support_screen.dart';
import 'package:Yes_Loyalty/ui/screens/settings/user/change_password/change_password.dart';
import 'package:Yes_Loyalty/ui/screens/settings/user/delete_account/delete_account.dart';
import 'package:Yes_Loyalty/ui/screens/settings/user/user_settings.dart';

import 'package:Yes_Loyalty/ui/screens/splash/splash_screen.dart';
import 'package:Yes_Loyalty/ui/widgets/number_textfield_cache.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/branch_list_adater/branch_list_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/selected_branch_adater/selected_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/branch_list_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/selected_branch_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
import 'package:Yes_Loyalty/core/routes/app_route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/login/login_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/offer_info/offer_info_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/offers_list/offers_list_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/profile_edit/profile_edit_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/register/register_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/logout/logout_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/store_details/store_details_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/store_list/store_list_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/transaction_details/transaction_details_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/user_details/user_details_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///-------------Initialize Hive----------------------------
  await Hive.initFlutter();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ///-------------Register Adapter----------------------------

  Hive.registerAdapter(SelectedBranchDBAdapter());
  Hive.registerAdapter(BranchListDBAdapter());
  Hive.registerAdapter(UserDetailsDBAdapter());
  Hive.registerAdapter(CountryCodeDBAdapter());
  selectedBranchBox = await Hive.openBox<SelectedBranchDB>('selectedBranchBox');
  countryCodeBox = await Hive.openBox<CountryCodeDB>('countryCodeBox');
  BranchListBox = await Hive.openBox<BranchListDB>('BranchListBox');
  UserDetailsBox = await Hive.openBox<UserDetailsDB>('UserDetailsBox');

  ///----------------lock in portrait mode----------------------------------
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
    // DevicePreview(
    //   // enabled: !kReleaseMode,
    //   enabled: true,
    //   builder: (context) => const MyApp(), // Wrap your app

    // );
  });
}
//0000000000000000
//-----------

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginBloc(),
          ),
          BlocProvider(
            create: (context) => RegisterBloc(),
          ),
          BlocProvider(
            create: (context) => LogoutBloc(),
          ),
          BlocProvider(
            create: (context) => UserDetailsBloc(),
          ),
          BlocProvider(
            create: (context) => OffersListBloc(),
          ),
          BlocProvider(
            create: (context) => OfferInfoBloc(),
          ),
          BlocProvider(
            create: (context) => StoreDetailsBloc(),
          ),
          BlocProvider(
            create: (context) => StoreListBloc(),
          ),
          BlocProvider(
            create: (context) => TransactionDetailsBloc(),
          ),
          BlocProvider(
            create: (context) => ProfileEditBloc(),
          ),
          BlocProvider(
            create: (context) => ChangePasswordBloc(),
          ),
          BlocProvider(
            create: (context) => GetSupportBloc(),
          ),
          BlocProvider(
            create: (context) => DeleteAccountBloc(),
          ),
        ],
        child:

            // MaterialApp(
            //   // useInheritedMediaQuery: true,
            //   // locale: DevicePreview.locale(context),
            //   // builder: DevicePreview.appBuilder,

            //   // routerConfig: MyappRoutes.routes,
            //    home: SplashScreen(),

            // ),
            MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: false),
          initialRoute: '/', // Set the initial route (Screen1)
          routes: {
             '/': (context) => SplashScreen(),
            '/sigin': (context) => SignInScreen(),
            '/signup': (context) => SignupScreen(),
            '/profileEdit': (context) => ProfileEdit(),
            '/userSettings': (context) => UserSettings(),
            '/getSupport': (context) => GetSupportScreen(),
            '/changepassword': (context) => ChangePassWord(),
            '/deleteAccount': (context) => DeleteAccount(),
            '/home': (context) => HomeScreen(), // Define the home route
          },
        ));
  }
}
