// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      storeId: (json['store_id'] as num?)?.toInt(),
      cashierId: (json['cashier_id'] as num?)?.toInt(),
      invoiceNo: json['invoice_no'] as String?,
      invoiceAmt: (json['invoice_amt'] as num?)?.toInt(),
      branch: json['branch'] as String?,
      offerId: json['offer_id'],
      coins: (json['coins'] as num?)?.toInt(),
      coinType: json['coin_type'] as String?,
      finalAmt: (json['final_amt'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'store_id': instance.storeId,
      'cashier_id': instance.cashierId,
      'invoice_no': instance.invoiceNo,
      'branch': instance.branch,
      'invoice_amt': instance.invoiceAmt,
      'offer_id': instance.offerId,
      'coins': instance.coins,
      'coin_type': instance.coinType,
      'final_amt': instance.finalAmt,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
    };
