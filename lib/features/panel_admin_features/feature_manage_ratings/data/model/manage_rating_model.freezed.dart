// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_rating_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManageRatingModel {

 String get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'repairman_id') String get repairmanId; String get description; int get score; String get status;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'created_at_jalali') String? get createdAtJalali; UserModel? get user;
/// Create a copy of ManageRatingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManageRatingModelCopyWith<ManageRatingModel> get copyWith => _$ManageRatingModelCopyWithImpl<ManageRatingModel>(this as ManageRatingModel, _$identity);

  /// Serializes this ManageRatingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ManageRatingModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageRatingModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.repairmanId, _this.repairmanId) || other.repairmanId == _this.repairmanId)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.score, _this.score) || other.score == _this.score)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.createdAtJalali, _this.createdAtJalali) || other.createdAtJalali == _this.createdAtJalali)&&(identical(other.user, _this.user) || other.user == _this.user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ManageRatingModel;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.repairmanId,_this.description,_this.score,_this.status,_this.createdAt,_this.createdAtJalali,_this.user);
}

@override
String toString() {
  final _this = this as ManageRatingModel;
  return 'ManageRatingModel(id: ${_this.id}, userId: ${_this.userId}, repairmanId: ${_this.repairmanId}, description: ${_this.description}, score: ${_this.score}, status: ${_this.status}, createdAt: ${_this.createdAt}, createdAtJalali: ${_this.createdAtJalali}, user: ${_this.user})';
}


}

/// @nodoc
abstract mixin class $ManageRatingModelCopyWith<$Res>  {
  factory $ManageRatingModelCopyWith(ManageRatingModel value, $Res Function(ManageRatingModel) _then) = _$ManageRatingModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'repairman_id') String repairmanId, String description, int score, String status,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'created_at_jalali') String? createdAtJalali, UserModel? user
});


$UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$ManageRatingModelCopyWithImpl<$Res>
    implements $ManageRatingModelCopyWith<$Res> {
  _$ManageRatingModelCopyWithImpl(this._self, this._then);

  final ManageRatingModel _self;
  final $Res Function(ManageRatingModel) _then;

/// Create a copy of ManageRatingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? repairmanId = null,Object? description = null,Object? score = null,Object? status = null,Object? createdAt = null,Object? createdAtJalali = freezed,Object? user = freezed,}) {
  return _then(ManageRatingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,repairmanId: null == repairmanId ? _self.repairmanId : repairmanId // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,createdAtJalali: freezed == createdAtJalali ? _self.createdAtJalali : createdAtJalali // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}
/// Create a copy of ManageRatingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ManageRatingModel].
extension ManageRatingModelPatterns on ManageRatingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManageRatingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManageRatingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManageRatingModel value)  $default,){
final _that = this;
switch (_that) {
case _ManageRatingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManageRatingModel value)?  $default,){
final _that = this;
switch (_that) {
case _ManageRatingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'repairman_id')  String repairmanId,  String description,  int score,  String status, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'created_at_jalali')  String? createdAtJalali,  UserModel? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManageRatingModel() when $default != null:
return $default(_that.id,_that.userId,_that.repairmanId,_that.description,_that.score,_that.status,_that.createdAt,_that.createdAtJalali,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'repairman_id')  String repairmanId,  String description,  int score,  String status, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'created_at_jalali')  String? createdAtJalali,  UserModel? user)  $default,) {final _that = this;
switch (_that) {
case _ManageRatingModel():
return $default(_that.id,_that.userId,_that.repairmanId,_that.description,_that.score,_that.status,_that.createdAt,_that.createdAtJalali,_that.user);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'repairman_id')  String repairmanId,  String description,  int score,  String status, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'created_at_jalali')  String? createdAtJalali,  UserModel? user)?  $default,) {final _that = this;
switch (_that) {
case _ManageRatingModel() when $default != null:
return $default(_that.id,_that.userId,_that.repairmanId,_that.description,_that.score,_that.status,_that.createdAt,_that.createdAtJalali,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManageRatingModel extends ManageRatingModel {
  const _ManageRatingModel({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'repairman_id') required this.repairmanId, required this.description, required this.score, required this.status, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'created_at_jalali') this.createdAtJalali, this.user}): super._();
  factory _ManageRatingModel.fromJson(Map<String, dynamic> json) => _$ManageRatingModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'repairman_id') final  String repairmanId;
@override final  String description;
@override final  int score;
@override final  String status;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'created_at_jalali') final  String? createdAtJalali;
@override final  UserModel? user;

/// Create a copy of ManageRatingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManageRatingModelCopyWith<_ManageRatingModel> get copyWith => __$ManageRatingModelCopyWithImpl<_ManageRatingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManageRatingModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManageRatingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.repairmanId, repairmanId) || other.repairmanId == repairmanId)&&(identical(other.description, description) || other.description == description)&&(identical(other.score, score) || other.score == score)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdAtJalali, createdAtJalali) || other.createdAtJalali == createdAtJalali)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,repairmanId,description,score,status,createdAt,createdAtJalali,user);
}

@override
String toString() {
    return 'ManageRatingModel(id: $id, userId: $userId, repairmanId: $repairmanId, description: $description, score: $score, status: $status, createdAt: $createdAt, createdAtJalali: $createdAtJalali, user: $user)';
}


}

/// @nodoc
abstract mixin class _$ManageRatingModelCopyWith<$Res> implements $ManageRatingModelCopyWith<$Res> {
  factory _$ManageRatingModelCopyWith(_ManageRatingModel value, $Res Function(_ManageRatingModel) _then) = __$ManageRatingModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'repairman_id') String repairmanId, String description, int score, String status,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'created_at_jalali') String? createdAtJalali, UserModel? user
});


@override $UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$ManageRatingModelCopyWithImpl<$Res>
    implements _$ManageRatingModelCopyWith<$Res> {
  __$ManageRatingModelCopyWithImpl(this._self, this._then);

  final _ManageRatingModel _self;
  final $Res Function(_ManageRatingModel) _then;

/// Create a copy of ManageRatingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? repairmanId = null,Object? description = null,Object? score = null,Object? status = null,Object? createdAt = null,Object? createdAtJalali = freezed,Object? user = freezed,}) {
  return _then(_ManageRatingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,repairmanId: null == repairmanId ? _self.repairmanId : repairmanId // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,createdAtJalali: freezed == createdAtJalali ? _self.createdAtJalali : createdAtJalali // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}

/// Create a copy of ManageRatingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
