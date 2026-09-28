// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'occupation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OccupationModel {

@JsonKey(fromJson: _anyToString) String? get id;@JsonKey(fromJson: _anyToString) String? get title;@JsonKey(fromJson: _anyToString) String? get status;@JsonKey(name: 'sort_order', fromJson: _anyToInt) int? get sortOrder;@JsonKey(name: 'created_at', fromJson: _anyToString) String? get createdAt;@JsonKey(name: 'updated_at', fromJson: _anyToString) String? get updatedAt;@JsonKey(name: 'image_id', fromJson: _anyToString) String? get imageId;@JsonKey(fromJson: _anyToString) String? get color;
/// Create a copy of OccupationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OccupationModelCopyWith<OccupationModel> get copyWith => _$OccupationModelCopyWithImpl<OccupationModel>(this as OccupationModel, _$identity);

  /// Serializes this OccupationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OccupationModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OccupationModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.sortOrder, _this.sortOrder) || other.sortOrder == _this.sortOrder)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.imageId, _this.imageId) || other.imageId == _this.imageId)&&(identical(other.color, _this.color) || other.color == _this.color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OccupationModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.status,_this.sortOrder,_this.createdAt,_this.updatedAt,_this.imageId,_this.color);
}

@override
String toString() {
  final _this = this as OccupationModel;
  return 'OccupationModel(id: ${_this.id}, title: ${_this.title}, status: ${_this.status}, sortOrder: ${_this.sortOrder}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, imageId: ${_this.imageId}, color: ${_this.color})';
}


}

/// @nodoc
abstract mixin class $OccupationModelCopyWith<$Res>  {
  factory $OccupationModelCopyWith(OccupationModel value, $Res Function(OccupationModel) _then) = _$OccupationModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(fromJson: _anyToString) String? title,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'sort_order', fromJson: _anyToInt) int? sortOrder,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,@JsonKey(name: 'image_id', fromJson: _anyToString) String? imageId,@JsonKey(fromJson: _anyToString) String? color
});




}
/// @nodoc
class _$OccupationModelCopyWithImpl<$Res>
    implements $OccupationModelCopyWith<$Res> {
  _$OccupationModelCopyWithImpl(this._self, this._then);

  final OccupationModel _self;
  final $Res Function(OccupationModel) _then;

/// Create a copy of OccupationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? status = freezed,Object? sortOrder = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? imageId = freezed,Object? color = freezed,}) {
  return _then(OccupationModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,imageId: freezed == imageId ? _self.imageId : imageId // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OccupationModel].
extension OccupationModelPatterns on OccupationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OccupationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OccupationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OccupationModel value)  $default,){
final _that = this;
switch (_that) {
case _OccupationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OccupationModel value)?  $default,){
final _that = this;
switch (_that) {
case _OccupationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(fromJson: _anyToString)  String? title, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'sort_order', fromJson: _anyToInt)  int? sortOrder, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt, @JsonKey(name: 'image_id', fromJson: _anyToString)  String? imageId, @JsonKey(fromJson: _anyToString)  String? color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OccupationModel() when $default != null:
return $default(_that.id,_that.title,_that.status,_that.sortOrder,_that.createdAt,_that.updatedAt,_that.imageId,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(fromJson: _anyToString)  String? title, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'sort_order', fromJson: _anyToInt)  int? sortOrder, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt, @JsonKey(name: 'image_id', fromJson: _anyToString)  String? imageId, @JsonKey(fromJson: _anyToString)  String? color)  $default,) {final _that = this;
switch (_that) {
case _OccupationModel():
return $default(_that.id,_that.title,_that.status,_that.sortOrder,_that.createdAt,_that.updatedAt,_that.imageId,_that.color);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(fromJson: _anyToString)  String? title, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'sort_order', fromJson: _anyToInt)  int? sortOrder, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt, @JsonKey(name: 'image_id', fromJson: _anyToString)  String? imageId, @JsonKey(fromJson: _anyToString)  String? color)?  $default,) {final _that = this;
switch (_that) {
case _OccupationModel() when $default != null:
return $default(_that.id,_that.title,_that.status,_that.sortOrder,_that.createdAt,_that.updatedAt,_that.imageId,_that.color);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OccupationModel extends OccupationModel {
  const _OccupationModel({@JsonKey(fromJson: _anyToString) this.id, @JsonKey(fromJson: _anyToString) this.title, @JsonKey(fromJson: _anyToString) this.status, @JsonKey(name: 'sort_order', fromJson: _anyToInt) this.sortOrder, @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt, @JsonKey(name: 'image_id', fromJson: _anyToString) this.imageId, @JsonKey(fromJson: _anyToString) this.color}): super._();
  factory _OccupationModel.fromJson(Map<String, dynamic> json) => _$OccupationModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String? id;
@override@JsonKey(fromJson: _anyToString) final  String? title;
@override@JsonKey(fromJson: _anyToString) final  String? status;
@override@JsonKey(name: 'sort_order', fromJson: _anyToInt) final  int? sortOrder;
@override@JsonKey(name: 'created_at', fromJson: _anyToString) final  String? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _anyToString) final  String? updatedAt;
@override@JsonKey(name: 'image_id', fromJson: _anyToString) final  String? imageId;
@override@JsonKey(fromJson: _anyToString) final  String? color;

/// Create a copy of OccupationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OccupationModelCopyWith<_OccupationModel> get copyWith => __$OccupationModelCopyWithImpl<_OccupationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OccupationModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OccupationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.imageId, imageId) || other.imageId == imageId)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,status,sortOrder,createdAt,updatedAt,imageId,color);
}

@override
String toString() {
    return 'OccupationModel(id: $id, title: $title, status: $status, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt, imageId: $imageId, color: $color)';
}


}

/// @nodoc
abstract mixin class _$OccupationModelCopyWith<$Res> implements $OccupationModelCopyWith<$Res> {
  factory _$OccupationModelCopyWith(_OccupationModel value, $Res Function(_OccupationModel) _then) = __$OccupationModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(fromJson: _anyToString) String? title,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'sort_order', fromJson: _anyToInt) int? sortOrder,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,@JsonKey(name: 'image_id', fromJson: _anyToString) String? imageId,@JsonKey(fromJson: _anyToString) String? color
});




}
/// @nodoc
class __$OccupationModelCopyWithImpl<$Res>
    implements _$OccupationModelCopyWith<$Res> {
  __$OccupationModelCopyWithImpl(this._self, this._then);

  final _OccupationModel _self;
  final $Res Function(_OccupationModel) _then;

/// Create a copy of OccupationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? status = freezed,Object? sortOrder = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? imageId = freezed,Object? color = freezed,}) {
  return _then(_OccupationModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,imageId: freezed == imageId ? _self.imageId : imageId // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
