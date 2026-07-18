import 'package:freezed_annotation/freezed_annotation.dart';

part 'sending_method_model.freezed.dart';
part 'sending_method_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';
int _anyToInt(dynamic value) => (value is num) ? value.toInt() : (int.tryParse(value?.toString() ?? '0') ?? 0);

@freezed
class SendingMethodModel with _$SendingMethodModel {
  const factory SendingMethodModel({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(fromJson: _anyToString) String? title,
    @JsonKey(fromJson: _anyToInt) int? price,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
    @JsonKey(name: 'locations_count', fromJson: _anyToInt) int? locationsCount,
    List<SendingMethodLocationModel>? locations,
  }) = _SendingMethodModel;

  const SendingMethodModel._();

  factory SendingMethodModel.fromJson(Map<String, dynamic> json) =>
      _$SendingMethodModelFromJson(json);

  bool get isActive => status?.toLowerCase() == 'active';
}

@unfreezed
class SendingMethodLocationModel with _$SendingMethodLocationModel {
  factory SendingMethodLocationModel({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(name: 'sending_method_id', fromJson: _anyToString) String? sendingMethodId,
    @JsonKey(name: 'ostan_id', fromJson: _anyToInt) int? ostanId,
    @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) int? shahrestanId,
    @JsonKey(fromJson: _anyToInt) int? price,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
  }) = _SendingMethodLocationModel;

  const SendingMethodLocationModel._();

  factory SendingMethodLocationModel.fromJson(Map<String, dynamic> json) =>
      _$SendingMethodLocationModelFromJson(json);
}
