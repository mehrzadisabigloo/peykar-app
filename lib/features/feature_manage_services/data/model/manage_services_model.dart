import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/resources/consts.dart';
import '../../domain/entity/manage_services_entity.dart';
import '../../../feature_manage_products/data/model/repairman_model.dart';

part 'manage_services_model.freezed.dart';
part 'manage_services_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';

double _anyToDouble(dynamic value) =>
    double.tryParse(value?.toString() ?? '0') ?? 0.0;

List<String> _imagesFromJson(dynamic json) {
  if (json == null) return [];

  if (json is! List) return [];

  return json
      .map((e) {
    final id = e.toString();

    if (id.isEmpty) return '';

    if (id.startsWith('http')) {
      return id;
    }

    return '${Consts.baseFileUrl}$id';
  })
      .where((e) => e.isNotEmpty)
      .toList();
}

List<String> _keywordsFromJson(dynamic json) {
  if (json is! List) return [];

  return json.map((e) => e.toString()).toList();
}

@freezed
class ManageServicesModel with _$ManageServicesModel {
  const factory ManageServicesModel({
    @JsonKey(fromJson: _anyToString)
    @Default('')
    String id,

    @JsonKey(name: 'repairman_id', fromJson: _anyToString)
    String? repairmanId,

    @JsonKey(fromJson: _anyToString)
    @Default('')
    String title,

    @JsonKey(fromJson: _anyToString)
    @Default('')
    String description,

    @JsonKey(fromJson: _imagesFromJson)
    @Default([])
    List<String> images,

    @JsonKey(fromJson: _keywordsFromJson)
    @Default([])
    List<String> keywords,

    @JsonKey(name: 'price_min', fromJson: _anyToDouble)
    @Default(0.0)
    double priceMin,

    @JsonKey(name: 'price_max', fromJson: _anyToDouble)
    @Default(0.0)
    double priceMax,

    @JsonKey(fromJson: _anyToString)
    @Default('')
    String status,

    RepairmanModel? repairman,
  }) = _ManageServicesModel;

  const ManageServicesModel._();

  factory ManageServicesModel.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$ManageServicesModelFromJson(json);

  ManageServicesEntity toEntity() => ManageServicesEntity(
    id: id,
    repairmanId: repairmanId,
    title: title,
    description: description,
    images: images,
    keywords: keywords,
    priceMin: priceMin,
    priceMax: priceMax,
    status: status,
    repairman: repairman?.toEntity(),
  );

  factory ManageServicesModel.fromEntity(
      ManageServicesEntity entity,
      ) =>
      ManageServicesModel(
        id: entity.id,
        repairmanId: entity.repairmanId,
        title: entity.title,
        description: entity.description,
        images: entity.images,
        keywords: entity.keywords,
        priceMin: entity.priceMin,
        priceMax: entity.priceMax,
        status: entity.status,
        repairman: entity.repairman != null
            ? RepairmanModel.fromEntity(entity.repairman!)
            : null,
      );
}