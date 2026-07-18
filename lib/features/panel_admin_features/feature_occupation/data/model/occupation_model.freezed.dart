// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'occupation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OccupationModel _$OccupationModelFromJson(Map<String, dynamic> json) {
  return _OccupationModel.fromJson(json);
}

/// @nodoc
mixin _$OccupationModel {
  @JsonKey(fromJson: _anyToString)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order', fromJson: _anyToInt)
  int? get sortOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this OccupationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OccupationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OccupationModelCopyWith<OccupationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OccupationModelCopyWith<$Res> {
  factory $OccupationModelCopyWith(
    OccupationModel value,
    $Res Function(OccupationModel) then,
  ) = _$OccupationModelCopyWithImpl<$Res, OccupationModel>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(fromJson: _anyToString) String? title,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'sort_order', fromJson: _anyToInt) int? sortOrder,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
  });
}

/// @nodoc
class _$OccupationModelCopyWithImpl<$Res, $Val extends OccupationModel>
    implements $OccupationModelCopyWith<$Res> {
  _$OccupationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OccupationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? status = freezed,
    Object? sortOrder = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            sortOrder: freezed == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int?,
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
abstract class _$$OccupationModelImplCopyWith<$Res>
    implements $OccupationModelCopyWith<$Res> {
  factory _$$OccupationModelImplCopyWith(
    _$OccupationModelImpl value,
    $Res Function(_$OccupationModelImpl) then,
  ) = __$$OccupationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String? id,
    @JsonKey(fromJson: _anyToString) String? title,
    @JsonKey(fromJson: _anyToString) String? status,
    @JsonKey(name: 'sort_order', fromJson: _anyToInt) int? sortOrder,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
  });
}

/// @nodoc
class __$$OccupationModelImplCopyWithImpl<$Res>
    extends _$OccupationModelCopyWithImpl<$Res, _$OccupationModelImpl>
    implements _$$OccupationModelImplCopyWith<$Res> {
  __$$OccupationModelImplCopyWithImpl(
    _$OccupationModelImpl _value,
    $Res Function(_$OccupationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OccupationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? status = freezed,
    Object? sortOrder = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$OccupationModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        sortOrder: freezed == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int?,
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
class _$OccupationModelImpl extends _OccupationModel {
  const _$OccupationModelImpl({
    @JsonKey(fromJson: _anyToString) this.id,
    @JsonKey(fromJson: _anyToString) this.title,
    @JsonKey(fromJson: _anyToString) this.status,
    @JsonKey(name: 'sort_order', fromJson: _anyToInt) this.sortOrder,
    @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt,
  }) : super._();

  factory _$OccupationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OccupationModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _anyToString)
  final String? id;
  @override
  @JsonKey(fromJson: _anyToString)
  final String? title;
  @override
  @JsonKey(fromJson: _anyToString)
  final String? status;
  @override
  @JsonKey(name: 'sort_order', fromJson: _anyToInt)
  final int? sortOrder;
  @override
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  final String? updatedAt;

  @override
  String toString() {
    return 'OccupationModel(id: $id, title: $title, status: $status, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OccupationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    status,
    sortOrder,
    createdAt,
    updatedAt,
  );

  /// Create a copy of OccupationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OccupationModelImplCopyWith<_$OccupationModelImpl> get copyWith =>
      __$$OccupationModelImplCopyWithImpl<_$OccupationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OccupationModelImplToJson(this);
  }
}

abstract class _OccupationModel extends OccupationModel {
  const factory _OccupationModel({
    @JsonKey(fromJson: _anyToString) final String? id,
    @JsonKey(fromJson: _anyToString) final String? title,
    @JsonKey(fromJson: _anyToString) final String? status,
    @JsonKey(name: 'sort_order', fromJson: _anyToInt) final int? sortOrder,
    @JsonKey(name: 'created_at', fromJson: _anyToString)
    final String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString)
    final String? updatedAt,
  }) = _$OccupationModelImpl;
  const _OccupationModel._() : super._();

  factory _OccupationModel.fromJson(Map<String, dynamic> json) =
      _$OccupationModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _anyToString)
  String? get id;
  @override
  @JsonKey(fromJson: _anyToString)
  String? get title;
  @override
  @JsonKey(fromJson: _anyToString)
  String? get status;
  @override
  @JsonKey(name: 'sort_order', fromJson: _anyToInt)
  int? get sortOrder;
  @override
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  String? get updatedAt;

  /// Create a copy of OccupationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OccupationModelImplCopyWith<_$OccupationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
