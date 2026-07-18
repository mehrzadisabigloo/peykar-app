// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) {
  return _OrderItemModel.fromJson(json);
}

/// @nodoc
mixin _$OrderItemModel {
  @JsonKey(fromJson: _anyToString)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToInt)
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_price', fromJson: _anyToDouble)
  double get originalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'final_price', fromJson: _anyToDouble)
  double get finalPrice => throw _privateConstructorUsedError;
  ManageProductsModel? get product => throw _privateConstructorUsedError;

  /// Serializes this OrderItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemModelCopyWith<OrderItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemModelCopyWith<$Res> {
  factory $OrderItemModelCopyWith(
    OrderItemModel value,
    $Res Function(OrderItemModel) then,
  ) = _$OrderItemModelCopyWithImpl<$Res, OrderItemModel>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String id,
    @JsonKey(fromJson: _anyToInt) int quantity,
    @JsonKey(name: 'original_price', fromJson: _anyToDouble)
    double originalPrice,
    @JsonKey(name: 'final_price', fromJson: _anyToDouble) double finalPrice,
    ManageProductsModel? product,
  });

  $ManageProductsModelCopyWith<$Res>? get product;
}

/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res, $Val extends OrderItemModel>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? originalPrice = null,
    Object? finalPrice = null,
    Object? product = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            originalPrice: null == originalPrice
                ? _value.originalPrice
                : originalPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            finalPrice: null == finalPrice
                ? _value.finalPrice
                : finalPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            product: freezed == product
                ? _value.product
                : product // ignore: cast_nullable_to_non_nullable
                      as ManageProductsModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ManageProductsModelCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ManageProductsModelCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderItemModelImplCopyWith<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  factory _$$OrderItemModelImplCopyWith(
    _$OrderItemModelImpl value,
    $Res Function(_$OrderItemModelImpl) then,
  ) = __$$OrderItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String id,
    @JsonKey(fromJson: _anyToInt) int quantity,
    @JsonKey(name: 'original_price', fromJson: _anyToDouble)
    double originalPrice,
    @JsonKey(name: 'final_price', fromJson: _anyToDouble) double finalPrice,
    ManageProductsModel? product,
  });

  @override
  $ManageProductsModelCopyWith<$Res>? get product;
}

/// @nodoc
class __$$OrderItemModelImplCopyWithImpl<$Res>
    extends _$OrderItemModelCopyWithImpl<$Res, _$OrderItemModelImpl>
    implements _$$OrderItemModelImplCopyWith<$Res> {
  __$$OrderItemModelImplCopyWithImpl(
    _$OrderItemModelImpl _value,
    $Res Function(_$OrderItemModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? originalPrice = null,
    Object? finalPrice = null,
    Object? product = freezed,
  }) {
    return _then(
      _$OrderItemModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        originalPrice: null == originalPrice
            ? _value.originalPrice
            : originalPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        finalPrice: null == finalPrice
            ? _value.finalPrice
            : finalPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        product: freezed == product
            ? _value.product
            : product // ignore: cast_nullable_to_non_nullable
                  as ManageProductsModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemModelImpl extends _OrderItemModel {
  const _$OrderItemModelImpl({
    @JsonKey(fromJson: _anyToString) this.id = '',
    @JsonKey(fromJson: _anyToInt) this.quantity = 0,
    @JsonKey(name: 'original_price', fromJson: _anyToDouble)
    this.originalPrice = 0.0,
    @JsonKey(name: 'final_price', fromJson: _anyToDouble) this.finalPrice = 0.0,
    this.product,
  }) : super._();

  factory _$OrderItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _anyToString)
  final String id;
  @override
  @JsonKey(fromJson: _anyToInt)
  final int quantity;
  @override
  @JsonKey(name: 'original_price', fromJson: _anyToDouble)
  final double originalPrice;
  @override
  @JsonKey(name: 'final_price', fromJson: _anyToDouble)
  final double finalPrice;
  @override
  final ManageProductsModel? product;

  @override
  String toString() {
    return 'OrderItemModel(id: $id, quantity: $quantity, originalPrice: $originalPrice, finalPrice: $finalPrice, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.originalPrice, originalPrice) ||
                other.originalPrice == originalPrice) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    quantity,
    originalPrice,
    finalPrice,
    product,
  );

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      __$$OrderItemModelImplCopyWithImpl<_$OrderItemModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemModelImplToJson(this);
  }
}

abstract class _OrderItemModel extends OrderItemModel {
  const factory _OrderItemModel({
    @JsonKey(fromJson: _anyToString) final String id,
    @JsonKey(fromJson: _anyToInt) final int quantity,
    @JsonKey(name: 'original_price', fromJson: _anyToDouble)
    final double originalPrice,
    @JsonKey(name: 'final_price', fromJson: _anyToDouble)
    final double finalPrice,
    final ManageProductsModel? product,
  }) = _$OrderItemModelImpl;
  const _OrderItemModel._() : super._();

  factory _OrderItemModel.fromJson(Map<String, dynamic> json) =
      _$OrderItemModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _anyToString)
  String get id;
  @override
  @JsonKey(fromJson: _anyToInt)
  int get quantity;
  @override
  @JsonKey(name: 'original_price', fromJson: _anyToDouble)
  double get originalPrice;
  @override
  @JsonKey(name: 'final_price', fromJson: _anyToDouble)
  double get finalPrice;
  @override
  ManageProductsModel? get product;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
