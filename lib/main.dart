import 'package:hive_flutter/hive_flutter.dart';
import 'package:yes_loyality/core/db/hive_db/adapters/selected_branch_adater.dart/selected_adapter.dart';
import 'package:yes_loyality/core/db/hive_db/boxes/selected_branch_box.dart';
import 'package:yes_loyality/core/routes/app_route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes_loyality/core/view_model/login/login_bloc.dart';
import 'package:yes_loyality/core/view_model/offer_info/offer_info_bloc.dart';
import 'package:yes_loyality/core/view_model/offers_list/offers_list_bloc.dart';
import 'package:yes_loyality/core/view_model/profile_edit/profile_edit_bloc.dart';
import 'package:yes_loyality/core/view_model/register/register_bloc.dart';
import 'package:yes_loyality/core/view_model/logout/logout_bloc.dart';
import 'package:yes_loyality/core/view_model/store_details/store_details_bloc.dart';
import 'package:yes_loyality/core/view_model/store_list/store_list_bloc.dart';
import 'package:yes_loyality/core/view_model/transaction_details/transaction_details_bloc.dart';
import 'package:yes_loyality/core/view_model/user_details/user_details_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///-------------Initialize Hive----------------------------
  await Hive.initFlutter();

  ///-------------Register Adapter----------------------------

  Hive.registerAdapter(SelectedBranchDBAdapter());
  selectedBranchBox = await Hive.openBox<SelectedBranchDB>('selectedBranchBox');

  ///----------------lock in portrait mode----------------------------------
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}



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
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        routerConfig: MyappRoutes.routes,
      ),
    );
  }
}
