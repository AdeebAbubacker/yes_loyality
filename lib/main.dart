import 'package:Yes_Loyalty/core/db/hive_db/adapters/country_code_adapter/country_code_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/notification_adater/notification_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/country_code_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/notification_box.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/view_model/change_password/change_password_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/change_store/change_store_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/delete_account/delete_account_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/forgot_password/forgot_password_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/get_support/get_support_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/qr_scanning/qr_scanning_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/reset_password/reset_password_bloc.dart';
import 'package:Yes_Loyalty/core/view_model/verify_otp/verify_otp_bloc.dart';
import 'package:Yes_Loyalty/ui/screens/auth/acc_created_success/layout_view.dart';
import 'package:Yes_Loyalty/ui/screens/auth/user_signin/layout_view.dart';
import 'package:Yes_Loyalty/ui/screens/auth/user_signup/layout_view.dart';
import 'package:Yes_Loyalty/ui/screens/home/layout_view.dart';
import 'package:Yes_Loyalty/ui/screens/misc/password-reset/reset-password.dart';
import 'package:Yes_Loyalty/ui/screens/misc/password-reset/password-forgot.dart';
import 'package:Yes_Loyalty/ui/screens/misc/password-reset/verify-otp.dart';
import 'package:Yes_Loyalty/ui/screens/misc/profile_edit/layout_view.dart';
import 'package:Yes_Loyalty/ui/screens/settings/privacy/privacy_screen.dart';
import 'package:Yes_Loyalty/ui/screens/settings/support/support_screen.dart';
import 'package:Yes_Loyalty/ui/screens/settings/terms_and_condition/terms_and_condition.dart';
import 'package:Yes_Loyalty/ui/screens/settings/user/change_password/change_password.dart';
import 'package:Yes_Loyalty/ui/screens/settings/user/delete_account/delete_account.dart';
import 'package:Yes_Loyalty/ui/screens/settings/user/user_settings.dart';
import 'package:Yes_Loyalty/ui/screens/splash/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/branch_list_adater/branch_list_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/selected_branch_adater/selected_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/branch_list_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/selected_branch_box.dart';
import 'package:Yes_Loyalty/core/db/hive_db/boxes/user_details_box.dart';
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
  await SetSharedPreferences.checkAndClearFirstRunData();

  ///-------------Initialize Hive--------------------------------------------
  await Hive.initFlutter();

  ///-------------Register Adapter----------------------------------
  Hive.registerAdapter(SelectedBranchDBAdapter());
  Hive.registerAdapter(BranchListDBAdapter());
  Hive.registerAdapter(UserDetailsDBAdapter());
  Hive.registerAdapter(CountryCodeDBAdapter());
  Hive.registerAdapter(NotificationDBAdapter());
  selectedBranchBox = await Hive.openBox<SelectedBranchDB>('selectedBranchBox');
  countryCodeBox = await Hive.openBox<CountryCodeDB>('countryCodeBox');
  BranchListBox = await Hive.openBox<BranchListDB>('BranchListBox');
  UserDetailsBox = await Hive.openBox<UserDetailsDB>('UserDetailsBox');
  NotificationBox = await Hive.openBox<NotificationDB>('NotificationBox');

  ///----------------lock in portrait mode-----------------------------------
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    //  runApp(const MyApp());

    runApp(MyApp());
  });
}

///---------------------------------------------------------------------------

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
        BlocProvider(
          create: (context) => ForgotPasswordBloc(),
        ),
        BlocProvider(
          create: (context) => VerifyOtpBloc(),
        ),
        BlocProvider(
          create: (context) => ResetPasswordBloc(),
        ),
        BlocProvider(
          create: (context) => QrScanningBloc(),
        ),
        BlocProvider(
          create: (context) => ChangeStoreBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/sigin': (context) => const SignInScreen(),
          '/accCreatedSuccess': (context) =>
              const AccountCreatedSuccessScreen(),
          '/signup': (context) => SignupScreen(),
          '/profileEdit': (context) => const ProfileEdit(),
          '/changepassword': (context) => const ChangePassWord(),
          '/forgotpassword': (context) => const ForgotPassWord(),
          '/verfyOtp': (context) => const VerifyOtpScreen(),
          '/userSettings': (context) => const UserSettings(),
          '/getSupport': (context) => const GetSupportScreen(),
          '/resetpassword': (context) => const ResetPasswordChangeScreen(),
          '/deleteAccount': (context) => const DeleteAccount(),
          '/home': (context) => const HomeScreen(),
          '/privacy': (context) => const PrivacyScreen(),
          '/termsAndCondition': (context) => const TermsAndConditionScreen(),
        },
      ),
    );
  }
}
