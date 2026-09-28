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
sealed class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    @JsonKey(name: 'id', fromJson: _anyToString) required String id,
    @JsonKey(name: 'title', fromJson: _anyToString) required String title,
    @JsonKey(name: 'slug', fromJson: _anyToString) String? slug,
    @JsonKey(name: 'description', fromJson: _anyToString) String? description,
    @JsonKey(name: 'cover', fromJson: _anyToString) String? cover,
    @JsonKey(name: 'parent_id', fromJson: _anyToString) String? parentId,
    @JsonKey(name: 'is_leaf', fromJson: _anyToBool) @Default(false) bool isLeaf,
    @JsonKey(name: 'is_featured', fromJson: _anyToBool) @Default(false) bool isFeatured,
    @JsonKey(name: 'sort_order', fromJson: _anyToInt) @Default(0) int sortOrder,
    @Default([]) List<CategoryModel> parents,
    @Default([]) List<CategoryModel> children,
  }) = _CategoryModel;

  const CategoryModel._();

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  factory CategoryModel.fromEntity(
    CategoryEntity entity,
  ) =>
      CategoryModel(
        id: entity.id,
        title: entity.title,
        slug: entity.slug,
        description: entity.description,
        cover: entity.cover,
        parentId: entity.parentId,
        isLeaf: entity.isLeaf,
        isFeatured: entity.isFeatured,
        sortOrder: entity.sortOrder,
        parents: entity.parents.map((e) => CategoryModel.fromEntity(e)).toList(),
        children: entity.children.map((e) => CategoryModel.fromEntity(e)).toList(),
      );

  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        title: title,
        slug: slug,
        description: description,
        cover: cover,
        parentId: parentId,
        isLeaf: isLeaf,
        isFeatured: isFeatured,
        sortOrder: sortOrder,
        parents: parents.map((e) => e.toEntity()).toList(),
        children: children.map((e) => e.toEntity()).toList(),
      );
}

@freezed
sealed class ManageProductsModel with _$ManageProductsModel {
  const factory ManageProductsModel({
    @JsonKey(fromJson: _anyToString) @Default('') String id,

    @JsonKey(
      name: 'repairman_id',
      fromJson: _anyToString,
    )
    @Default('')
    String repairmanId,

    @JsonKey(fromJson: _anyToString) @Default('') String title,

    @JsonKey(fromJson: _anyToString) @Default('') String description,

    @JsonKey(fromJson: _imagesFromJson) @Default([]) List<String> images,

    @JsonKey(fromJson: _keywordsFromJson) @Default([]) List<String> keywords,

    @JsonKey(fromJson: _anyToDouble) @Default(0.0) double price,

    @JsonKey(fromJson: _anyToInt) @Default(0) int stock,

    @JsonKey(
      name: 'min_purchase_quantity',
      fromJson: _anyToInt,
    )
    @Default(0)
    int minPurchaseQuantity,

    @JsonKey(
      name: 'max_purchase_quantity',
      fromJson: _anyToInt,
    )
    @Default(0)
    int maxPurchaseQuantity,

    @JsonKey(fromJson: _anyToString) @Default('') String status,

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

    RepairmanModel? admin,

    @JsonKey(name: 'owner_type', fromJson: _anyToString) String? ownerType,

    @JsonKey(name: 'category_id', fromJson: _anyToString) String? categoryId,

    CategoryModel? category,
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
        minPurchaseQuantity: minPurchaseQuantity,
        maxPurchaseQuantity: maxPurchaseQuantity,
        status: status,
        finalPrice: finalPrice,
        hasDiscount: hasDiscount,
        discountAmount: discountAmount,
        discountPercentage: discountPercentage,
        repairman: repairman?.toEntity(),
        admin: admin?.toEntity(),
        ownerType: ownerType,
        categoryId: categoryId,
        category: category?.toEntity(),
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
        minPurchaseQuantity: entity.minPurchaseQuantity,
        maxPurchaseQuantity: entity.maxPurchaseQuantity,
        status: entity.status,
        finalPrice: entity.finalPrice,
        hasDiscount: entity.hasDiscount,
        discountAmount: entity.discountAmount,
        discountPercentage: entity.discountPercentage,
        repairman: entity.repairman != null
            ? RepairmanModel.fromEntity(entity.repairman!)
            : null,
        admin: entity.admin != null
            ? RepairmanModel.fromEntity(entity.admin!)
            : null,
        ownerType: entity.ownerType,
        categoryId: entity.categoryId,
        category: entity.category != null
            ? CategoryModel.fromEntity(entity.category!)
            : null,
      );
}
