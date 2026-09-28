import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_type_model.freezed.dart';
part 'payment_type_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';
int _anyToInt(dynamic value) => (value is num) ? value.toInt() : (int.tryParse(value?.toString() ?? '0') ?? 0);

@freezed
sealed class PaymentTypeModel with _$PaymentTypeModel {
  const factory PaymentTypeModel({
    @JsonKey(fromJson: _anyToInt) int? id,
    @JsonKey(fromJson: _anyToString) String? title,
    @JsonKey(fromJson: _anyToString) String? label,
    @JsonKey(fromJson: _anyToString) String? type,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
  }) = _PaymentTypeModel;

  const PaymentTypeModel._();

  factory PaymentTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentTypeModelFromJson(json);

  bool get isActive => status?.toLowerCase() == 'Active';
}
