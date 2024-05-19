import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:Yes_Loyalty/core/services/auth_service/logout_service.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutState.initial()) {
    on<_Logout>((event, emit) async {
      try {
        final response = await LogoutService.logout();
        emit(LogoutState(
          isLoading: false,
          isError: false,
          register: response,
          successorFailure: optionOf(right(response)),
        ));
      } catch (e) {
        if (e is Map<String, dynamic> && e.containsKey('data')) {
          emit(LogoutState(
            isLoading: false,
            isError: true,
            register: null,
            successorFailure: optionOf(
              left(const MainFailure.clientFailure(message: "Something Went wrong")),
            ),
          ));
        } else {
          emit(LogoutState(
            isLoading: false,
            isError: true,
            register: null,
            successorFailure: optionOf(
              left(MainFailure.clientFailure(message: e.toString())),
            ),
          ));
        }
      }
    });
  }
}
