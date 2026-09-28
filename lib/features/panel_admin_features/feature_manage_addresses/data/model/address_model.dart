import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_sending_methods/data/model/location_model.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';
double _anyToDouble(dynamic value) => double.tryParse(value?.toString() ?? '0.0') ?? 0.0;
int _anyToInt(dynamic value) => (value is num) ? value.toInt() : (int.tryParse(value?.toString() ?? '0') ?? 0);

@freezed
sealed class AddressModel with _$AddressModel {
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
