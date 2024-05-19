import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Yes_Loyalty/core/model/failure/mainfailure.dart';
import 'package:Yes_Loyalty/core/model/offers_info/offers_info.dart';
import 'package:Yes_Loyalty/core/services/get_service/offers_service.dart';

part 'offer_info_event.dart';
part 'offer_info_state.dart';
part 'offer_info_bloc.freezed.dart';

// class OfferInfoBloc extends Bloc<OfferInfoEvent, OfferInfoState> {
//   OfferInfoBloc() : super(_Initial()) {
//     on<OfferInfoEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

class OfferInfoBloc extends Bloc<OfferInfoEvent, OfferInfoState> {
  OfferInfoBloc() : super(OfferInfoState.initial()) {
    on<_FetchOffersInfo>((event, emit) async {
      try {
        final response = await OffersService.fetchOfferInfo();
        emit(OfferInfoState(
          isLoading: false,
          isError: false,
          offersInfo: response,
          successorFailure: optionOf(right(response)),
        ));
        // ignore: avoid_print
      } catch (e) {
        emit(OfferInfoState(
          isLoading: false,
          isError: true,
          offersInfo: OffersInfo(),
          successorFailure:
              optionOf(left(MainFailure.clientFailure(message: e.toString()))),
        ));
      }
    });
  }
}

