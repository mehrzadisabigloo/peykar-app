import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/repair_shop_entity.dart';

part 'repairman_details_model.freezed.dart';
part 'repairman_details_model.g.dart';

double _anyToDouble(dynamic value) =>
    double.tryParse(value?.toString() ?? '0') ?? 0.0;

int _anyToInt(dynamic value) =>
    value is num ? value.toInt() : int.tryParse(value?.toString() ?? '0') ?? 0;

bool _anyToBool(dynamic value) {
  if (value is bool) return value;

  final text = value?.toString().toLowerCase();

  return text == 'true' || text == '1';
}

List<String>? _toList(dynamic value) {
  if (value == null) return null;

  if (value is List) {
    return value.map((e) => e.toString()).toList();
  }

  if (value is String) {
    return [value];
  }

  return null;
}

@freezed
class RepairmanDetailsModel with _$RepairmanDetailsModel {
  const factory RepairmanDetailsModel({
    @Default('') String id,

    @JsonKey(name: 'first_name')
    String? firstName,

    @JsonKey(name: 'last_name')
    String? lastName,

    String? mobile,
    String? email,

    @JsonKey(fromJson: _toList)
    List<String>? role,

    String? birthday,

    @JsonKey(name: 'profile_image_id')
    String? profileImageId,

    String? ostan,
    String? shahrestan,
    String? brand,

    @JsonKey(
      name: 'identity_images',
      fromJson: _toList,
    )
    List<String>? identityImages,

    @JsonKey(
      name: 'business_license_image',
      fromJson: _toList,
    )
    List<String>? businessLicenseImage,

    @JsonKey(name: 'phone_numbers')
    String? phoneNumbers,

    @JsonKey(fromJson: _anyToDouble)
    @Default(0.0)
    double lat,

    @JsonKey(fromJson: _anyToDouble)
    @Default(0.0)
    double lng,

    @JsonKey(
      name: 'shop_images',
      fromJson: _toList,
    )
    List<String>? shopImages,

    @JsonKey(name: 'subscription_code')
    String? subscriptionCode,

    @JsonKey(name: 'referral_code')
    String? referralCode,

    @JsonKey(name: 'occupation_id')
    String? occupationId,

    String? status,

    @JsonKey(
      name: 'referral_count',
      fromJson: _anyToInt,
    )
    int? referralCount,

    @JsonKey(
      name: 'has_product',
      fromJson: _anyToBool,
    )
    bool? hasProduct,

    @JsonKey(
      name: 'has_service',
      fromJson: _anyToBool,
    )
    bool? hasService,
  }) = _RepairmanDetailsModel;

  const RepairmanDetailsModel._();

  factory RepairmanDetailsModel.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$RepairmanDetailsModelFromJson(json);

  RepairShopEntity toEntity() => RepairShopEntity(
    id: id,
    name: (brand?.isNotEmpty ?? false)
        ? brand!
        : '${firstName ?? ''} ${lastName ?? ''}'.trim(),
    imageUrl:
    shopImages != null && shopImages!.isNotEmpty ? shopImages!.first : '',
    rating: 0,
    reviewsCount: 0,
    distance: 0,
    services: [],
    mobile: mobile,
    address: '${ostan ?? ''} ${shahrestan ?? ''}'.trim(),
  );

  factory RepairmanDetailsModel.fromEntity(RepairShopEntity entity) {
    return RepairmanDetailsModel(
      id: entity.id,
      brand: entity.name,
      mobile: entity.mobile,
      shopImages: entity.imageUrl.isNotEmpty ? [entity.imageUrl] : null,
      ostan: entity.address?.split(' ').first,
      shahrestan: entity.address?.split(' ').last,
    );
  }
}