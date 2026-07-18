// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemModelImpl _$$OrderItemModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemModelImpl(
      id: json['id'] == null ? '' : _anyToString(json['id']),
      quantity: json['quantity'] == null ? 0 : _anyToInt(json['quantity']),
      originalPrice: json['original_price'] == null
          ? 0.0
          : _anyToDouble(json['original_price']),
      finalPrice: json['final_price'] == null
          ? 0.0
          : _anyToDouble(json['final_price']),
      product: json['product'] == null
          ? null
          : ManageProductsModel.fromJson(
              json['product'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$OrderItemModelImplToJson(
  _$OrderItemModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'quantity': instance.quantity,
  'original_price': instance.originalPrice,
  'final_price': instance.finalPrice,
  'product': instance.product,
};
