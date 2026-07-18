import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';
double _anyToDouble(dynamic value) => double.tryParse(value?.toString() ?? '0.0') ?? 0.0;
int _anyToInt(dynamic value) => (value is num) ? value.toInt() : (int.tryParse(value?.toString() ?? '0') ?? 0);

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(name: 'user_id', fromJson: _anyToString) String? userId,
    @JsonKey(name: 'ostan_id', fromJson: _anyToInt) int? ostanId,
    @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) int? shahrestanId,
    @JsonKey(name: 'full_address', fromJson: _anyToString) String? fullAddress,
    @JsonKey(fromJson: _anyToString) String? pelak,
    @JsonKey(fromJson: _anyToString) String? vahed,
    @JsonKey(name: 'postal_code', fromJson: _anyToString) String? postalCode,
    @JsonKey(fromJson: _anyToDouble) double? latitude,
    @JsonKey(fromJson: _anyToDouble) double? longitude,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
    OstanModel? ostan,
    ShahrestanModel? shahrestan,
  }) = _AddressModel;

  const AddressModel._();

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}

@freezed
class OstanModel with _$OstanModel {
  const factory OstanModel({
    @JsonKey(fromJson: _anyToInt) int? id,
    @JsonKey(fromJson: _anyToString) String? name,
  }) = _OstanModel;

  const OstanModel._();

  factory OstanModel.fromJson(Map<String, dynamic> json) =>
      _$OstanModelFromJson(json);
}

@freezed
class ShahrestanModel with _$ShahrestanModel {
  const factory ShahrestanModel({
    @JsonKey(fromJson: _anyToInt) int? id,
    @JsonKey(fromJson: _anyToString) String? name,
    @JsonKey(fromJson: _anyToString) String? ostan,
  }) = _ShahrestanModel;

  const ShahrestanModel._();

  factory ShahrestanModel.fromJson(Map<String, dynamic> json) =>
      _$ShahrestanModelFromJson(json);
}
