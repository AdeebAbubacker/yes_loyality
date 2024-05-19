import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:Yes_Loyalty/core/services/post_service/profile_edit_service.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';
part 'profile_edit_bloc.freezed.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  ProfileEditBloc() : super(ProfileEditState.initial()) {
    on<_ProfileEdit>((event, emit) async {
      try {
        final response = await ProfileEditService.editProfile(
            name: event.name,
            email: event.email,
            phone: event.phone,
            image: event.image);
        emit(ProfileEditState(
          isLoading: false,
          isError: false,
          register: response,
          successorFailure: optionOf(right(response)),
        ));
        
        // ignore: avoid_print
      } catch (e) {
        emit(ProfileEditState(
          isLoading: false,
          isError: true,
          register: const None(),
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
      
      }
    });
  }
}
