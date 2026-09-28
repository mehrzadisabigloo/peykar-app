// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/manage_bank_accounts_entity.dart';

part 'bank_account_model.freezed.dart';
part 'bank_account_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';
int _anyToInt(dynamic value) => (value is num) ? value.toInt() : (int.tryParse(value?.toString() ?? '0') ?? 0);

@freezed
sealed class BankAccountModel with _$BankAccountModel {
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
    BankModel? bank,
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
        bank: bank?.toEntity(),
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
        bank: entity.bank != null ? BankModel(id: entity.bank!.id, name: entity.bank!.name, logo: entity.bank!.logo) : null,
      );
}

@freezed
sealed class BankModel with _$BankModel {
  const factory BankModel({
    @JsonKey(fromJson: _anyToInt) int? id,
    @JsonKey(fromJson: _anyToString) String? name,
    @JsonKey(fromJson: _anyToString) String? logo,
  }) = _BankModel;

  const BankModel._();

  factory BankModel.fromJson(Map<String, dynamic> json) =>
      _$BankModelFromJson(json);

  BankEntity toEntity() => BankEntity(
        id: id,
        name: name,
        logo: logo,
      );
}
