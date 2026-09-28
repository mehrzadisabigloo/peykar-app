// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItemModel {

@JsonKey(fromJson: _anyToString) String get id;@JsonKey(fromJson: _anyToInt) int get quantity;@JsonKey(name: 'original_price', fromJson: _anyToDouble) double get originalPrice;@JsonKey(name: 'final_price', fromJson: _anyToDouble) double get finalPrice; ManageProductsModel? get product;
/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemModelCopyWith<OrderItemModel> get copyWith => _$OrderItemModelCopyWithImpl<OrderItemModel>(this as OrderItemModel, _$identity);

  /// Serializes this OrderItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderItemModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.originalPrice, _this.originalPrice) || other.originalPrice == _this.originalPrice)&&(identical(other.finalPrice, _this.finalPrice) || other.finalPrice == _this.finalPrice)&&(identical(other.product, _this.product) || other.product == _this.product));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderItemModel;
  return Object.hash(runtimeType,_this.id,_this.quantity,_this.originalPrice,_this.finalPrice,_this.product);
}

@override
String toString() {
  final _this = this as OrderItemModel;
  return 'OrderItemModel(id: ${_this.id}, quantity: ${_this.quantity}, originalPrice: ${_this.originalPrice}, finalPrice: ${_this.finalPrice}, product: ${_this.product})';
}


}

/// @nodoc
abstract mixin class $OrderItemModelCopyWith<$Res>  {
  factory $OrderItemModelCopyWith(OrderItemModel value, $Res Function(OrderItemModel) _then) = _$OrderItemModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(fromJson: _anyToInt) int quantity,@JsonKey(name: 'original_price', fromJson: _anyToDouble) double originalPrice,@JsonKey(name: 'final_price', fromJson: _anyToDouble) double finalPrice, ManageProductsModel? product
});


$ManageProductsModelCopyWith<$Res>? get product;

}
/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._self, this._then);

  final OrderItemModel _self;
  final $Res Function(OrderItemModel) _then;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? quantity = null,Object? originalPrice = null,Object? finalPrice = null,Object? product = freezed,}) {
  return _then(OrderItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,originalPrice: null == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double,finalPrice: null == finalPrice ? _self.finalPrice : finalPrice // ignore: cast_nullable_to_non_nullable
as double,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ManageProductsModel?,
  ));
}
/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManageProductsModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ManageProductsModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderItemModel].
extension OrderItemModelPatterns on OrderItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(fromJson: _anyToInt)  int quantity, @JsonKey(name: 'original_price', fromJson: _anyToDouble)  double originalPrice, @JsonKey(name: 'final_price', fromJson: _anyToDouble)  double finalPrice,  ManageProductsModel? product)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
return $default(_that.id,_that.quantity,_that.originalPrice,_that.finalPrice,_that.product);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(fromJson: _anyToInt)  int quantity, @JsonKey(name: 'original_price', fromJson: _anyToDouble)  double originalPrice, @JsonKey(name: 'final_price', fromJson: _anyToDouble)  double finalPrice,  ManageProductsModel? product)  $default,) {final _that = this;
switch (_that) {
case _OrderItemModel():
return $default(_that.id,_that.quantity,_that.originalPrice,_that.finalPrice,_that.product);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(fromJson: _anyToInt)  int quantity, @JsonKey(name: 'original_price', fromJson: _anyToDouble)  double originalPrice, @JsonKey(name: 'final_price', fromJson: _anyToDouble)  double finalPrice,  ManageProductsModel? product)?  $default,) {final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
return $default(_that.id,_that.quantity,_that.originalPrice,_that.finalPrice,_that.product);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItemModel extends OrderItemModel {
  const _OrderItemModel({@JsonKey(fromJson: _anyToString) this.id = '', @JsonKey(fromJson: _anyToInt) this.quantity = 0, @JsonKey(name: 'original_price', fromJson: _anyToDouble) this.originalPrice = 0.0, @JsonKey(name: 'final_price', fromJson: _anyToDouble) this.finalPrice = 0.0, this.product}): super._();
  factory _OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String id;
@override@JsonKey(fromJson: _anyToInt) final  int quantity;
@override@JsonKey(name: 'original_price', fromJson: _anyToDouble) final  double originalPrice;
@override@JsonKey(name: 'final_price', fromJson: _anyToDouble) final  double finalPrice;
@override final  ManageProductsModel? product;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemModelCopyWith<_OrderItemModel> get copyWith => __$OrderItemModelCopyWithImpl<_OrderItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.finalPrice, finalPrice) || other.finalPrice == finalPrice)&&(identical(other.product, product) || other.product == product));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,quantity,originalPrice,finalPrice,product);
}

@override
String toString() {
    return 'OrderItemModel(id: $id, quantity: $quantity, originalPrice: $originalPrice, finalPrice: $finalPrice, product: $product)';
}


}

/// @nodoc
abstract mixin class _$OrderItemModelCopyWith<$Res> implements $OrderItemModelCopyWith<$Res> {
  factory _$OrderItemModelCopyWith(_OrderItemModel value, $Res Function(_OrderItemModel) _then) = __$OrderItemModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(fromJson: _anyToInt) int quantity,@JsonKey(name: 'original_price', fromJson: _anyToDouble) double originalPrice,@JsonKey(name: 'final_price', fromJson: _anyToDouble) double finalPrice, ManageProductsModel? product
});


@override $ManageProductsModelCopyWith<$Res>? get product;

}
/// @nodoc
class __$OrderItemModelCopyWithImpl<$Res>
    implements _$OrderItemModelCopyWith<$Res> {
  __$OrderItemModelCopyWithImpl(this._self, this._then);

  final _OrderItemModel _self;
  final $Res Function(_OrderItemModel) _then;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? quantity = null,Object? originalPrice = null,Object? finalPrice = null,Object? product = freezed,}) {
  return _then(_OrderItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,originalPrice: null == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double,finalPrice: null == finalPrice ? _self.finalPrice : finalPrice // ignore: cast_nullable_to_non_nullable
as double,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ManageProductsModel?,
  ));
}

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManageProductsModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ManageProductsModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

// dart format on
