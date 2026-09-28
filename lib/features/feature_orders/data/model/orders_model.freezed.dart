// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrdersModel {

@JsonKey(fromJson: _anyToString) String get id;@JsonKey(name: 'order_number', fromJson: _anyToString) String get orderNumber;@JsonKey(name: 'payable_amount', fromJson: _anyToString) String get price;@JsonKey(name: 'transaction_at', fromJson: _formatDate) String get date;@JsonKey(name: 'order_status', fromJson: _mapStatus) OrderStatus get status;@JsonKey(name: 'order_status_label', fromJson: _anyToString) String get statusLabel; List<OrderItemModel> get items;
/// Create a copy of OrdersModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersModelCopyWith<OrdersModel> get copyWith => _$OrdersModelCopyWithImpl<OrdersModel>(this as OrdersModel, _$identity);

  /// Serializes this OrdersModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrdersModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.orderNumber, _this.orderNumber) || other.orderNumber == _this.orderNumber)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.statusLabel, _this.statusLabel) || other.statusLabel == _this.statusLabel)&&const DeepCollectionEquality().equals(other.items, _this.items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrdersModel;
  return Object.hash(runtimeType,_this.id,_this.orderNumber,_this.price,_this.date,_this.status,_this.statusLabel,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as OrdersModel;
  return 'OrdersModel(id: ${_this.id}, orderNumber: ${_this.orderNumber}, price: ${_this.price}, date: ${_this.date}, status: ${_this.status}, statusLabel: ${_this.statusLabel}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $OrdersModelCopyWith<$Res>  {
  factory $OrdersModelCopyWith(OrdersModel value, $Res Function(OrdersModel) _then) = _$OrdersModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(name: 'order_number', fromJson: _anyToString) String orderNumber,@JsonKey(name: 'payable_amount', fromJson: _anyToString) String price,@JsonKey(name: 'transaction_at', fromJson: _formatDate) String date,@JsonKey(name: 'order_status', fromJson: _mapStatus) OrderStatus status,@JsonKey(name: 'order_status_label', fromJson: _anyToString) String statusLabel, List<OrderItemModel> items
});




}
/// @nodoc
class _$OrdersModelCopyWithImpl<$Res>
    implements $OrdersModelCopyWith<$Res> {
  _$OrdersModelCopyWithImpl(this._self, this._then);

  final OrdersModel _self;
  final $Res Function(OrdersModel) _then;

/// Create a copy of OrdersModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderNumber = null,Object? price = null,Object? date = null,Object? status = null,Object? statusLabel = null,Object? items = null,}) {
  return _then(OrdersModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrdersModel].
extension OrdersModelPatterns on OrdersModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrdersModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrdersModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrdersModel value)  $default,){
final _that = this;
switch (_that) {
case _OrdersModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrdersModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrdersModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'order_number', fromJson: _anyToString)  String orderNumber, @JsonKey(name: 'payable_amount', fromJson: _anyToString)  String price, @JsonKey(name: 'transaction_at', fromJson: _formatDate)  String date, @JsonKey(name: 'order_status', fromJson: _mapStatus)  OrderStatus status, @JsonKey(name: 'order_status_label', fromJson: _anyToString)  String statusLabel,  List<OrderItemModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrdersModel() when $default != null:
return $default(_that.id,_that.orderNumber,_that.price,_that.date,_that.status,_that.statusLabel,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'order_number', fromJson: _anyToString)  String orderNumber, @JsonKey(name: 'payable_amount', fromJson: _anyToString)  String price, @JsonKey(name: 'transaction_at', fromJson: _formatDate)  String date, @JsonKey(name: 'order_status', fromJson: _mapStatus)  OrderStatus status, @JsonKey(name: 'order_status_label', fromJson: _anyToString)  String statusLabel,  List<OrderItemModel> items)  $default,) {final _that = this;
switch (_that) {
case _OrdersModel():
return $default(_that.id,_that.orderNumber,_that.price,_that.date,_that.status,_that.statusLabel,_that.items);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'order_number', fromJson: _anyToString)  String orderNumber, @JsonKey(name: 'payable_amount', fromJson: _anyToString)  String price, @JsonKey(name: 'transaction_at', fromJson: _formatDate)  String date, @JsonKey(name: 'order_status', fromJson: _mapStatus)  OrderStatus status, @JsonKey(name: 'order_status_label', fromJson: _anyToString)  String statusLabel,  List<OrderItemModel> items)?  $default,) {final _that = this;
switch (_that) {
case _OrdersModel() when $default != null:
return $default(_that.id,_that.orderNumber,_that.price,_that.date,_that.status,_that.statusLabel,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrdersModel extends OrdersModel {
  const _OrdersModel({@JsonKey(fromJson: _anyToString) this.id = '', @JsonKey(name: 'order_number', fromJson: _anyToString) this.orderNumber = '', @JsonKey(name: 'payable_amount', fromJson: _anyToString) this.price = '0', @JsonKey(name: 'transaction_at', fromJson: _formatDate) this.date = '', @JsonKey(name: 'order_status', fromJson: _mapStatus) this.status = OrderStatus.inProgress, @JsonKey(name: 'order_status_label', fromJson: _anyToString) this.statusLabel = '',  List<OrderItemModel> items = const []}): _items = items,super._();
  factory _OrdersModel.fromJson(Map<String, dynamic> json) => _$OrdersModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String id;
@override@JsonKey(name: 'order_number', fromJson: _anyToString) final  String orderNumber;
@override@JsonKey(name: 'payable_amount', fromJson: _anyToString) final  String price;
@override@JsonKey(name: 'transaction_at', fromJson: _formatDate) final  String date;
@override@JsonKey(name: 'order_status', fromJson: _mapStatus) final  OrderStatus status;
@override@JsonKey(name: 'order_status_label', fromJson: _anyToString) final  String statusLabel;
 final  List<OrderItemModel> _items;
@override@JsonKey() List<OrderItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of OrdersModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrdersModelCopyWith<_OrdersModel> get copyWith => __$OrdersModelCopyWithImpl<_OrdersModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrdersModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrdersModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.price, price) || other.price == price)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&const DeepCollectionEquality().equals(other.items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,orderNumber,price,date,status,statusLabel,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'OrdersModel(id: $id, orderNumber: $orderNumber, price: $price, date: $date, status: $status, statusLabel: $statusLabel, items: $items)';
}


}

/// @nodoc
abstract mixin class _$OrdersModelCopyWith<$Res> implements $OrdersModelCopyWith<$Res> {
  factory _$OrdersModelCopyWith(_OrdersModel value, $Res Function(_OrdersModel) _then) = __$OrdersModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(name: 'order_number', fromJson: _anyToString) String orderNumber,@JsonKey(name: 'payable_amount', fromJson: _anyToString) String price,@JsonKey(name: 'transaction_at', fromJson: _formatDate) String date,@JsonKey(name: 'order_status', fromJson: _mapStatus) OrderStatus status,@JsonKey(name: 'order_status_label', fromJson: _anyToString) String statusLabel, List<OrderItemModel> items
});




}
/// @nodoc
class __$OrdersModelCopyWithImpl<$Res>
    implements _$OrdersModelCopyWith<$Res> {
  __$OrdersModelCopyWithImpl(this._self, this._then);

  final _OrdersModel _self;
  final $Res Function(_OrdersModel) _then;

/// Create a copy of OrdersModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderNumber = null,Object? price = null,Object? date = null,Object? status = null,Object? statusLabel = null,Object? items = null,}) {
  return _then(_OrdersModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderNumber: null == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemModel>,
  ));
}


}

// dart format on
