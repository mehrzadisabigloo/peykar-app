// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    _CategoryModel(
      id: _anyToString(json['id']),
      title: _anyToString(json['title']),
      slug: _anyToString(json['slug']),
      description: _anyToString(json['description']),
      cover: _anyToString(json['cover']),
      parentId: _anyToString(json['parent_id']),
      isLeaf: json['is_leaf'] == null ? false : _anyToBool(json['is_leaf']),
      isFeatured: json['is_featured'] == null
          ? false
          : _anyToBool(json['is_featured']),
      sortOrder: json['sort_order'] == null ? 0 : _anyToInt(json['sort_order']),
      parents:
          (json['parents'] as List<dynamic>?)
              ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      children:
          (json['children'] as List<dynamic>?)
              ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'cover': instance.cover,
      'parent_id': instance.parentId,
      'is_leaf': instance.isLeaf,
      'is_featured': instance.isFeatured,
      'sort_order': instance.sortOrder,
      'parents': instance.parents,
      'children': instance.children,
    };

_ManageProductsModel _$ManageProductsModelFromJson(Map<String, dynamic> json) =>
    _ManageProductsModel(
      id: json['id'] == null ? '' : _anyToString(json['id']),
      repairmanId: json['repairman_id'] == null
          ? ''
          : _anyToString(json['repairman_id']),
      title: json['title'] == null ? '' : _anyToString(json['title']),
      description: json['description'] == null
          ? ''
          : _anyToString(json['description']),
      images: json['images'] == null
          ? const []
          : _imagesFromJson(json['images']),
      keywords: json['keywords'] == null
          ? const []
          : _keywordsFromJson(json['keywords']),
      price: json['price'] == null ? 0.0 : _anyToDouble(json['price']),
      stock: json['stock'] == null ? 0 : _anyToInt(json['stock']),
      minPurchaseQuantity: json['min_purchase_quantity'] == null
          ? 0
          : _anyToInt(json['min_purchase_quantity']),
      maxPurchaseQuantity: json['max_purchase_quantity'] == null
          ? 0
          : _anyToInt(json['max_purchase_quantity']),
      status: json['status'] == null ? '' : _anyToString(json['status']),
      finalPrice: json['final_price'] == null
          ? 0.0
          : _anyToDouble(json['final_price']),
      hasDiscount: json['has_discount'] == null
          ? false
          : _anyToBool(json['has_discount']),
      discountAmount: json['discount_amount'] == null
          ? 0.0
          : _anyToDouble(json['discount_amount']),
      discountPercentage: json['discount_percentage'] == null
          ? 0
          : _anyToInt(json['discount_percentage']),
      repairman: json['repairman'] == null
          ? null
          : RepairmanModel.fromJson(json['repairman'] as Map<String, dynamic>),
      admin: json['admin'] == null
          ? null
          : RepairmanModel.fromJson(json['admin'] as Map<String, dynamic>),
      ownerType: _anyToString(json['owner_type']),
      categoryId: _anyToString(json['category_id']),
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ManageProductsModelToJson(
  _ManageProductsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'repairman_id': instance.repairmanId,
  'title': instance.title,
  'description': instance.description,
  'images': instance.images,
  'keywords': instance.keywords,
  'price': instance.price,
  'stock': instance.stock,
  'min_purchase_quantity': instance.minPurchaseQuantity,
  'max_purchase_quantity': instance.maxPurchaseQuantity,
  'status': instance.status,
  'final_price': instance.finalPrice,
  'has_discount': instance.hasDiscount,
  'discount_amount': instance.discountAmount,
  'discount_percentage': instance.discountPercentage,
  'repairman': instance.repairman,
  'admin': instance.admin,
  'owner_type': instance.ownerType,
  'category_id': instance.categoryId,
  'category': instance.category,
};
