// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      customerId: (json['customer_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      roleId: (json['role_id'] as num?)?.toInt(),
      branch: json['branch'],
      walletTotal: (json['wallet_total'] as num?)?.toInt(),
      walletUsed: (json['wallet_used'] as num?)?.toInt(),
      walletBalance: (json['wallet_balance'] as num?)?.toInt(),
      emailVerifiedAt: json['email_verified_at'],
      mode: json['mode'],
      active: (json['active'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
      countryAlphaCode: json['country_alpha_code'] as String?,
      countryCode: json['country_code'] as String?,
      phoneNumber: json['phone_number'] as String?,
      imgUrl: json['img_url'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'role_id': instance.roleId,
      'branch': instance.branch,
      'wallet_total': instance.walletTotal,
      'wallet_used': instance.walletUsed,
      'wallet_balance': instance.walletBalance,
      'email_verified_at': instance.emailVerifiedAt,
      'mode': instance.mode,
      'active': instance.active,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'country_alpha_code': instance.countryAlphaCode,
      'country_code': instance.countryCode,
      'phone_number': instance.phoneNumber,
      'img_url': instance.imgUrl,
    };
