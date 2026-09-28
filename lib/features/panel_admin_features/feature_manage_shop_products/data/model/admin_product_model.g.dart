// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminProductModel _$AdminProductModelFromJson(
  Map<String, dynamic> json,
) => _AdminProductModel(
  id: _anyToString(json['id']),
  title: json['title'] == null ? '' : _anyToString(json['title']),
  description: json['description'] == null
      ? ''
      : _anyToString(json['description']),
  images: json['images'] == null ? const [] : _imagesFromJson(json['images']),
  keywords:
      (json['keywords'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  price: json['price'] == null ? 0.0 : _anyToDouble(json['price']),
  stock: json['stock'] == null ? 0 : _anyToInt(json['stock']),
  minPurchaseQuantity: json['min_purchase_quantity'] == null
      ? 1
      : _anyToInt(json['min_purchase_quantity']),
  maxPurchaseQuantity: json['max_purchase_quantity'] == null
      ? 0
      : _anyToInt(json['max_purchase_quantity']),
  status: _anyToString(json['status']),
  createdAt: _anyToString(json['created_at']),
  finalPrice: _anyToDouble(json['final_price']),
  hasDiscount: _anyToBool(json['has_discount']),
  discountAmount: _anyToDouble(json['discount_amount']),
  discountPercentage: _anyToDouble(json['discount_percentage']),
  categoryId: _anyToString(json['category_id']),
  category: json['category'] == null
      ? null
      : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AdminProductModelToJson(_AdminProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'images': _imagesToJson(instance.images),
      'keywords': instance.keywords,
      'price': instance.price,
      'stock': instance.stock,
      'min_purchase_quantity': instance.minPurchaseQuantity,
      'max_purchase_quantity': instance.maxPurchaseQuantity,
      'status': instance.status,
      'created_at': instance.createdAt,
      'final_price': instance.finalPrice,
      'has_discount': instance.hasDiscount,
      'discount_amount': instance.discountAmount,
      'discount_percentage': instance.discountPercentage,
      'category_id': instance.categoryId,
      'category': instance.category,
    };
