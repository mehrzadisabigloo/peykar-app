// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiscountModelImpl _$$DiscountModelImplFromJson(Map<String, dynamic> json) =>
    _$DiscountModelImpl(
      id: _anyToString(json['id']),
      discountCode: _anyToString(json['discount_code']),
      discountCodeExpiresAt: _anyToString(json['discount_code_expires_at']),
      discountCodeUseNumber: _anyToInt(json['discount_code_use_number']),
      discountType: _anyToString(json['discount_type']),
      discountPercentage: _anyToInt(json['discount_percentage']),
      discountAmount: _anyToInt(json['discount_amount']),
      userId: (json['userId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      role: (json['role'] as List<dynamic>?)?.map((e) => e as String).toList(),
      productId: _anyToString(json['product_id']),
      repairmanId: _anyToString(json['repairman_id']),
      status: _anyToString(json['status']),
      createdAt: _anyToString(json['created_at']),
      updatedAt: _anyToString(json['updated_at']),
    );

Map<String, dynamic> _$$DiscountModelImplToJson(_$DiscountModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'discount_code': instance.discountCode,
      'discount_code_expires_at': instance.discountCodeExpiresAt,
      'discount_code_use_number': instance.discountCodeUseNumber,
      'discount_type': instance.discountType,
      'discount_percentage': instance.discountPercentage,
      'discount_amount': instance.discountAmount,
      'userId': instance.userId,
      'role': instance.role,
      'product_id': instance.productId,
      'repairman_id': instance.repairmanId,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
