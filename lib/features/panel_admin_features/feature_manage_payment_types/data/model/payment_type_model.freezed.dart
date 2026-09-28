// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentTypeModel {

@JsonKey(fromJson: _anyToInt) int? get id;@JsonKey(fromJson: _anyToString) String? get title;@JsonKey(fromJson: _anyToString) String? get label;@JsonKey(fromJson: _anyToString) String? get type;@JsonKey(fromJson: _anyToString) String? get status;@JsonKey(name: 'created_at', fromJson: _anyToString) String? get createdAt;@JsonKey(name: 'updated_at', fromJson: _anyToString) String? get updatedAt;
/// Create a copy of PaymentTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentTypeModelCopyWith<PaymentTypeModel> get copyWith => _$PaymentTypeModelCopyWithImpl<PaymentTypeModel>(this as PaymentTypeModel, _$identity);

  /// Serializes this PaymentTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PaymentTypeModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentTypeModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PaymentTypeModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.label,_this.type,_this.status,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as PaymentTypeModel;
  return 'PaymentTypeModel(id: ${_this.id}, title: ${_this.title}, label: ${_this.label}, type: ${_this.type}, status: ${_this.status}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $PaymentTypeModelCopyWith<$Res>  {
  factory $PaymentTypeModelCopyWith(PaymentTypeModel value, $Res Function(PaymentTypeModel) _then) = _$PaymentTypeModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToInt) int? id,@JsonKey(fromJson: _anyToString) String? title,@JsonKey(fromJson: _anyToString) String? label,@JsonKey(fromJson: _anyToString) String? type,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt
});




}
/// @nodoc
class _$PaymentTypeModelCopyWithImpl<$Res>
    implements $PaymentTypeModelCopyWith<$Res> {
  _$PaymentTypeModelCopyWithImpl(this._self, this._then);

  final PaymentTypeModel _self;
  final $Res Function(PaymentTypeModel) _then;

/// Create a copy of PaymentTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? label = freezed,Object? type = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(PaymentTypeModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentTypeModel].
extension PaymentTypeModelPatterns on PaymentTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentTypeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToInt)  int? id, @JsonKey(fromJson: _anyToString)  String? title, @JsonKey(fromJson: _anyToString)  String? label, @JsonKey(fromJson: _anyToString)  String? type, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentTypeModel() when $default != null:
return $default(_that.id,_that.title,_that.label,_that.type,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToInt)  int? id, @JsonKey(fromJson: _anyToString)  String? title, @JsonKey(fromJson: _anyToString)  String? label, @JsonKey(fromJson: _anyToString)  String? type, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PaymentTypeModel():
return $default(_that.id,_that.title,_that.label,_that.type,_that.status,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToInt)  int? id, @JsonKey(fromJson: _anyToString)  String? title, @JsonKey(fromJson: _anyToString)  String? label, @JsonKey(fromJson: _anyToString)  String? type, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PaymentTypeModel() when $default != null:
return $default(_that.id,_that.title,_that.label,_that.type,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentTypeModel extends PaymentTypeModel {
  const _PaymentTypeModel({@JsonKey(fromJson: _anyToInt) this.id, @JsonKey(fromJson: _anyToString) this.title, @JsonKey(fromJson: _anyToString) this.label, @JsonKey(fromJson: _anyToString) this.type, @JsonKey(fromJson: _anyToString) this.status, @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt}): super._();
  factory _PaymentTypeModel.fromJson(Map<String, dynamic> json) => _$PaymentTypeModelFromJson(json);

@override@JsonKey(fromJson: _anyToInt) final  int? id;
@override@JsonKey(fromJson: _anyToString) final  String? title;
@override@JsonKey(fromJson: _anyToString) final  String? label;
@override@JsonKey(fromJson: _anyToString) final  String? type;
@override@JsonKey(fromJson: _anyToString) final  String? status;
@override@JsonKey(name: 'created_at', fromJson: _anyToString) final  String? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _anyToString) final  String? updatedAt;

/// Create a copy of PaymentTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentTypeModelCopyWith<_PaymentTypeModel> get copyWith => __$PaymentTypeModelCopyWithImpl<_PaymentTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,label,type,status,createdAt,updatedAt);
}

@override
String toString() {
    return 'PaymentTypeModel(id: $id, title: $title, label: $label, type: $type, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PaymentTypeModelCopyWith<$Res> implements $PaymentTypeModelCopyWith<$Res> {
  factory _$PaymentTypeModelCopyWith(_PaymentTypeModel value, $Res Function(_PaymentTypeModel) _then) = __$PaymentTypeModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToInt) int? id,@JsonKey(fromJson: _anyToString) String? title,@JsonKey(fromJson: _anyToString) String? label,@JsonKey(fromJson: _anyToString) String? type,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt
});




}
/// @nodoc
class __$PaymentTypeModelCopyWithImpl<$Res>
    implements _$PaymentTypeModelCopyWith<$Res> {
  __$PaymentTypeModelCopyWithImpl(this._self, this._then);

  final _PaymentTypeModel _self;
  final $Res Function(_PaymentTypeModel) _then;

/// Create a copy of PaymentTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? label = freezed,Object? type = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_PaymentTypeModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
