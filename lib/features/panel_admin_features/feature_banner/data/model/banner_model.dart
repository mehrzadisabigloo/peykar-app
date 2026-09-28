import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/banner_entity.dart';

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';

@freezed
sealed class BannerModel with _$BannerModel {
  const factory BannerModel({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(fromJson: _anyToString) String? place,
    Map<String, dynamic>? images,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
  }) = _BannerModel;

  const BannerModel._();

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);

  BannerEntity toEntity() => BannerEntity(
    id: id,
    place: place,
    images: images,
    status: status,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
