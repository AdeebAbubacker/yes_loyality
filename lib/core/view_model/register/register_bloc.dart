import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yes_loyality/core/model/failure/mainfailure.dart';
import 'package:yes_loyality/core/model/register/register.dart';
import 'package:yes_loyality/core/services/api_services.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final ApiService apiService;
  RegisterBloc(this.apiService) : super(RegisterState.initial()) {
    on<_Register>((event, emit) async {
      try {
        final response = await ApiService.register(
          name: event.name,
          email: event.email,
          phone: event.phone,
          password: event.password,
          password_confirm: event.confirmpassword,
        );
        emit(RegisterState(
          isLoading: false,
          isError: false,
          register: response,
          successorFailure: optionOf(right(response)),
        ));
      } catch (e) {
        emit(RegisterState(
          isLoading: false,
          isError: true,
          register: Register(),
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
      }
    });
  }
}
