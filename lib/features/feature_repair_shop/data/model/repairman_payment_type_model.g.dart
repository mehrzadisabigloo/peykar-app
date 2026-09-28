// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repairman_payment_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RepairmanPaymentTypeModel _$RepairmanPaymentTypeModelFromJson(
  Map<String, dynamic> json,
) => _RepairmanPaymentTypeModel(
  id: _anyToInt(json['id']),
  repairmanId: _anyToString(json['repairman_id']),
  adminId: _anyToString(json['admin_id']),
  paymentTypeId: _anyToInt(json['payment_type_id']),
  paymentType: json['payment_type'] == null
      ? null
      : PaymentTypeModel.fromJson(json['payment_type'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RepairmanPaymentTypeModelToJson(
  _RepairmanPaymentTypeModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'repairman_id': instance.repairmanId,
  'admin_id': instance.adminId,
  'payment_type_id': instance.paymentTypeId,
  'payment_type': instance.paymentType,
};
