// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/resources/consts.dart';
import '../../domain/entity/manage_products_entity.dart';
import 'repairman_model.dart';

part 'manage_products_model.freezed.dart';
part 'manage_products_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';

double _anyToDouble(dynamic value) =>
    double.tryParse(value?.toString() ?? '0') ?? 0.0;

int _anyToInt(dynamic value) =>
    value is num ? value.toInt() : int.tryParse(value?.toString() ?? '0') ?? 0;

bool _anyToBool(dynamic value) {
  if (value is bool) return value;

  final text = value?.toString().toLowerCase();

  return text == 'true' || text == '1';
}

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
class ManageProductsModel with _$ManageProductsModel {
  const factory ManageProductsModel({
    @JsonKey(fromJson: _anyToString)
    @Default('')
    String id,

    @JsonKey(
      name: 'repairman_id',
      fromJson: _anyToString,
    )
    @Default('')
    String repairmanId,

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

    @JsonKey(fromJson: _anyToDouble)
    @Default(0.0)
    double price,

    @JsonKey(fromJson: _anyToInt)
    @Default(0)
    int stock,

    @JsonKey(
      name: 'max_purchase_quantity',
      fromJson: _anyToInt,
    )
    @Default(0)
    int maxPurchaseQuantity,

    @JsonKey(fromJson: _anyToString)
    @Default('')
    String status,

    @JsonKey(
      name: 'final_price',
      fromJson: _anyToDouble,
    )
    @Default(0.0)
    double finalPrice,

    @JsonKey(
      name: 'has_discount',
      fromJson: _anyToBool,
    )
    @Default(false)
    bool hasDiscount,

    @JsonKey(
      name: 'discount_amount',
      fromJson: _anyToDouble,
    )
    @Default(0.0)
    double discountAmount,

    @JsonKey(
      name: 'discount_percentage',
      fromJson: _anyToInt,
    )
    @Default(0)
    int discountPercentage,

    RepairmanModel? repairman,
  }) = _ManageProductsModel;

  const ManageProductsModel._();

  factory ManageProductsModel.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$ManageProductsModelFromJson(json);

  ManageProductsEntity toEntity() => ManageProductsEntity(
    id: id,
    repairmanId: repairmanId,
    title: title,
    description: description,
    images: images,
    keywords: keywords,
    price: price,
    stock: stock,
    maxPurchaseQuantity: maxPurchaseQuantity,
    status: status,
    finalPrice: finalPrice,
    hasDiscount: hasDiscount,
    discountAmount: discountAmount,
    discountPercentage: discountPercentage,
    repairman: repairman?.toEntity(),
  );

  factory ManageProductsModel.fromEntity(
      ManageProductsEntity entity,
      ) =>
      ManageProductsModel(
        id: entity.id,
        repairmanId: entity.repairmanId,
        title: entity.title,
        description: entity.description,
        images: entity.images,
        keywords: entity.keywords,
        price: entity.price,
        stock: entity.stock,
        maxPurchaseQuantity: entity.maxPurchaseQuantity,
        status: entity.status,
        finalPrice: entity.finalPrice,
        hasDiscount: entity.hasDiscount,
        discountAmount: entity.discountAmount,
        discountPercentage: entity.discountPercentage,
        repairman: entity.repairman != null
            ? RepairmanModel.fromEntity(entity.repairman!)
            : null,
      );
}