// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminProductModel {

@JsonKey(fromJson: _anyToString) String? get id;@JsonKey(fromJson: _anyToString) String get title;@JsonKey(fromJson: _anyToString) String get description;@JsonKey(fromJson: _imagesFromJson, toJson: _imagesToJson) List<String> get images; List<String> get keywords;@JsonKey(fromJson: _anyToDouble) double get price;@JsonKey(fromJson: _anyToInt) int get stock;@JsonKey(name: 'min_purchase_quantity', fromJson: _anyToInt) int get minPurchaseQuantity;@JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt) int get maxPurchaseQuantity;@JsonKey(fromJson: _anyToString) String? get status;@JsonKey(name: 'created_at', fromJson: _anyToString) String? get createdAt;@JsonKey(name: 'final_price', fromJson: _anyToDouble) double? get finalPrice;@JsonKey(name: 'has_discount', fromJson: _anyToBool) bool? get hasDiscount;@JsonKey(name: 'discount_amount', fromJson: _anyToDouble) double? get discountAmount;@JsonKey(name: 'discount_percentage', fromJson: _anyToDouble) double? get discountPercentage;@JsonKey(name: 'category_id', fromJson: _anyToString) String? get categoryId; CategoryModel? get category;
/// Create a copy of AdminProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminProductModelCopyWith<AdminProductModel> get copyWith => _$AdminProductModelCopyWithImpl<AdminProductModel>(this as AdminProductModel, _$identity);

  /// Serializes this AdminProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AdminProductModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminProductModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&const DeepCollectionEquality().equals(other.images, _this.images)&&const DeepCollectionEquality().equals(other.keywords, _this.keywords)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.stock, _this.stock) || other.stock == _this.stock)&&(identical(other.minPurchaseQuantity, _this.minPurchaseQuantity) || other.minPurchaseQuantity == _this.minPurchaseQuantity)&&(identical(other.maxPurchaseQuantity, _this.maxPurchaseQuantity) || other.maxPurchaseQuantity == _this.maxPurchaseQuantity)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.finalPrice, _this.finalPrice) || other.finalPrice == _this.finalPrice)&&(identical(other.hasDiscount, _this.hasDiscount) || other.hasDiscount == _this.hasDiscount)&&(identical(other.discountAmount, _this.discountAmount) || other.discountAmount == _this.discountAmount)&&(identical(other.discountPercentage, _this.discountPercentage) || other.discountPercentage == _this.discountPercentage)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.category, _this.category) || other.category == _this.category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AdminProductModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.description,const DeepCollectionEquality().hash(_this.images),const DeepCollectionEquality().hash(_this.keywords),_this.price,_this.stock,_this.minPurchaseQuantity,_this.maxPurchaseQuantity,_this.status,_this.createdAt,_this.finalPrice,_this.hasDiscount,_this.discountAmount,_this.discountPercentage,_this.categoryId,_this.category);
}

@override
String toString() {
  final _this = this as AdminProductModel;
  return 'AdminProductModel(id: ${_this.id}, title: ${_this.title}, description: ${_this.description}, images: ${_this.images}, keywords: ${_this.keywords}, price: ${_this.price}, stock: ${_this.stock}, minPurchaseQuantity: ${_this.minPurchaseQuantity}, maxPurchaseQuantity: ${_this.maxPurchaseQuantity}, status: ${_this.status}, createdAt: ${_this.createdAt}, finalPrice: ${_this.finalPrice}, hasDiscount: ${_this.hasDiscount}, discountAmount: ${_this.discountAmount}, discountPercentage: ${_this.discountPercentage}, categoryId: ${_this.categoryId}, category: ${_this.category})';
}


}

/// @nodoc
abstract mixin class $AdminProductModelCopyWith<$Res>  {
  factory $AdminProductModelCopyWith(AdminProductModel value, $Res Function(AdminProductModel) _then) = _$AdminProductModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(fromJson: _anyToString) String title,@JsonKey(fromJson: _anyToString) String description,@JsonKey(fromJson: _imagesFromJson, toJson: _imagesToJson) List<String> images, List<String> keywords,@JsonKey(fromJson: _anyToDouble) double price,@JsonKey(fromJson: _anyToInt) int stock,@JsonKey(name: 'min_purchase_quantity', fromJson: _anyToInt) int minPurchaseQuantity,@JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt) int maxPurchaseQuantity,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'final_price', fromJson: _anyToDouble) double? finalPrice,@JsonKey(name: 'has_discount', fromJson: _anyToBool) bool? hasDiscount,@JsonKey(name: 'discount_amount', fromJson: _anyToDouble) double? discountAmount,@JsonKey(name: 'discount_percentage', fromJson: _anyToDouble) double? discountPercentage,@JsonKey(name: 'category_id', fromJson: _anyToString) String? categoryId, CategoryModel? category
});


$CategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class _$AdminProductModelCopyWithImpl<$Res>
    implements $AdminProductModelCopyWith<$Res> {
  _$AdminProductModelCopyWithImpl(this._self, this._then);

  final AdminProductModel _self;
  final $Res Function(AdminProductModel) _then;

/// Create a copy of AdminProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? description = null,Object? images = null,Object? keywords = null,Object? price = null,Object? stock = null,Object? minPurchaseQuantity = null,Object? maxPurchaseQuantity = null,Object? status = freezed,Object? createdAt = freezed,Object? finalPrice = freezed,Object? hasDiscount = freezed,Object? discountAmount = freezed,Object? discountPercentage = freezed,Object? categoryId = freezed,Object? category = freezed,}) {
  return _then(AdminProductModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,keywords: null == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,minPurchaseQuantity: null == minPurchaseQuantity ? _self.minPurchaseQuantity : minPurchaseQuantity // ignore: cast_nullable_to_non_nullable
as int,maxPurchaseQuantity: null == maxPurchaseQuantity ? _self.maxPurchaseQuantity : maxPurchaseQuantity // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,finalPrice: freezed == finalPrice ? _self.finalPrice : finalPrice // ignore: cast_nullable_to_non_nullable
as double?,hasDiscount: freezed == hasDiscount ? _self.hasDiscount : hasDiscount // ignore: cast_nullable_to_non_nullable
as bool?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double?,discountPercentage: freezed == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,
  ));
}
/// Create a copy of AdminProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [AdminProductModel].
extension AdminProductModelPatterns on AdminProductModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminProductModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminProductModel value)  $default,){
final _that = this;
switch (_that) {
case _AdminProductModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _AdminProductModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(fromJson: _anyToString)  String title, @JsonKey(fromJson: _anyToString)  String description, @JsonKey(fromJson: _imagesFromJson, toJson: _imagesToJson)  List<String> images,  List<String> keywords, @JsonKey(fromJson: _anyToDouble)  double price, @JsonKey(fromJson: _anyToInt)  int stock, @JsonKey(name: 'min_purchase_quantity', fromJson: _anyToInt)  int minPurchaseQuantity, @JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt)  int maxPurchaseQuantity, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'final_price', fromJson: _anyToDouble)  double? finalPrice, @JsonKey(name: 'has_discount', fromJson: _anyToBool)  bool? hasDiscount, @JsonKey(name: 'discount_amount', fromJson: _anyToDouble)  double? discountAmount, @JsonKey(name: 'discount_percentage', fromJson: _anyToDouble)  double? discountPercentage, @JsonKey(name: 'category_id', fromJson: _anyToString)  String? categoryId,  CategoryModel? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminProductModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.images,_that.keywords,_that.price,_that.stock,_that.minPurchaseQuantity,_that.maxPurchaseQuantity,_that.status,_that.createdAt,_that.finalPrice,_that.hasDiscount,_that.discountAmount,_that.discountPercentage,_that.categoryId,_that.category);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(fromJson: _anyToString)  String title, @JsonKey(fromJson: _anyToString)  String description, @JsonKey(fromJson: _imagesFromJson, toJson: _imagesToJson)  List<String> images,  List<String> keywords, @JsonKey(fromJson: _anyToDouble)  double price, @JsonKey(fromJson: _anyToInt)  int stock, @JsonKey(name: 'min_purchase_quantity', fromJson: _anyToInt)  int minPurchaseQuantity, @JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt)  int maxPurchaseQuantity, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'final_price', fromJson: _anyToDouble)  double? finalPrice, @JsonKey(name: 'has_discount', fromJson: _anyToBool)  bool? hasDiscount, @JsonKey(name: 'discount_amount', fromJson: _anyToDouble)  double? discountAmount, @JsonKey(name: 'discount_percentage', fromJson: _anyToDouble)  double? discountPercentage, @JsonKey(name: 'category_id', fromJson: _anyToString)  String? categoryId,  CategoryModel? category)  $default,) {final _that = this;
switch (_that) {
case _AdminProductModel():
return $default(_that.id,_that.title,_that.description,_that.images,_that.keywords,_that.price,_that.stock,_that.minPurchaseQuantity,_that.maxPurchaseQuantity,_that.status,_that.createdAt,_that.finalPrice,_that.hasDiscount,_that.discountAmount,_that.discountPercentage,_that.categoryId,_that.category);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(fromJson: _anyToString)  String title, @JsonKey(fromJson: _anyToString)  String description, @JsonKey(fromJson: _imagesFromJson, toJson: _imagesToJson)  List<String> images,  List<String> keywords, @JsonKey(fromJson: _anyToDouble)  double price, @JsonKey(fromJson: _anyToInt)  int stock, @JsonKey(name: 'min_purchase_quantity', fromJson: _anyToInt)  int minPurchaseQuantity, @JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt)  int maxPurchaseQuantity, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'final_price', fromJson: _anyToDouble)  double? finalPrice, @JsonKey(name: 'has_discount', fromJson: _anyToBool)  bool? hasDiscount, @JsonKey(name: 'discount_amount', fromJson: _anyToDouble)  double? discountAmount, @JsonKey(name: 'discount_percentage', fromJson: _anyToDouble)  double? discountPercentage, @JsonKey(name: 'category_id', fromJson: _anyToString)  String? categoryId,  CategoryModel? category)?  $default,) {final _that = this;
switch (_that) {
case _AdminProductModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.images,_that.keywords,_that.price,_that.stock,_that.minPurchaseQuantity,_that.maxPurchaseQuantity,_that.status,_that.createdAt,_that.finalPrice,_that.hasDiscount,_that.discountAmount,_that.discountPercentage,_that.categoryId,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminProductModel extends AdminProductModel {
  const _AdminProductModel({@JsonKey(fromJson: _anyToString) this.id, @JsonKey(fromJson: _anyToString) this.title = '', @JsonKey(fromJson: _anyToString) this.description = '', @JsonKey(fromJson: _imagesFromJson, toJson: _imagesToJson)  List<String> images = const [],  List<String> keywords = const [], @JsonKey(fromJson: _anyToDouble) this.price = 0.0, @JsonKey(fromJson: _anyToInt) this.stock = 0, @JsonKey(name: 'min_purchase_quantity', fromJson: _anyToInt) this.minPurchaseQuantity = 1, @JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt) this.maxPurchaseQuantity = 0, @JsonKey(fromJson: _anyToString) this.status, @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt, @JsonKey(name: 'final_price', fromJson: _anyToDouble) this.finalPrice, @JsonKey(name: 'has_discount', fromJson: _anyToBool) this.hasDiscount, @JsonKey(name: 'discount_amount', fromJson: _anyToDouble) this.discountAmount, @JsonKey(name: 'discount_percentage', fromJson: _anyToDouble) this.discountPercentage, @JsonKey(name: 'category_id', fromJson: _anyToString) this.categoryId, this.category}): _images = images,_keywords = keywords,super._();
  factory _AdminProductModel.fromJson(Map<String, dynamic> json) => _$AdminProductModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String? id;
@override@JsonKey(fromJson: _anyToString) final  String title;
@override@JsonKey(fromJson: _anyToString) final  String description;
 final  List<String> _images;
@override@JsonKey(fromJson: _imagesFromJson, toJson: _imagesToJson) List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  List<String> _keywords;
@override@JsonKey() List<String> get keywords {
  if (_keywords is EqualUnmodifiableListView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_keywords);
}

@override@JsonKey(fromJson: _anyToDouble) final  double price;
@override@JsonKey(fromJson: _anyToInt) final  int stock;
@override@JsonKey(name: 'min_purchase_quantity', fromJson: _anyToInt) final  int minPurchaseQuantity;
@override@JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt) final  int maxPurchaseQuantity;
@override@JsonKey(fromJson: _anyToString) final  String? status;
@override@JsonKey(name: 'created_at', fromJson: _anyToString) final  String? createdAt;
@override@JsonKey(name: 'final_price', fromJson: _anyToDouble) final  double? finalPrice;
@override@JsonKey(name: 'has_discount', fromJson: _anyToBool) final  bool? hasDiscount;
@override@JsonKey(name: 'discount_amount', fromJson: _anyToDouble) final  double? discountAmount;
@override@JsonKey(name: 'discount_percentage', fromJson: _anyToDouble) final  double? discountPercentage;
@override@JsonKey(name: 'category_id', fromJson: _anyToString) final  String? categoryId;
@override final  CategoryModel? category;

/// Create a copy of AdminProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminProductModelCopyWith<_AdminProductModel> get copyWith => __$AdminProductModelCopyWithImpl<_AdminProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.images, _images)&&const DeepCollectionEquality().equals(other.keywords, _keywords)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.minPurchaseQuantity, minPurchaseQuantity) || other.minPurchaseQuantity == minPurchaseQuantity)&&(identical(other.maxPurchaseQuantity, maxPurchaseQuantity) || other.maxPurchaseQuantity == maxPurchaseQuantity)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.finalPrice, finalPrice) || other.finalPrice == finalPrice)&&(identical(other.hasDiscount, hasDiscount) || other.hasDiscount == hasDiscount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,description,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_keywords),price,stock,minPurchaseQuantity,maxPurchaseQuantity,status,createdAt,finalPrice,hasDiscount,discountAmount,discountPercentage,categoryId,category);
}

