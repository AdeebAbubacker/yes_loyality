part of 'profile_edit_bloc.dart';

@freezed

class ProfileEditState with _$ProfileEditState {
  factory ProfileEditState.initial() {
    return  ProfileEditState(
      isLoading: false,
      isError: false,
      register: null, // Set initial value to null for dynamic type
      successorFailure: None(),
    );
  }
  const factory ProfileEditState({
    required bool isLoading,
    required bool isError,
    required dynamic register, // Change type to dynamic
    required Option<Either<MainFailure, dynamic>> successorFailure, // Change type to dynamic
  }) = _ProfileEditState;
}
