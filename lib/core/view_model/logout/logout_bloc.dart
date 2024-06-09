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
      emit(state.copyWith(isLoading: true, isError: false, statusCode: 0));
      try {
        final response = await LogoutService.logout();
        emit(state.copyWith(isLoading: false, isError: false, statusCode: response));
      } catch (e) {
        print('Error: ${e.toString()}');
        emit(state.copyWith(isLoading: false, isError: true, statusCode: 0));
      }
    });

 
  }
}