@override
String toString() {
    return 'AdminProductModel(id: $id, title: $title, description: $description, images: $images, keywords: $keywords, price: $price, stock: $stock, minPurchaseQuantity: $minPurchaseQuantity, maxPurchaseQuantity: $maxPurchaseQuantity, status: $status, createdAt: $createdAt, finalPrice: $finalPrice, hasDiscount: $hasDiscount, discountAmount: $discountAmount, discountPercentage: $discountPercentage, categoryId: $categoryId, category: $category)';
}


}

/// @nodoc
abstract mixin class _$AdminProductModelCopyWith<$Res> implements $AdminProductModelCopyWith<$Res> {
  factory _$AdminProductModelCopyWith(_AdminProductModel value, $Res Function(_AdminProductModel) _then) = __$AdminProductModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(fromJson: _anyToString) String title,@JsonKey(fromJson: _anyToString) String description,@JsonKey(fromJson: _imagesFromJson, toJson: _imagesToJson) List<String> images, List<String> keywords,@JsonKey(fromJson: _anyToDouble) double price,@JsonKey(fromJson: _anyToInt) int stock,@JsonKey(name: 'min_purchase_quantity', fromJson: _anyToInt) int minPurchaseQuantity,@JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt) int maxPurchaseQuantity,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'final_price', fromJson: _anyToDouble) double? finalPrice,@JsonKey(name: 'has_discount', fromJson: _anyToBool) bool? hasDiscount,@JsonKey(name: 'discount_amount', fromJson: _anyToDouble) double? discountAmount,@JsonKey(name: 'discount_percentage', fromJson: _anyToDouble) double? discountPercentage,@JsonKey(name: 'category_id', fromJson: _anyToString) String? categoryId, CategoryModel? category
});


