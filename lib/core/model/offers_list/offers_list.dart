import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'offers_list.g.dart';

@JsonSerializable()
class OffersList {
	int? status;
	String? message;
	List<Datum>? data;
	List<dynamic>? misc;
	dynamic redirect;

	OffersList({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.redirect, 
	});

	factory OffersList.fromJson(Map<String, dynamic> json) {
		return _$OffersListFromJson(json);
	}

	Map<String, dynamic> toJson() => _$OffersListToJson(this);
}
