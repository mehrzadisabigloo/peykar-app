// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ManageProductsModelImpl _$$ManageProductsModelImplFromJson(
  Map<String, dynamic> json,
) => _$ManageProductsModelImpl(
  id: json['id'] == null ? '' : _anyToString(json['id']),
  repairmanId: json['repairman_id'] == null
      ? ''
      : _anyToString(json['repairman_id']),
  title: json['title'] == null ? '' : _anyToString(json['title']),
  description: json['description'] == null
      ? ''
      : _anyToString(json['description']),
  images: json['images'] == null ? const [] : _imagesFromJson(json['images']),
  keywords: json['keywords'] == null
      ? const []
      : _keywordsFromJson(json['keywords']),
  price: json['price'] == null ? 0.0 : _anyToDouble(json['price']),
  stock: json['stock'] == null ? 0 : _anyToInt(json['stock']),
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
);

Map<String, dynamic> _$$ManageProductsModelImplToJson(
  _$ManageProductsModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'repairman_id': instance.repairmanId,
  'title': instance.title,
  'description': instance.description,
  'images': instance.images,
  'keywords': instance.keywords,
  'price': instance.price,
  'stock': instance.stock,
  'max_purchase_quantity': instance.maxPurchaseQuantity,
  'status': instance.status,
  'final_price': instance.finalPrice,
  'has_discount': instance.hasDiscount,
  'discount_amount': instance.discountAmount,
  'discount_percentage': instance.discountPercentage,
  'repairman': instance.repairman,
};
