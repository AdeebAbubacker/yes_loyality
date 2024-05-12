import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yes_loyality/core/db/shared/shared_prefernce.dart';
import 'package:yes_loyality/core/model/login/login.dart';
import 'package:yes_loyality/core/services/auth_service/login_services.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(_Initial()) {
    on<_SignInWithEmailAndPassword>((event, emit) async {
      emit(LoginState.loading());
      try {
        final user = await LoginService.login( email: event.email, password: event.password);
           

        if (user != null) {
          emit(LoginState.authsuccess(user: user));

       var accessToken = await SetSharedPreferences.storeAccessToken(user.misc.accessToken) ?? 'Access Token empty';
   
          print('Stored Access Token: $accessToken');
        } else {
          emit(const LoginState.authError(message: 'Login failed'));
        }
      } catch (e) {
        emit(LoginState.authError(message: 'An error occurred: $e'));
      }
    });
  }
}

