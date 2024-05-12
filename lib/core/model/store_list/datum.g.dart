// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      locality: json['locality'] as String?,
      active: json['active'] as bool?,
      address: json['address'],
      coordinates: json['coordinates'],
      email1: json['email_1'],
      email2: json['email_2'],
      phone1: json['phone_1'],
      phone2: json['phone_2'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'locality': instance.locality,
      'active': instance.active,
      'address': instance.address,
      'coordinates': instance.coordinates,
      'email_1': instance.email1,
      'email_2': instance.email2,
      'phone_1': instance.phone1,
      'phone_2': instance.phone2,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };
