// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RatingModel {

 String get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'repairman_id') String get repairmanId; String? get description; int get score; String get status;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;@JsonKey(name: 'created_at_jalali') String? get createdAtJalali; ReservationUserModel get user;
/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingModelCopyWith<RatingModel> get copyWith => _$RatingModelCopyWithImpl<RatingModel>(this as RatingModel, _$identity);

  /// Serializes this RatingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RatingModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatingModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.repairmanId, _this.repairmanId) || other.repairmanId == _this.repairmanId)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.score, _this.score) || other.score == _this.score)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.createdAtJalali, _this.createdAtJalali) || other.createdAtJalali == _this.createdAtJalali)&&(identical(other.user, _this.user) || other.user == _this.user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RatingModel;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.repairmanId,_this.description,_this.score,_this.status,_this.createdAt,_this.updatedAt,_this.createdAtJalali,_this.user);
}

@override
String toString() {
  final _this = this as RatingModel;
  return 'RatingModel(id: ${_this.id}, userId: ${_this.userId}, repairmanId: ${_this.repairmanId}, description: ${_this.description}, score: ${_this.score}, status: ${_this.status}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, createdAtJalali: ${_this.createdAtJalali}, user: ${_this.user})';
}


}

/// @nodoc
abstract mixin class $RatingModelCopyWith<$Res>  {
  factory $RatingModelCopyWith(RatingModel value, $Res Function(RatingModel) _then) = _$RatingModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'repairman_id') String repairmanId, String? description, int score, String status,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'created_at_jalali') String? createdAtJalali, ReservationUserModel user
});


$ReservationUserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$RatingModelCopyWithImpl<$Res>
    implements $RatingModelCopyWith<$Res> {
  _$RatingModelCopyWithImpl(this._self, this._then);

  final RatingModel _self;
  final $Res Function(RatingModel) _then;

/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? repairmanId = null,Object? description = freezed,Object? score = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? createdAtJalali = freezed,Object? user = null,}) {
  return _then(RatingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,repairmanId: null == repairmanId ? _self.repairmanId : repairmanId // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,createdAtJalali: freezed == createdAtJalali ? _self.createdAtJalali : createdAtJalali // ignore: cast_nullable_to_non_nullable
as String?,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ReservationUserModel,
  ));
}
/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationUserModelCopyWith<$Res> get user {
  
  return $ReservationUserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [RatingModel].
extension RatingModelPatterns on RatingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RatingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RatingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RatingModel value)  $default,){
final _that = this;
switch (_that) {
case _RatingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RatingModel value)?  $default,){
final _that = this;
switch (_that) {
case _RatingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'repairman_id')  String repairmanId,  String? description,  int score,  String status, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'created_at_jalali')  String? createdAtJalali,  ReservationUserModel user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatingModel() when $default != null:
return $default(_that.id,_that.userId,_that.repairmanId,_that.description,_that.score,_that.status,_that.createdAt,_that.updatedAt,_that.createdAtJalali,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'repairman_id')  String repairmanId,  String? description,  int score,  String status, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'created_at_jalali')  String? createdAtJalali,  ReservationUserModel user)  $default,) {final _that = this;
switch (_that) {
case _RatingModel():
return $default(_that.id,_that.userId,_that.repairmanId,_that.description,_that.score,_that.status,_that.createdAt,_that.updatedAt,_that.createdAtJalali,_that.user);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'repairman_id')  String repairmanId,  String? description,  int score,  String status, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'created_at_jalali')  String? createdAtJalali,  ReservationUserModel user)?  $default,) {final _that = this;
switch (_that) {
case _RatingModel() when $default != null:
return $default(_that.id,_that.userId,_that.repairmanId,_that.description,_that.score,_that.status,_that.createdAt,_that.updatedAt,_that.createdAtJalali,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RatingModel implements RatingModel {
  const _RatingModel({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'repairman_id') required this.repairmanId, this.description, required this.score, required this.status, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'created_at_jalali') this.createdAtJalali, required this.user});
  factory _RatingModel.fromJson(Map<String, dynamic> json) => _$RatingModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'repairman_id') final  String repairmanId;
@override final  String? description;
@override final  int score;
@override final  String status;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override@JsonKey(name: 'created_at_jalali') final  String? createdAtJalali;
@override final  ReservationUserModel user;

/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatingModelCopyWith<_RatingModel> get copyWith => __$RatingModelCopyWithImpl<_RatingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RatingModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.repairmanId, repairmanId) || other.repairmanId == repairmanId)&&(identical(other.description, description) || other.description == description)&&(identical(other.score, score) || other.score == score)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAtJalali, createdAtJalali) || other.createdAtJalali == createdAtJalali)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,repairmanId,description,score,status,createdAt,updatedAt,createdAtJalali,user);
}

@override
String toString() {
    return 'RatingModel(id: $id, userId: $userId, repairmanId: $repairmanId, description: $description, score: $score, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, createdAtJalali: $createdAtJalali, user: $user)';
}


}

/// @nodoc
abstract mixin class _$RatingModelCopyWith<$Res> implements $RatingModelCopyWith<$Res> {
  factory _$RatingModelCopyWith(_RatingModel value, $Res Function(_RatingModel) _then) = __$RatingModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'repairman_id') String repairmanId, String? description, int score, String status,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'created_at_jalali') String? createdAtJalali, ReservationUserModel user
});


