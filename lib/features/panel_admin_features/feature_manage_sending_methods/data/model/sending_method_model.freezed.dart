// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sending_method_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SendingMethodModel _$SendingMethodModelFromJson(Map<String, dynamic> json) {
  return _SendingMethodModel.fromJson(json);
}

/// @nodoc
mixin _$SendingMethodModel {
  @JsonKey(fromJson: _anyToString)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToInt)
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'locations_count', fromJson: _anyToInt)
  int? get locationsCount => throw _privateConstructorUsedError;
  List<SendingMethodLocationModel>? get locations =>
      throw _privateConstructorUsedError;

  /// Serializes this SendingMethodModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendingMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendingMethodModelCopyWith<SendingMethodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendingMethodModelCopyWith<$Res> {
  factory $SendingMethodModelCopyWith(
    SendingMethodModel value,
    $Res Function(SendingMethodModel) then,
  ) = _$SendingMethodModelCopyWithImpl<$Res, SendingMethodModel>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(fromJson: _anyToString) String? title,
    @JsonKey(fromJson: _anyToInt) int? price,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
    @JsonKey(name: 'locations_count', fromJson: _anyToInt) int? locationsCount,
    List<SendingMethodLocationModel>? locations,
  });
}

/// @nodoc
class _$SendingMethodModelCopyWithImpl<$Res, $Val extends SendingMethodModel>
    implements $SendingMethodModelCopyWith<$Res> {
  _$SendingMethodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendingMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? price = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? locationsCount = freezed,
    Object? locations = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            price: freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as int?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            locationsCount: freezed == locationsCount
                ? _value.locationsCount
                : locationsCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            locations: freezed == locations
                ? _value.locations
                : locations // ignore: cast_nullable_to_non_nullable
                      as List<SendingMethodLocationModel>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SendingMethodModelImplCopyWith<$Res>
    implements $SendingMethodModelCopyWith<$Res> {
  factory _$$SendingMethodModelImplCopyWith(
    _$SendingMethodModelImpl value,
    $Res Function(_$SendingMethodModelImpl) then,
  ) = __$$SendingMethodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(fromJson: _anyToString) String? title,
    @JsonKey(fromJson: _anyToInt) int? price,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
    @JsonKey(name: 'locations_count', fromJson: _anyToInt) int? locationsCount,
    List<SendingMethodLocationModel>? locations,
  });
}

/// @nodoc
class __$$SendingMethodModelImplCopyWithImpl<$Res>
    extends _$SendingMethodModelCopyWithImpl<$Res, _$SendingMethodModelImpl>
    implements _$$SendingMethodModelImplCopyWith<$Res> {
  __$$SendingMethodModelImplCopyWithImpl(
    _$SendingMethodModelImpl _value,
    $Res Function(_$SendingMethodModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SendingMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? price = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? locationsCount = freezed,
    Object? locations = freezed,
  }) {
    return _then(
      _$SendingMethodModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        price: freezed == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as int?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationsCount: freezed == locationsCount
            ? _value.locationsCount
            : locationsCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        locations: freezed == locations
            ? _value._locations
            : locations // ignore: cast_nullable_to_non_nullable
                  as List<SendingMethodLocationModel>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SendingMethodModelImpl extends _SendingMethodModel {
  const _$SendingMethodModelImpl({
    @JsonKey(fromJson: _anyToString) this.id,
    @JsonKey(fromJson: _anyToString) this.title,
    @JsonKey(fromJson: _anyToInt) this.price,
    @JsonKey(fromJson: _anyToString) this.status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt,
    @JsonKey(name: 'locations_count', fromJson: _anyToInt) this.locationsCount,
    final List<SendingMethodLocationModel>? locations,
  }) : _locations = locations,
       super._();

  factory _$SendingMethodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendingMethodModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _anyToString)
  final String? id;
  @override
  @JsonKey(fromJson: _anyToString)
  final String? title;
  @override
  @JsonKey(fromJson: _anyToInt)
  final int? price;
  @override
  @JsonKey(fromJson: _anyToString)
  final String? status;
  @override
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  final String? updatedAt;
  @override
  @JsonKey(name: 'locations_count', fromJson: _anyToInt)
  final int? locationsCount;
  final List<SendingMethodLocationModel>? _locations;
  @override
  List<SendingMethodLocationModel>? get locations {
    final value = _locations;
    if (value == null) return null;
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SendingMethodModel(id: $id, title: $title, price: $price, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, locationsCount: $locationsCount, locations: $locations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendingMethodModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.locationsCount, locationsCount) ||
                other.locationsCount == locationsCount) &&
            const DeepCollectionEquality().equals(
              other._locations,
              _locations,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    price,
    status,
    createdAt,
    updatedAt,
    locationsCount,
    const DeepCollectionEquality().hash(_locations),
  );

  /// Create a copy of SendingMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendingMethodModelImplCopyWith<_$SendingMethodModelImpl> get copyWith =>
      __$$SendingMethodModelImplCopyWithImpl<_$SendingMethodModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SendingMethodModelImplToJson(this);
  }
}

abstract class _SendingMethodModel extends SendingMethodModel {
  const factory _SendingMethodModel({
    @JsonKey(fromJson: _anyToString) final String? id,
    @JsonKey(fromJson: _anyToString) final String? title,
    @JsonKey(fromJson: _anyToInt) final int? price,
    @JsonKey(fromJson: _anyToString) final String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString)
    final String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString)
    final String? updatedAt,
    @JsonKey(name: 'locations_count', fromJson: _anyToInt)
    final int? locationsCount,
    final List<SendingMethodLocationModel>? locations,
  }) = _$SendingMethodModelImpl;
  const _SendingMethodModel._() : super._();

  factory _SendingMethodModel.fromJson(Map<String, dynamic> json) =
      _$SendingMethodModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _anyToString)
  String? get id;
  @override
  @JsonKey(fromJson: _anyToString)
  String? get title;
  @override
  @JsonKey(fromJson: _anyToInt)
  int? get price;
  @override
  @JsonKey(fromJson: _anyToString)
  String? get status;
  @override
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  String? get updatedAt;
  @override
  @JsonKey(name: 'locations_count', fromJson: _anyToInt)
  int? get locationsCount;
  @override
  List<SendingMethodLocationModel>? get locations;

  /// Create a copy of SendingMethodModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendingMethodModelImplCopyWith<_$SendingMethodModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SendingMethodLocationModel _$SendingMethodLocationModelFromJson(
  Map<String, dynamic> json,
) {
  return _SendingMethodLocationModel.fromJson(json);
}

