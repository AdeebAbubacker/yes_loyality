

part of 'register_bloc.dart';

@freezed
// class RegisterState with _$RegisterState {
//   factory RegisterState.initial() {
//     return RegisterState(
//       isLoading: false,
//       isError: false,
//       register: null, // Set initial value to null for dynamic type
//       successorFailure: None(),
//       emailError: null,
//       phoneError: null,
//       passwordError: null,
//       confirmPasswordError: null,
//     );
//   }
//   const factory RegisterState({
//     required bool isLoading,
//     required bool isError,
//     required dynamic register, // Change type to dynamic
//     required Option<Either<MainFailure, dynamic>>
//         successorFailure, // Change type to dynamic

//     dynamic nameError,
//     dynamic emailError,
//    dynamic phoneError,
//    dynamic passwordError,
//    dynamic confirmPasswordError,
//   }) = _RegisterState;
// }


class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.success(dynamic response) = _Success;
  const factory RegisterState.failure(String error) = _Failure;
  const factory RegisterState.validationError({
    dynamic nameError,
    dynamic emailError,
     dynamic phoneError,
   dynamic passwordError,
   dynamic passwordConfirmError,
  }) = _ValidationError;
}