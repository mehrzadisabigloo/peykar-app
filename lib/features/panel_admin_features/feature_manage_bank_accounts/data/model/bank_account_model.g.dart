// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankAccountModelImpl _$$BankAccountModelImplFromJson(
  Map<String, dynamic> json,
) => _$BankAccountModelImpl(
  id: json['id'] == null ? '' : _anyToString(json['id']),
  bankId: _anyToInt(json['bank_id']),
  fullName: _anyToString(json['full_name']),
  cardNumber: _anyToString(json['card_number']),
  accountNumber: _anyToString(json['account_number']),
  shebaNumber: _anyToString(json['sheba_number']),
  status: _anyToString(json['status']),
  createdAt: _anyToString(json['created_at']),
  updatedAt: _anyToString(json['updated_at']),
);

Map<String, dynamic> _$$BankAccountModelImplToJson(
  _$BankAccountModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'bank_id': instance.bankId,
  'full_name': instance.fullName,
  'card_number': instance.cardNumber,
  'account_number': instance.accountNumber,
  'sheba_number': instance.shebaNumber,
  'status': instance.status,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
