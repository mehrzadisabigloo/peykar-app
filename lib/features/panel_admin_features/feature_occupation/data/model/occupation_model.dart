import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/occupation_entity.dart';

part 'occupation_model.freezed.dart';
part 'occupation_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';
int _anyToInt(dynamic value) => (value is num) ? value.toInt() : (int.tryParse(value?.toString() ?? '0') ?? 0);

@freezed
class OccupationModel with _$OccupationModel {
  const factory OccupationModel({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(fromJson: _anyToString) String? title,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'sort_order', fromJson: _anyToInt) int? sortOrder,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
  }) = _OccupationModel;

  const OccupationModel._();

  factory OccupationModel.fromJson(Map<String, dynamic> json) =>
      _$OccupationModelFromJson(json);

  OccupationEntity toEntity() => OccupationEntity(
    id: id,
    title: title,
    status: status,
    sortOrder: sortOrder,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
