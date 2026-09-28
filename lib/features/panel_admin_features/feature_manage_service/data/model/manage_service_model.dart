// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/resources/consts.dart';
import '../../domain/entity/manage_service_entity.dart';
import '../../../feature_occupation/data/model/occupation_model.dart';

part 'manage_service_model.freezed.dart';
part 'manage_service_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';

double _anyToDouble(dynamic value) =>
    double.tryParse(value?.toString() ?? '0') ?? 0.0;

int _anyToInt(dynamic value) =>
    value is num ? value.toInt() : int.tryParse(value?.toString() ?? '0') ?? 0;

List<String> _imagesFromJson(dynamic json) {
  if (json == null) return [];
  if (json is! List) return [];
  return json
      .map((e) {
        final id = e.toString();
        if (id.isEmpty) return '';
        if (id.startsWith('http')) return id;
        return '${Consts.baseFileUrl}$id';
      })
      .where((e) => e.isNotEmpty)
      .toList();
}

List<String> _keywordsFromJson(dynamic json) {
  if (json is! List) return [];
  return json.map((e) => e.toString()).toList();
}

double _priceMinFromJson(Map<dynamic, dynamic> json, String key) {
  final priceRange = json['price_range'];
  if (priceRange is Map) return _anyToDouble(priceRange['min']);
  return 0.0;
}

double _priceMaxFromJson(Map<dynamic, dynamic> json, String key) {
  final priceRange = json['price_range'];
  if (priceRange is Map) return _anyToDouble(priceRange['max']);
  return 0.0;
}

@freezed
sealed class ManageServiceModel with _$ManageServiceModel {
  const factory ManageServiceModel({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(fromJson: _anyToString) String? title,
    @JsonKey(fromJson: _anyToString) String? description,
    @JsonKey(fromJson: _imagesFromJson) List<String>? images,
    @JsonKey(fromJson: _keywordsFromJson) List<String>? keywords,
    @JsonKey(readValue: _priceMinFromJson) double? priceMin,
    @JsonKey(readValue: _priceMaxFromJson) double? priceMax,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
    OccupationModel? occupation,
  }) = _ManageServiceModel;

  const ManageServiceModel._();

  factory ManageServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ManageServiceModelFromJson(json);

  ManageServiceEntity toEntity() => ManageServiceEntity(
    id: id ?? '',
    title: title ?? '',
    description: description ?? '',
    images: images ?? [],
    keywords: keywords ?? [],
    priceMin: priceMin ?? 0.0,
    priceMax: priceMax ?? 0.0,
    status: status ?? '',
    createdAt: DateTime.tryParse(createdAt ?? '') ?? DateTime.now(),
    updatedAt: DateTime.tryParse(updatedAt ?? '') ?? DateTime.now(),
    occupation: occupation?.toEntity(),
  );

  factory ManageServiceModel.fromEntity(ManageServiceEntity entity) => ManageServiceModel(
    id: entity.id,
    title: entity.title,
    description: entity.description,
    images: entity.images,
    keywords: entity.keywords,
    priceMin: entity.priceMin,
    priceMax: entity.priceMax,
    status: entity.status,
    createdAt: entity.createdAt.toIso8601String(),
    updatedAt: entity.updatedAt.toIso8601String(),
  );
}
