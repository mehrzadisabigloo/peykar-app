import 'package:freezed_annotation/freezed_annotation.dart';

part 'discount_model.freezed.dart';
part 'discount_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';
int _anyToInt(dynamic value) => (value is num) ? value.toInt() : (int.tryParse(value?.toString() ?? '0') ?? 0);

@freezed
class DiscountModel with _$DiscountModel {
  const factory DiscountModel({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(name: 'discount_code', fromJson: _anyToString) String? discountCode,
    @JsonKey(name: 'discount_code_expires_at', fromJson: _anyToString) String? discountCodeExpiresAt,
    @JsonKey(name: 'discount_code_use_number', fromJson: _anyToInt) int? discountCodeUseNumber,
    @JsonKey(name: 'discount_type', fromJson: _anyToString) String? discountType,
    @JsonKey(name: 'discount_percentage', fromJson: _anyToInt) int? discountPercentage,
    @JsonKey(name: 'discount_amount', fromJson: _anyToInt) int? discountAmount,
    List<String>? userId,
    List<String>? role,
    @JsonKey(name: 'product_id', fromJson: _anyToString) String? productId,
    @JsonKey(name: 'repairman_id', fromJson: _anyToString) String? repairmanId,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
  }) = _DiscountModel;

  const DiscountModel._();

  factory DiscountModel.fromJson(Map<String, dynamic> json) =>
      _$DiscountModelFromJson(json);

  bool get isActive => status?.toLowerCase() == 'active';
}
