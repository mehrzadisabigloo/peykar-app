// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/manage_bank_accounts_entity.dart';

part 'bank_account_model.freezed.dart';
part 'bank_account_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';
int _anyToInt(dynamic value) => (value is num) ? value.toInt() : (int.tryParse(value?.toString() ?? '0') ?? 0);

@freezed
class BankAccountModel with _$BankAccountModel {
  const factory BankAccountModel({
    @JsonKey(fromJson: _anyToString) @Default('') String id,
    @JsonKey(name: 'bank_id', fromJson: _anyToInt) int? bankId,
    @JsonKey(name: 'full_name', fromJson: _anyToString) String? fullName,
    @JsonKey(name: 'card_number', fromJson: _anyToString) String? cardNumber,
    @JsonKey(name: 'account_number', fromJson: _anyToString) String? accountNumber,
    @JsonKey(name: 'sheba_number', fromJson: _anyToString) String? shebaNumber,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
  }) = _BankAccountModel;

  const BankAccountModel._();

  factory BankAccountModel.fromJson(Map<String, dynamic> json) =>
      _$BankAccountModelFromJson(json);

  BankAccountEntity toEntity() => BankAccountEntity(
        id: id,
        bankId: bankId,
        fullName: fullName,
        cardNumber: cardNumber,
        accountNumber: accountNumber,
        shebaNumber: shebaNumber,
        status: status,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  factory BankAccountModel.fromEntity(BankAccountEntity entity) => BankAccountModel(
        id: entity.id ?? '',
        bankId: entity.bankId,
        fullName: entity.fullName,
        cardNumber: entity.cardNumber,
        accountNumber: entity.accountNumber,
        shebaNumber: entity.shebaNumber,
        status: entity.status,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );
}

class BankModel {
  final int? id;
  final String? name;
  final String? logo;

  BankModel({this.id, this.name, this.logo});

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      id: _anyToInt(json['id']),
      name: _anyToString(json['name']),
      logo: _anyToString(json['logo']),
    );
  }

  BankEntity toEntity() => BankEntity(
        id: id,
        name: name,
        logo: logo,
      );
}
