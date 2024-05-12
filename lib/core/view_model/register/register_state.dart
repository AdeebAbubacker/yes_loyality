part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState.initial() {
    return  RegisterState(
      isLoading: false,
      isError: false,
      register: null, // Set initial value to null for dynamic type
      successorFailure: None(),
    );
  }
  const factory RegisterState({
    required bool isLoading,
    required bool isError,
    required dynamic register, // Change type to dynamic
    required Option<Either<MainFailure, dynamic>> successorFailure, // Change type to dynamic
  }) = _RegisterState;
}