/// @nodoc
mixin _$SendingMethodLocationModel {
  @JsonKey(fromJson: _anyToString)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  set id(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'sending_method_id', fromJson: _anyToString)
  String? get sendingMethodId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sending_method_id', fromJson: _anyToString)
  set sendingMethodId(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'ostan_id', fromJson: _anyToInt)
  int? get ostanId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ostan_id', fromJson: _anyToInt)
  set ostanId(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt)
  int? get shahrestanId => throw _privateConstructorUsedError;
  @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt)
  set shahrestanId(int? value) => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToInt)
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToInt)
  set price(int? value) => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  set status(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  set createdAt(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  set updatedAt(String? value) => throw _privateConstructorUsedError;

  /// Serializes this SendingMethodLocationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendingMethodLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendingMethodLocationModelCopyWith<SendingMethodLocationModel>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendingMethodLocationModelCopyWith<$Res> {
  factory $SendingMethodLocationModelCopyWith(
    SendingMethodLocationModel value,
    $Res Function(SendingMethodLocationModel) then,
  ) =
      _$SendingMethodLocationModelCopyWithImpl<
        $Res,
        SendingMethodLocationModel
      >;
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(name: 'sending_method_id', fromJson: _anyToString)
    String? sendingMethodId,
    @JsonKey(name: 'ostan_id', fromJson: _anyToInt) int? ostanId,
    @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) int? shahrestanId,
    @JsonKey(fromJson: _anyToInt) int? price,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
  });
}

/// @nodoc
class _$SendingMethodLocationModelCopyWithImpl<
  $Res,
  $Val extends SendingMethodLocationModel
>
    implements $SendingMethodLocationModelCopyWith<$Res> {
  _$SendingMethodLocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendingMethodLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sendingMethodId = freezed,
    Object? ostanId = freezed,
    Object? shahrestanId = freezed,
    Object? price = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            sendingMethodId: freezed == sendingMethodId
                ? _value.sendingMethodId
                : sendingMethodId // ignore: cast_nullable_to_non_nullable
                      as String?,
            ostanId: freezed == ostanId
                ? _value.ostanId
                : ostanId // ignore: cast_nullable_to_non_nullable
                      as int?,
            shahrestanId: freezed == shahrestanId
                ? _value.shahrestanId
                : shahrestanId // ignore: cast_nullable_to_non_nullable
                      as int?,
            price: freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as int?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SendingMethodLocationModelImplCopyWith<$Res>
    implements $SendingMethodLocationModelCopyWith<$Res> {
  factory _$$SendingMethodLocationModelImplCopyWith(
    _$SendingMethodLocationModelImpl value,
    $Res Function(_$SendingMethodLocationModelImpl) then,
  ) = __$$SendingMethodLocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(name: 'sending_method_id', fromJson: _anyToString)
    String? sendingMethodId,
    @JsonKey(name: 'ostan_id', fromJson: _anyToInt) int? ostanId,
    @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) int? shahrestanId,
    @JsonKey(fromJson: _anyToInt) int? price,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
  });
}

