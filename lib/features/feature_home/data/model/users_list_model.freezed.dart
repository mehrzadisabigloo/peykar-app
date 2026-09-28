// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsersListModel {

 List<UserModel> get users;@JsonKey(name: 'current_page', fromJson: _anyToInt) int get currentPage;@JsonKey(name: 'last_page', fromJson: _anyToInt) int get lastPage;@JsonKey(fromJson: _anyToInt) int get total;
/// Create a copy of UsersListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersListModelCopyWith<UsersListModel> get copyWith => _$UsersListModelCopyWithImpl<UsersListModel>(this as UsersListModel, _$identity);

  /// Serializes this UsersListModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UsersListModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersListModel&&const DeepCollectionEquality().equals(other.users, _this.users)&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&(identical(other.lastPage, _this.lastPage) || other.lastPage == _this.lastPage)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UsersListModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.users),_this.currentPage,_this.lastPage,_this.total);
}

@override
String toString() {
  final _this = this as UsersListModel;
  return 'UsersListModel(users: ${_this.users}, currentPage: ${_this.currentPage}, lastPage: ${_this.lastPage}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $UsersListModelCopyWith<$Res>  {
  factory $UsersListModelCopyWith(UsersListModel value, $Res Function(UsersListModel) _then) = _$UsersListModelCopyWithImpl;
@useResult
$Res call({
 List<UserModel> users,@JsonKey(name: 'current_page', fromJson: _anyToInt) int currentPage,@JsonKey(name: 'last_page', fromJson: _anyToInt) int lastPage,@JsonKey(fromJson: _anyToInt) int total
});




}
/// @nodoc
class _$UsersListModelCopyWithImpl<$Res>
    implements $UsersListModelCopyWith<$Res> {
  _$UsersListModelCopyWithImpl(this._self, this._then);

  final UsersListModel _self;
  final $Res Function(UsersListModel) _then;

/// Create a copy of UsersListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? users = null,Object? currentPage = null,Object? lastPage = null,Object? total = null,}) {
  return _then(UsersListModel(
users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<UserModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UsersListModel].
extension UsersListModelPatterns on UsersListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsersListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsersListModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsersListModel value)  $default,){
final _that = this;
switch (_that) {
case _UsersListModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsersListModel value)?  $default,){
final _that = this;
switch (_that) {
case _UsersListModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserModel> users, @JsonKey(name: 'current_page', fromJson: _anyToInt)  int currentPage, @JsonKey(name: 'last_page', fromJson: _anyToInt)  int lastPage, @JsonKey(fromJson: _anyToInt)  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsersListModel() when $default != null:
return $default(_that.users,_that.currentPage,_that.lastPage,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserModel> users, @JsonKey(name: 'current_page', fromJson: _anyToInt)  int currentPage, @JsonKey(name: 'last_page', fromJson: _anyToInt)  int lastPage, @JsonKey(fromJson: _anyToInt)  int total)  $default,) {final _that = this;
switch (_that) {
case _UsersListModel():
return $default(_that.users,_that.currentPage,_that.lastPage,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserModel> users, @JsonKey(name: 'current_page', fromJson: _anyToInt)  int currentPage, @JsonKey(name: 'last_page', fromJson: _anyToInt)  int lastPage, @JsonKey(fromJson: _anyToInt)  int total)?  $default,) {final _that = this;
switch (_that) {
case _UsersListModel() when $default != null:
return $default(_that.users,_that.currentPage,_that.lastPage,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UsersListModel extends UsersListModel {
  const _UsersListModel({ List<UserModel> users = const [], @JsonKey(name: 'current_page', fromJson: _anyToInt) this.currentPage = 1, @JsonKey(name: 'last_page', fromJson: _anyToInt) this.lastPage = 1, @JsonKey(fromJson: _anyToInt) this.total = 0}): _users = users,super._();
  factory _UsersListModel.fromJson(Map<String, dynamic> json) => _$UsersListModelFromJson(json);

 final  List<UserModel> _users;
@override@JsonKey() List<UserModel> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override@JsonKey(name: 'current_page', fromJson: _anyToInt) final  int currentPage;
@override@JsonKey(name: 'last_page', fromJson: _anyToInt) final  int lastPage;
@override@JsonKey(fromJson: _anyToInt) final  int total;

/// Create a copy of UsersListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsersListModelCopyWith<_UsersListModel> get copyWith => __$UsersListModelCopyWithImpl<_UsersListModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsersListModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsersListModel&&const DeepCollectionEquality().equals(other.users, _users)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),currentPage,lastPage,total);
}

@override
String toString() {
    return 'UsersListModel(users: $users, currentPage: $currentPage, lastPage: $lastPage, total: $total)';
}


}

/// @nodoc
abstract mixin class _$UsersListModelCopyWith<$Res> implements $UsersListModelCopyWith<$Res> {
  factory _$UsersListModelCopyWith(_UsersListModel value, $Res Function(_UsersListModel) _then) = __$UsersListModelCopyWithImpl;
@override @useResult
$Res call({
 List<UserModel> users,@JsonKey(name: 'current_page', fromJson: _anyToInt) int currentPage,@JsonKey(name: 'last_page', fromJson: _anyToInt) int lastPage,@JsonKey(fromJson: _anyToInt) int total
});




}
/// @nodoc
class __$UsersListModelCopyWithImpl<$Res>
    implements _$UsersListModelCopyWith<$Res> {
  __$UsersListModelCopyWithImpl(this._self, this._then);

  final _UsersListModel _self;
  final $Res Function(_UsersListModel) _then;

/// Create a copy of UsersListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? users = null,Object? currentPage = null,Object? lastPage = null,Object? total = null,}) {
  return _then(_UsersListModel(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<UserModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
