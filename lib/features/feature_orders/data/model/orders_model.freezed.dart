// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) {
  return _OrdersModel.fromJson(json);
}

/// @nodoc
mixin _$OrdersModel {
  @JsonKey(fromJson: _anyToString)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_number', fromJson: _anyToString)
  String get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'payable_amount', fromJson: _anyToString)
  String get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_at', fromJson: _formatDate)
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_status', fromJson: _mapStatus)
  OrderStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_status_label', fromJson: _anyToString)
  String get statusLabel => throw _privateConstructorUsedError;
  List<OrderItemModel> get items => throw _privateConstructorUsedError;

  /// Serializes this OrdersModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrdersModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrdersModelCopyWith<OrdersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersModelCopyWith<$Res> {
  factory $OrdersModelCopyWith(
    OrdersModel value,
    $Res Function(OrdersModel) then,
  ) = _$OrdersModelCopyWithImpl<$Res, OrdersModel>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String id,
    @JsonKey(name: 'order_number', fromJson: _anyToString) String orderNumber,
    @JsonKey(name: 'payable_amount', fromJson: _anyToString) String price,
    @JsonKey(name: 'transaction_at', fromJson: _formatDate) String date,
    @JsonKey(name: 'order_status', fromJson: _mapStatus) OrderStatus status,
    @JsonKey(name: 'order_status_label', fromJson: _anyToString)
    String statusLabel,
    List<OrderItemModel> items,
  });
}

/// @nodoc
class _$OrdersModelCopyWithImpl<$Res, $Val extends OrdersModel>
    implements $OrdersModelCopyWith<$Res> {
  _$OrdersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrdersModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? price = null,
    Object? date = null,
    Object? status = null,
    Object? statusLabel = null,
    Object? items = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            orderNumber: null == orderNumber
                ? _value.orderNumber
                : orderNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as OrderStatus,
            statusLabel: null == statusLabel
                ? _value.statusLabel
                : statusLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<OrderItemModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrdersModelImplCopyWith<$Res>
    implements $OrdersModelCopyWith<$Res> {
  factory _$$OrdersModelImplCopyWith(
    _$OrdersModelImpl value,
    $Res Function(_$OrdersModelImpl) then,
  ) = __$$OrdersModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String id,
    @JsonKey(name: 'order_number', fromJson: _anyToString) String orderNumber,
    @JsonKey(name: 'payable_amount', fromJson: _anyToString) String price,
    @JsonKey(name: 'transaction_at', fromJson: _formatDate) String date,
    @JsonKey(name: 'order_status', fromJson: _mapStatus) OrderStatus status,
    @JsonKey(name: 'order_status_label', fromJson: _anyToString)
    String statusLabel,
    List<OrderItemModel> items,
  });
}

/// @nodoc
class __$$OrdersModelImplCopyWithImpl<$Res>
    extends _$OrdersModelCopyWithImpl<$Res, _$OrdersModelImpl>
    implements _$$OrdersModelImplCopyWith<$Res> {
  __$$OrdersModelImplCopyWithImpl(
    _$OrdersModelImpl _value,
    $Res Function(_$OrdersModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrdersModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderNumber = null,
    Object? price = null,
    Object? date = null,
    Object? status = null,
    Object? statusLabel = null,
    Object? items = null,
  }) {
    return _then(
      _$OrdersModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        orderNumber: null == orderNumber
            ? _value.orderNumber
            : orderNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as OrderStatus,
        statusLabel: null == statusLabel
            ? _value.statusLabel
            : statusLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<OrderItemModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrdersModelImpl extends _OrdersModel {
  const _$OrdersModelImpl({
    @JsonKey(fromJson: _anyToString) this.id = '',
    @JsonKey(name: 'order_number', fromJson: _anyToString)
    this.orderNumber = '',
    @JsonKey(name: 'payable_amount', fromJson: _anyToString) this.price = '0',
    @JsonKey(name: 'transaction_at', fromJson: _formatDate) this.date = '',
    @JsonKey(name: 'order_status', fromJson: _mapStatus)
    this.status = OrderStatus.inProgress,
    @JsonKey(name: 'order_status_label', fromJson: _anyToString)
    this.statusLabel = '',
    final List<OrderItemModel> items = const [],
  }) : _items = items,
       super._();

  factory _$OrdersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrdersModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _anyToString)
  final String id;
  @override
  @JsonKey(name: 'order_number', fromJson: _anyToString)
  final String orderNumber;
  @override
  @JsonKey(name: 'payable_amount', fromJson: _anyToString)
  final String price;
  @override
  @JsonKey(name: 'transaction_at', fromJson: _formatDate)
  final String date;
  @override
  @JsonKey(name: 'order_status', fromJson: _mapStatus)
  final OrderStatus status;
  @override
  @JsonKey(name: 'order_status_label', fromJson: _anyToString)
  final String statusLabel;
  final List<OrderItemModel> _items;
  @override
  @JsonKey()
  List<OrderItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'OrdersModel(id: $id, orderNumber: $orderNumber, price: $price, date: $date, status: $status, statusLabel: $statusLabel, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusLabel, statusLabel) ||
                other.statusLabel == statusLabel) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    orderNumber,
    price,
    date,
    status,
    statusLabel,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of OrdersModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersModelImplCopyWith<_$OrdersModelImpl> get copyWith =>
      __$$OrdersModelImplCopyWithImpl<_$OrdersModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrdersModelImplToJson(this);
  }
}

abstract class _OrdersModel extends OrdersModel {
  const factory _OrdersModel({
    @JsonKey(fromJson: _anyToString) final String id,
    @JsonKey(name: 'order_number', fromJson: _anyToString)
    final String orderNumber,
    @JsonKey(name: 'payable_amount', fromJson: _anyToString) final String price,
    @JsonKey(name: 'transaction_at', fromJson: _formatDate) final String date,
    @JsonKey(name: 'order_status', fromJson: _mapStatus)
    final OrderStatus status,
    @JsonKey(name: 'order_status_label', fromJson: _anyToString)
    final String statusLabel,
    final List<OrderItemModel> items,
  }) = _$OrdersModelImpl;
  const _OrdersModel._() : super._();

  factory _OrdersModel.fromJson(Map<String, dynamic> json) =
      _$OrdersModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _anyToString)
  String get id;
  @override
  @JsonKey(name: 'order_number', fromJson: _anyToString)
  String get orderNumber;
  @override
  @JsonKey(name: 'payable_amount', fromJson: _anyToString)
  String get price;
  @override
  @JsonKey(name: 'transaction_at', fromJson: _formatDate)
  String get date;
  @override
  @JsonKey(name: 'order_status', fromJson: _mapStatus)
  OrderStatus get status;
  @override
  @JsonKey(name: 'order_status_label', fromJson: _anyToString)
  String get statusLabel;
  @override
  List<OrderItemModel> get items;

  /// Create a copy of OrdersModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrdersModelImplCopyWith<_$OrdersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