/// @nodoc
class __$$SendingMethodLocationModelImplCopyWithImpl<$Res>
    extends
        _$SendingMethodLocationModelCopyWithImpl<
          $Res,
          _$SendingMethodLocationModelImpl
        >
    implements _$$SendingMethodLocationModelImplCopyWith<$Res> {
  __$$SendingMethodLocationModelImplCopyWithImpl(
    _$SendingMethodLocationModelImpl _value,
    $Res Function(_$SendingMethodLocationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SendingMethodLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sendingMethodId = freezed,
    Object? ostanId = freezed,
    Object? shahrestanId = freezed,
    Object? price = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$SendingMethodLocationModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        sendingMethodId: freezed == sendingMethodId
            ? _value.sendingMethodId
            : sendingMethodId // ignore: cast_nullable_to_non_nullable
                  as String?,
        ostanId: freezed == ostanId
            ? _value.ostanId
            : ostanId // ignore: cast_nullable_to_non_nullable
                  as int?,
        shahrestanId: freezed == shahrestanId
            ? _value.shahrestanId
            : shahrestanId // ignore: cast_nullable_to_non_nullable
                  as int?,
        price: freezed == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as int?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SendingMethodLocationModelImpl extends _SendingMethodLocationModel {
  _$SendingMethodLocationModelImpl({
    @JsonKey(fromJson: _anyToString) this.id,
    @JsonKey(name: 'sending_method_id', fromJson: _anyToString)
    this.sendingMethodId,
    @JsonKey(name: 'ostan_id', fromJson: _anyToInt) this.ostanId,
    @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) this.shahrestanId,
    @JsonKey(fromJson: _anyToInt) this.price,
    @JsonKey(fromJson: _anyToString) this.status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt,
  }) : super._();

  factory _$SendingMethodLocationModelImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$SendingMethodLocationModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _anyToString)
  String? id;
  @override
  @JsonKey(name: 'sending_method_id', fromJson: _anyToString)
  String? sendingMethodId;
  @override
  @JsonKey(name: 'ostan_id', fromJson: _anyToInt)
  int? ostanId;
  @override
  @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt)
  int? shahrestanId;
  @override
  @JsonKey(fromJson: _anyToInt)
  int? price;
  @override
  @JsonKey(fromJson: _anyToString)
  String? status;
  @override
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  String? createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  String? updatedAt;

  @override
  String toString() {
    return 'SendingMethodLocationModel(id: $id, sendingMethodId: $sendingMethodId, ostanId: $ostanId, shahrestanId: $shahrestanId, price: $price, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  /// Create a copy of SendingMethodLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendingMethodLocationModelImplCopyWith<_$SendingMethodLocationModelImpl>
  get copyWith =>
      __$$SendingMethodLocationModelImplCopyWithImpl<
        _$SendingMethodLocationModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendingMethodLocationModelImplToJson(this);
  }
}

abstract class _SendingMethodLocationModel extends SendingMethodLocationModel {
  factory _SendingMethodLocationModel({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(name: 'sending_method_id', fromJson: _anyToString)
    String? sendingMethodId,
    @JsonKey(name: 'ostan_id', fromJson: _anyToInt) int? ostanId,
    @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) int? shahrestanId,
    @JsonKey(fromJson: _anyToInt) int? price,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
  }) = _$SendingMethodLocationModelImpl;
  _SendingMethodLocationModel._() : super._();

  factory _SendingMethodLocationModel.fromJson(Map<String, dynamic> json) =
      _$SendingMethodLocationModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _anyToString)
  String? get id;
  @JsonKey(fromJson: _anyToString)
  set id(String? value);
  @override
  @JsonKey(name: 'sending_method_id', fromJson: _anyToString)
  String? get sendingMethodId;
  @JsonKey(name: 'sending_method_id', fromJson: _anyToString)
  set sendingMethodId(String? value);
  @override
  @JsonKey(name: 'ostan_id', fromJson: _anyToInt)
  int? get ostanId;
  @JsonKey(name: 'ostan_id', fromJson: _anyToInt)
  set ostanId(int? value);
  @override
  @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt)
  int? get shahrestanId;
  @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt)
  set shahrestanId(int? value);
  @override
  @JsonKey(fromJson: _anyToInt)
  int? get price;
  @JsonKey(fromJson: _anyToInt)
  set price(int? value);
  @override
  @JsonKey(fromJson: _anyToString)
  String? get status;
  @JsonKey(fromJson: _anyToString)
  set status(String? value);
  @override
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  String? get createdAt;
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  set createdAt(String? value);
  @override
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  String? get updatedAt;
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  set updatedAt(String? value);

  /// Create a copy of SendingMethodLocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendingMethodLocationModelImplCopyWith<_$SendingMethodLocationModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
