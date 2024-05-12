part of 'logout_bloc.dart';

@freezed


class LogoutState with _$LogoutState {
  factory LogoutState.initial() {
    return  LogoutState(
      isLoading: false,
      isError: false,
      register: null, // Set initial value to null for dynamic type
      successorFailure: None(),
    );
  }
  const factory LogoutState({
    required bool isLoading,
    required bool isError,
    required dynamic register, // Change type to dynamic
    required Option<Either<MainFailure, dynamic>> successorFailure, // Change type to dynamic
  }) = _LogoutState;
}