@override $ReservationUserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$RatingModelCopyWithImpl<$Res>
    implements _$RatingModelCopyWith<$Res> {
  __$RatingModelCopyWithImpl(this._self, this._then);

  final _RatingModel _self;
  final $Res Function(_RatingModel) _then;

/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? repairmanId = null,Object? description = freezed,Object? score = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? createdAtJalali = freezed,Object? user = null,}) {
  return _then(_RatingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,repairmanId: null == repairmanId ? _self.repairmanId : repairmanId // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,createdAtJalali: freezed == createdAtJalali ? _self.createdAtJalali : createdAtJalali // ignore: cast_nullable_to_non_nullable
as String?,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ReservationUserModel,
  ));
}

/// Create a copy of RatingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationUserModelCopyWith<$Res> get user {
  
  return $ReservationUserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$RatingListModel {

 List<RatingModel> get data;@JsonKey(name: 'current_page') int get currentPage;@JsonKey(name: 'last_page') int get lastPage; int get total;
/// Create a copy of RatingListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingListModelCopyWith<RatingListModel> get copyWith => _$RatingListModelCopyWithImpl<RatingListModel>(this as RatingListModel, _$identity);

  /// Serializes this RatingListModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RatingListModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatingListModel&&const DeepCollectionEquality().equals(other.data, _this.data)&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&(identical(other.lastPage, _this.lastPage) || other.lastPage == _this.lastPage)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RatingListModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.data),_this.currentPage,_this.lastPage,_this.total);
}

@override
String toString() {
  final _this = this as RatingListModel;
  return 'RatingListModel(data: ${_this.data}, currentPage: ${_this.currentPage}, lastPage: ${_this.lastPage}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $RatingListModelCopyWith<$Res>  {
  factory $RatingListModelCopyWith(RatingListModel value, $Res Function(RatingListModel) _then) = _$RatingListModelCopyWithImpl;
@useResult
$Res call({
 List<RatingModel> data,@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'last_page') int lastPage, int total
});




}
/// @nodoc
class _$RatingListModelCopyWithImpl<$Res>
    implements $RatingListModelCopyWith<$Res> {
  _$RatingListModelCopyWithImpl(this._self, this._then);

  final RatingListModel _self;
  final $Res Function(RatingListModel) _then;

/// Create a copy of RatingListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? currentPage = null,Object? lastPage = null,Object? total = null,}) {
  return _then(RatingListModel(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<RatingModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RatingListModel].
extension RatingListModelPatterns on RatingListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RatingListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RatingListModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RatingListModel value)  $default,){
final _that = this;
switch (_that) {
case _RatingListModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RatingListModel value)?  $default,){
final _that = this;
switch (_that) {
case _RatingListModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RatingModel> data, @JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'last_page')  int lastPage,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatingListModel() when $default != null:
return $default(_that.data,_that.currentPage,_that.lastPage,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RatingModel> data, @JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'last_page')  int lastPage,  int total)  $default,) {final _that = this;
switch (_that) {
case _RatingListModel():
return $default(_that.data,_that.currentPage,_that.lastPage,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RatingModel> data, @JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'last_page')  int lastPage,  int total)?  $default,) {final _that = this;
switch (_that) {
case _RatingListModel() when $default != null:
return $default(_that.data,_that.currentPage,_that.lastPage,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RatingListModel implements RatingListModel {
  const _RatingListModel({required  List<RatingModel> data, @JsonKey(name: 'current_page') required this.currentPage, @JsonKey(name: 'last_page') required this.lastPage, required this.total}): _data = data;
  factory _RatingListModel.fromJson(Map<String, dynamic> json) => _$RatingListModelFromJson(json);

 final  List<RatingModel> _data;
@override List<RatingModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey(name: 'current_page') final  int currentPage;
@override@JsonKey(name: 'last_page') final  int lastPage;
@override final  int total;

/// Create a copy of RatingListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatingListModelCopyWith<_RatingListModel> get copyWith => __$RatingListModelCopyWithImpl<_RatingListModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RatingListModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatingListModel&&const DeepCollectionEquality().equals(other.data, _data)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),currentPage,lastPage,total);
}

@override
String toString() {
    return 'RatingListModel(data: $data, currentPage: $currentPage, lastPage: $lastPage, total: $total)';
}


}

/// @nodoc
abstract mixin class _$RatingListModelCopyWith<$Res> implements $RatingListModelCopyWith<$Res> {
  factory _$RatingListModelCopyWith(_RatingListModel value, $Res Function(_RatingListModel) _then) = __$RatingListModelCopyWithImpl;
@override @useResult
$Res call({
 List<RatingModel> data,@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'last_page') int lastPage, int total
});




}
/// @nodoc
class __$RatingListModelCopyWithImpl<$Res>
    implements _$RatingListModelCopyWith<$Res> {
  __$RatingListModelCopyWithImpl(this._self, this._then);

  final _RatingListModel _self;
  final $Res Function(_RatingListModel) _then;

/// Create a copy of RatingListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? currentPage = null,Object? lastPage = null,Object? total = null,}) {
  return _then(_RatingListModel(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<RatingModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
