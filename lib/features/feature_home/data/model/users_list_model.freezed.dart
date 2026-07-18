// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UsersListModel _$UsersListModelFromJson(Map<String, dynamic> json) {
  return _UsersListModel.fromJson(json);
}

/// @nodoc
mixin _$UsersListModel {
  List<UserModel> get users => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page', fromJson: _anyToInt)
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page', fromJson: _anyToInt)
  int get lastPage => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToInt)
  int get total => throw _privateConstructorUsedError;

  /// Serializes this UsersListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UsersListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsersListModelCopyWith<UsersListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersListModelCopyWith<$Res> {
  factory $UsersListModelCopyWith(
    UsersListModel value,
    $Res Function(UsersListModel) then,
  ) = _$UsersListModelCopyWithImpl<$Res, UsersListModel>;
  @useResult
  $Res call({
    List<UserModel> users,
    @JsonKey(name: 'current_page', fromJson: _anyToInt) int currentPage,
    @JsonKey(name: 'last_page', fromJson: _anyToInt) int lastPage,
    @JsonKey(fromJson: _anyToInt) int total,
  });
}

/// @nodoc
class _$UsersListModelCopyWithImpl<$Res, $Val extends UsersListModel>
    implements $UsersListModelCopyWith<$Res> {
  _$UsersListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsersListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? currentPage = null,
    Object? lastPage = null,
    Object? total = null,
  }) {
    return _then(
      _value.copyWith(
            users: null == users
                ? _value.users
                : users // ignore: cast_nullable_to_non_nullable
                      as List<UserModel>,
            currentPage: null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int,
            lastPage: null == lastPage
                ? _value.lastPage
                : lastPage // ignore: cast_nullable_to_non_nullable
                      as int,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UsersListModelImplCopyWith<$Res>
    implements $UsersListModelCopyWith<$Res> {
  factory _$$UsersListModelImplCopyWith(
    _$UsersListModelImpl value,
    $Res Function(_$UsersListModelImpl) then,
  ) = __$$UsersListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<UserModel> users,
    @JsonKey(name: 'current_page', fromJson: _anyToInt) int currentPage,
    @JsonKey(name: 'last_page', fromJson: _anyToInt) int lastPage,
    @JsonKey(fromJson: _anyToInt) int total,
  });
}

/// @nodoc
class __$$UsersListModelImplCopyWithImpl<$Res>
    extends _$UsersListModelCopyWithImpl<$Res, _$UsersListModelImpl>
    implements _$$UsersListModelImplCopyWith<$Res> {
  __$$UsersListModelImplCopyWithImpl(
    _$UsersListModelImpl _value,
    $Res Function(_$UsersListModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UsersListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? currentPage = null,
    Object? lastPage = null,
    Object? total = null,
  }) {
    return _then(
      _$UsersListModelImpl(
        users: null == users
            ? _value._users
            : users // ignore: cast_nullable_to_non_nullable
                  as List<UserModel>,
        currentPage: null == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int,
        lastPage: null == lastPage
            ? _value.lastPage
            : lastPage // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersListModelImpl extends _UsersListModel {
  const _$UsersListModelImpl({
    final List<UserModel> users = const [],
    @JsonKey(name: 'current_page', fromJson: _anyToInt) this.currentPage = 1,
    @JsonKey(name: 'last_page', fromJson: _anyToInt) this.lastPage = 1,
    @JsonKey(fromJson: _anyToInt) this.total = 0,
  }) : _users = users,
       super._();

  factory _$UsersListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersListModelImplFromJson(json);

  final List<UserModel> _users;
  @override
  @JsonKey()
  List<UserModel> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  @JsonKey(name: 'current_page', fromJson: _anyToInt)
  final int currentPage;
  @override
  @JsonKey(name: 'last_page', fromJson: _anyToInt)
  final int lastPage;
  @override
  @JsonKey(fromJson: _anyToInt)
  final int total;

  @override
  String toString() {
    return 'UsersListModel(users: $users, currentPage: $currentPage, lastPage: $lastPage, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersListModelImpl &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_users),
    currentPage,
    lastPage,
    total,
  );

  /// Create a copy of UsersListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersListModelImplCopyWith<_$UsersListModelImpl> get copyWith =>
      __$$UsersListModelImplCopyWithImpl<_$UsersListModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersListModelImplToJson(this);
  }
}

abstract class _UsersListModel extends UsersListModel {
  const factory _UsersListModel({
    final List<UserModel> users,
    @JsonKey(name: 'current_page', fromJson: _anyToInt) final int currentPage,
    @JsonKey(name: 'last_page', fromJson: _anyToInt) final int lastPage,
    @JsonKey(fromJson: _anyToInt) final int total,
  }) = _$UsersListModelImpl;
  const _UsersListModel._() : super._();

  factory _UsersListModel.fromJson(Map<String, dynamic> json) =
      _$UsersListModelImpl.fromJson;

  @override
  List<UserModel> get users;
  @override
  @JsonKey(name: 'current_page', fromJson: _anyToInt)
  int get currentPage;
  @override
  @JsonKey(name: 'last_page', fromJson: _anyToInt)
  int get lastPage;
  @override
  @JsonKey(fromJson: _anyToInt)
  int get total;

  /// Create a copy of UsersListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsersListModelImplCopyWith<_$UsersListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
