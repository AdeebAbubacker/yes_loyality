part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState.initial() {
    return  RegisterState(
      isLoading: false,
      isError: false,
      register: Register(),
      successorFailure: None(),
    );
  }
  const factory RegisterState({
    required bool isLoading,
    required bool isError,
    required Register register,
    required Option<Either<MainFailure, Register>> successorFailure,
  }) = _RegisterState;
}
