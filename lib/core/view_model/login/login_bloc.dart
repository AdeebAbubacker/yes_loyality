import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yes_loyality/core/model/login/login.dart';
import 'package:yes_loyality/core/services/api_services.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiService apiService;
  LoginBloc(this.apiService) : super(_Initial()) {
    on<_SignInWithEmailAndPassword>((event, emit) async {
      emit(LoginState.loading());
      try {
        final user = await ApiService.login( email: event.email, password: event.password);
           

        if (user != null) {
          emit(LoginState.authsuccess(user: user));

          // Store access token in SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('accessToken', user.misc.accessToken.toString());

          // Print the stored access token
          String accessToken =
              prefs.getString('accessToken') ?? 'Access Token empty';
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