@override $CategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class __$AdminProductModelCopyWithImpl<$Res>
    implements _$AdminProductModelCopyWith<$Res> {
  __$AdminProductModelCopyWithImpl(this._self, this._then);

  final _AdminProductModel _self;
  final $Res Function(_AdminProductModel) _then;

/// Create a copy of AdminProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? description = null,Object? images = null,Object? keywords = null,Object? price = null,Object? stock = null,Object? minPurchaseQuantity = null,Object? maxPurchaseQuantity = null,Object? status = freezed,Object? createdAt = freezed,Object? finalPrice = freezed,Object? hasDiscount = freezed,Object? discountAmount = freezed,Object? discountPercentage = freezed,Object? categoryId = freezed,Object? category = freezed,}) {
  return _then(_AdminProductModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,keywords: null == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,minPurchaseQuantity: null == minPurchaseQuantity ? _self.minPurchaseQuantity : minPurchaseQuantity // ignore: cast_nullable_to_non_nullable
as int,maxPurchaseQuantity: null == maxPurchaseQuantity ? _self.maxPurchaseQuantity : maxPurchaseQuantity // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,finalPrice: freezed == finalPrice ? _self.finalPrice : finalPrice // ignore: cast_nullable_to_non_nullable
as double?,hasDiscount: freezed == hasDiscount ? _self.hasDiscount : hasDiscount // ignore: cast_nullable_to_non_nullable
as bool?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double?,discountPercentage: freezed == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,
  ));
}

/// Create a copy of AdminProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
