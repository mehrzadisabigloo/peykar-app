// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../feature_manage_products/data/model/manage_products_model.dart';
import '../../domain/entity/order_item_entity.dart';

part 'order_item_model.freezed.dart';
part 'order_item_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';
double _anyToDouble(dynamic value) => double.tryParse(value?.toString() ?? '0.0') ?? 0.0;
int _anyToInt(dynamic value) => (value is num) ? value.toInt() : (int.tryParse(value?.toString() ?? '0') ?? 0);

@freezed
class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    @JsonKey(fromJson: _anyToString) @Default('') String id,
    @JsonKey(fromJson: _anyToInt) @Default(0) int quantity,
    @JsonKey(name: 'original_price', fromJson: _anyToDouble) @Default(0.0) double originalPrice,
    @JsonKey(name: 'final_price', fromJson: _anyToDouble) @Default(0.0) double finalPrice,
    ManageProductsModel? product,
  }) = _OrderItemModel;

  const OrderItemModel._();

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  OrderItemEntity toEntity() => OrderItemEntity(
        id: id,
        quantity: quantity,
        originalPrice: originalPrice,
        finalPrice: finalPrice,
        product: product?.toEntity(),
      );

  factory OrderItemModel.fromEntity(OrderItemEntity entity) => OrderItemModel(
        id: entity.id,
        quantity: entity.quantity,
        originalPrice: entity.originalPrice,
        finalPrice: entity.finalPrice,
        product: entity.product != null ? ManageProductsModel.fromEntity(entity.product!) : null,
      );
}
