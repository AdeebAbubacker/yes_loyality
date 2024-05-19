import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/model/login/login.dart';
import 'package:Yes_Loyalty/core/services/auth_service/login_services.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(const _Initial()) {
    on<_SignInWithEmailAndPassword>((event, emit) async {
      emit(const LoginState.loading());
      try {
        final user = await LoginService.login( email: event.email, password: event.password);
           

        emit(LoginState.authsuccess(user: user));

     var accessToken = await SetSharedPreferences.storeAccessToken(user.misc.accessToken) ?? 'Access Token empty';
 
        print('Stored Access Token: $accessToken');
            } catch (e) {
        emit(LoginState.authError(message: 'An error occurred: $e'));
      }
    });
  }
}

