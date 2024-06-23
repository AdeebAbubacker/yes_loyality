import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:Yes_Loyalty/core/model/store_details/store_details.dart';
import 'package:Yes_Loyalty/core/services/get_service/store_service.dart';

part 'store_details_event.dart';
part 'store_details_state.dart';
part 'store_details_bloc.freezed.dart';

class StoreDetailsBloc extends Bloc<StoreDetailsEvent, StoreDetailsState> {
  StoreDetailsBloc() : super(StoreDetailsState.initial()) {
    on<_FetchStoreDetails>((event, emit) async {
      try {
        final response =
            await StoreService.fetchStoreDetails(storeId: event.storeId);
        emit(StoreDetailsState(
          isLoading: false,
          isError: false,
          storeDetails: response,
          successorFailure: optionOf(right(response)),
        ));
        // ignore: avoid_print
      } catch (e) {
        emit(StoreDetailsState(
          isLoading: false,
          isError: true,
          storeDetails: StoreDetails(),
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
      }
    });
    on<_ClearStoreDetailsData>((event, emit) async {
      emit(StoreDetailsState(
          isLoading: false,
          isError: false,
          storeDetails: StoreDetails(),
          successorFailure: None()));
    });
  }
}
