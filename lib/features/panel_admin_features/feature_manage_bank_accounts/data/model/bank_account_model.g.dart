// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BankAccountModel _$BankAccountModelFromJson(Map<String, dynamic> json) =>
    _BankAccountModel(
      id: json['id'] == null ? '' : _anyToString(json['id']),
      bankId: _anyToInt(json['bank_id']),
      fullName: _anyToString(json['full_name']),
      cardNumber: _anyToString(json['card_number']),
      accountNumber: _anyToString(json['account_number']),
      shebaNumber: _anyToString(json['sheba_number']),
      status: _anyToString(json['status']),
      createdAt: _anyToString(json['created_at']),
      updatedAt: _anyToString(json['updated_at']),
      bank: json['bank'] == null
          ? null
          : BankModel.fromJson(json['bank'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BankAccountModelToJson(_BankAccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bank_id': instance.bankId,
      'full_name': instance.fullName,
      'card_number': instance.cardNumber,
      'account_number': instance.accountNumber,
      'sheba_number': instance.shebaNumber,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'bank': instance.bank,
    };

_BankModel _$BankModelFromJson(Map<String, dynamic> json) => _BankModel(
  id: _anyToInt(json['id']),
  name: _anyToString(json['name']),
  logo: _anyToString(json['logo']),
);

Map<String, dynamic> _$BankModelToJson(_BankModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };
