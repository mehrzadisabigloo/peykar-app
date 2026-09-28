import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/resources/consts.dart';
import '../../../../feature_manage_products/data/model/manage_products_model.dart';
import '../../domain/entity/admin_product_entity.dart';

part 'admin_product_model.freezed.dart';
part 'admin_product_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';
double _anyToDouble(dynamic value) => double.tryParse(value?.toString() ?? '0') ?? 0.0;
int _anyToInt(dynamic value) => value is num ? value.toInt() : int.tryParse(value?.toString() ?? '0') ?? 0;
bool _anyToBool(dynamic value) {
  if (value is bool) return value;
  final text = value?.toString().toLowerCase();
  return text == 'true' || text == '1';
}

List<String> _imagesFromJson(dynamic json) {
  if (json is! List) return [];
  return json.map((e) {
    return e.toString();
  }).where((e) => e.isNotEmpty).cast<String>().toList();
}

List<String> _imagesToJson(List<String> images) {
  return images;
}

@freezed
sealed class AdminProductModel with _$AdminProductModel {
  const factory AdminProductModel({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(fromJson: _anyToString) @Default('') String title,
    @JsonKey(fromJson: _anyToString) @Default('') String description,
    @JsonKey(fromJson: _imagesFromJson, toJson: _imagesToJson) @Default([]) List<String> images,
    @Default([]) List<String> keywords,
    @JsonKey(fromJson: _anyToDouble) @Default(0.0) double price,
    @JsonKey(fromJson: _anyToInt) @Default(0) int stock,
    @JsonKey(name: 'min_purchase_quantity', fromJson: _anyToInt) @Default(1) int minPurchaseQuantity,
    @JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt) @Default(0) int maxPurchaseQuantity,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'final_price', fromJson: _anyToDouble) double? finalPrice,
    @JsonKey(name: 'has_discount', fromJson: _anyToBool) bool? hasDiscount,
    @JsonKey(name: 'discount_amount', fromJson: _anyToDouble) double? discountAmount,
    @JsonKey(name: 'discount_percentage', fromJson: _anyToDouble) double? discountPercentage,
    @JsonKey(name: 'category_id', fromJson: _anyToString) String? categoryId,
    CategoryModel? category,
  }) = _AdminProductModel;

  const AdminProductModel._();

  factory AdminProductModel.fromJson(Map<String, dynamic> json) => _$AdminProductModelFromJson(json);

  AdminProductEntity toEntity() => AdminProductEntity(
    id: id,
    title: title,
    description: description,
    images: images,
    keywords: keywords,
    price: price,
    stock: stock,
    minPurchaseQuantity: minPurchaseQuantity,
    maxPurchaseQuantity: maxPurchaseQuantity,
    status: status,
    createdAt: createdAt,
    finalPrice: finalPrice,
    hasDiscount: hasDiscount,
    discountAmount: discountAmount,
    discountPercentage: discountPercentage,
    categoryId: categoryId,
    category: category?.toEntity(),
  );

  factory AdminProductModel.fromEntity(AdminProductEntity entity) => AdminProductModel(
    id: entity.id,
    title: entity.title,
    description: entity.description,
    images: entity.images,
    keywords: entity.keywords,
    price: entity.price,
    stock: entity.stock,
    minPurchaseQuantity: entity.minPurchaseQuantity,
    maxPurchaseQuantity: entity.maxPurchaseQuantity,
    status: entity.status,
    createdAt: entity.createdAt,
    categoryId: entity.categoryId,
    category: entity.category != null ? CategoryModel.fromEntity(entity.category!) : null,
  );
}
