import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:Yes_Loyalty/core/model/user_details/user_details.dart';
import 'package:Yes_Loyalty/core/services/get_service/user_details_service.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';
part 'user_details_bloc.freezed.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc() : super(UserDetailsState.initial()) {
    on<_FetchUserDetails>((event, emit) async {
      try {
        final response = await FetchUserService.fetchUserData();
        emit(UserDetailsState(
          isLoading: false,
          isError: false,
          userDetails: response,
          successorFailure: optionOf(right(response)),
        ));
        print('This is the homescreen response ${response.toString()}');
        // ignore: avoid_print
      } catch (e) {
        print('This is the homescreen response $e');
        emit(UserDetailsState(
          isLoading: false,
          isError: true,
          userDetails: UserDetails(),
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
      }
    });
  }
}
