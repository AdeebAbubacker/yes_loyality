part of 'store_details_bloc.dart';

@freezed
class StoreDetailsEvent with _$StoreDetailsEvent {
  const factory StoreDetailsEvent.started() = _Started;
   const factory StoreDetailsEvent.fetchStoreDetails() = _FetchStoreDetails;
}