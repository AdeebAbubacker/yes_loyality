// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffersList _$OffersListFromJson(Map<String, dynamic> json) => OffersList(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      misc: json['misc'] as List<dynamic>?,
      redirect: json['redirect'],
    );

Map<String, dynamic> _$OffersListToJson(OffersList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'misc': instance.misc,
      'redirect': instance.redirect,
    };
