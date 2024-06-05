import 'package:Yes_Loyalty/core/model/login_validation/login_validation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Yes_Loyalty/core/db/shared/shared_prefernce.dart';
import 'package:Yes_Loyalty/core/model/login/login.dart';
import 'package:Yes_Loyalty/core/services/auth_service/login_services.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {

//   LoginBloc() : super(const _Initial()) {
//     on<_SignInWithEmailAndPassword>((event, emit) async {
//       emit(const LoginState.loading());
//       try {
//         final user = await LoginService.login( email: event.email, password: event.password);

//         emit(LoginState.authsuccess(user: user));

//      var accessToken = await SetSharedPreferences.storeAccessToken(user.misc.accessToken) ?? 'Access Token empty';

//         print('Stored Access Token: $accessToken');
//             } catch (e) {
//         emit(LoginState.authError(message: 'An error occurred: $e'));
//       }
//     });
//   }
// }

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc() : super(const _Initial()) {
//     on<_SignInWithEmailAndPassword>((event, emit) async {
//       emit(const LoginState.loading());

//       try {
//         final result = await LoginService.login(
//             email: event.email, password: event.password);
       
//         await result.fold((failure) async {
//           if (failure is LoginValidation) {
//             print(
//               result.fold(
//                 (l) => {
//                   print('from emit ${l.data?.email.toString()}'),
//                     print('from emit ${l.data?.password.toString()}'),
//                   emit(LoginState.validationError(
//                     // emailError: failure.data?.email?.join(', '),
//                     // passwordError: failure.data?.email?.join(', '),
//                     emailError: l.data?.email.toString(),
//                     passwordError: l.data?.password.toString(),
//                   ))
//                 },
//                 (r) => {
//                   print(r.message),
//                 },
//               ),
//             );
//           } else {
//             emit(LoginState.authError(message: failure.data.toString()));
//           }
//         }, (success) async {
//           var accessToken = await SetSharedPreferences.storeAccessToken(
//                   success.misc.accessToken) ??
//               'Access Token empty';
//           emit(LoginState.authsuccess(user: success));
//         });
//       } catch (e) {
//         emit(LoginState.authError(message: 'An error occurred: $e'));
//       }
//     });
//   }
// }


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<_SignInWithEmailAndPassword>((event, emit) async {
      emit(const LoginState.loading());

      try {
        final result = await LoginService.login(
            email: event.email, password: event.password);

        await result.fold((failure) async {
          if (failure is LoginValidation) {
            print('from bloc ${failure.data?.email?.join(', ')}');
             print('from bloc ${failure.data?.password?.join(', ')}');
            // emit(LoginState.validationError(
            //   Error: failure.data?.email?.join(', '),
            // //  passwordError: failure.data?.password?.join(', '),
            // ));
            final emailError = failure.data?.email?.join(', ');
            final passwordError = failure.data?.password?.join(', ');
            final error = emailError ?? passwordError; // Prioritize email error

            emit(LoginState.validationError(Error: error));
          } else {
            emit(LoginState.authError(message: failure.data.toString()));
          }
        }, (success) async {
          var accessToken = await SetSharedPreferences.storeAccessToken(
                  success.misc.accessToken) ??
              'Access Token empty';
          emit(LoginState.authsuccess(user: success));
        });
      } catch (e) {
        emit(LoginState.authError(message: 'An error occurred: $e'));
      }
    });
  }
}
