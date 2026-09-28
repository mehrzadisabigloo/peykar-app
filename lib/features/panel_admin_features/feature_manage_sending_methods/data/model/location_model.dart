import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

int _anyToInt(dynamic value) => (value is num) ? value.toInt() : (int.tryParse(value?.toString() ?? '0') ?? 0);
String _anyToString(dynamic value) => value?.toString() ?? '';

@freezed
sealed class OstanModel with _$OstanModel {
  const factory OstanModel({
    @JsonKey(fromJson: _anyToInt) int? id,
    @JsonKey(fromJson: _anyToString) String? name,
  }) = _OstanModel;

  factory OstanModel.fromJson(Map<String, dynamic> json) => _$OstanModelFromJson(json);
}

@freezed
sealed class ShahrestanModel with _$ShahrestanModel {
  const factory ShahrestanModel({
    @JsonKey(fromJson: _anyToInt) int? id,
    @JsonKey(fromJson: _anyToString) String? name,
    @JsonKey(fromJson: _anyToString) String? ostan,
  }) = _ShahrestanModel;

  factory ShahrestanModel.fromJson(Map<String, dynamic> json) => _$ShahrestanModelFromJson(json);
}
