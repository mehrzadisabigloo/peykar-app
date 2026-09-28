// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OstanModel {

@JsonKey(fromJson: _anyToInt) int? get id;@JsonKey(fromJson: _anyToString) String? get name;
/// Create a copy of OstanModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OstanModelCopyWith<OstanModel> get copyWith => _$OstanModelCopyWithImpl<OstanModel>(this as OstanModel, _$identity);

  /// Serializes this OstanModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OstanModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OstanModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OstanModel;
  return Object.hash(runtimeType,_this.id,_this.name);
}

@override
String toString() {
  final _this = this as OstanModel;
  return 'OstanModel(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $OstanModelCopyWith<$Res>  {
  factory $OstanModelCopyWith(OstanModel value, $Res Function(OstanModel) _then) = _$OstanModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToInt) int? id,@JsonKey(fromJson: _anyToString) String? name
});




}
/// @nodoc
class _$OstanModelCopyWithImpl<$Res>
    implements $OstanModelCopyWith<$Res> {
  _$OstanModelCopyWithImpl(this._self, this._then);

  final OstanModel _self;
  final $Res Function(OstanModel) _then;

/// Create a copy of OstanModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(OstanModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OstanModel].
extension OstanModelPatterns on OstanModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OstanModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OstanModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OstanModel value)  $default,){
final _that = this;
switch (_that) {
case _OstanModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OstanModel value)?  $default,){
final _that = this;
switch (_that) {
case _OstanModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToInt)  int? id, @JsonKey(fromJson: _anyToString)  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OstanModel() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToInt)  int? id, @JsonKey(fromJson: _anyToString)  String? name)  $default,) {final _that = this;
switch (_that) {
case _OstanModel():
return $default(_that.id,_that.name);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToInt)  int? id, @JsonKey(fromJson: _anyToString)  String? name)?  $default,) {final _that = this;
switch (_that) {
case _OstanModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OstanModel implements OstanModel {
  const _OstanModel({@JsonKey(fromJson: _anyToInt) this.id, @JsonKey(fromJson: _anyToString) this.name});
  factory _OstanModel.fromJson(Map<String, dynamic> json) => _$OstanModelFromJson(json);

@override@JsonKey(fromJson: _anyToInt) final  int? id;
@override@JsonKey(fromJson: _anyToString) final  String? name;

/// Create a copy of OstanModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OstanModelCopyWith<_OstanModel> get copyWith => __$OstanModelCopyWithImpl<_OstanModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OstanModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OstanModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name);
}

@override
String toString() {
    return 'OstanModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$OstanModelCopyWith<$Res> implements $OstanModelCopyWith<$Res> {
  factory _$OstanModelCopyWith(_OstanModel value, $Res Function(_OstanModel) _then) = __$OstanModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToInt) int? id,@JsonKey(fromJson: _anyToString) String? name
});




}
/// @nodoc
class __$OstanModelCopyWithImpl<$Res>
    implements _$OstanModelCopyWith<$Res> {
  __$OstanModelCopyWithImpl(this._self, this._then);

  final _OstanModel _self;
  final $Res Function(_OstanModel) _then;

/// Create a copy of OstanModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_OstanModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ShahrestanModel {

@JsonKey(fromJson: _anyToInt) int? get id;@JsonKey(fromJson: _anyToString) String? get name;@JsonKey(fromJson: _anyToString) String? get ostan;
/// Create a copy of ShahrestanModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShahrestanModelCopyWith<ShahrestanModel> get copyWith => _$ShahrestanModelCopyWithImpl<ShahrestanModel>(this as ShahrestanModel, _$identity);

  /// Serializes this ShahrestanModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ShahrestanModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShahrestanModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.ostan, _this.ostan) || other.ostan == _this.ostan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ShahrestanModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.ostan);
}

@override
String toString() {
  final _this = this as ShahrestanModel;
  return 'ShahrestanModel(id: ${_this.id}, name: ${_this.name}, ostan: ${_this.ostan})';
}


}

/// @nodoc
abstract mixin class $ShahrestanModelCopyWith<$Res>  {
  factory $ShahrestanModelCopyWith(ShahrestanModel value, $Res Function(ShahrestanModel) _then) = _$ShahrestanModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToInt) int? id,@JsonKey(fromJson: _anyToString) String? name,@JsonKey(fromJson: _anyToString) String? ostan
});




}
/// @nodoc
class _$ShahrestanModelCopyWithImpl<$Res>
    implements $ShahrestanModelCopyWith<$Res> {
  _$ShahrestanModelCopyWithImpl(this._self, this._then);

  final ShahrestanModel _self;
  final $Res Function(ShahrestanModel) _then;

/// Create a copy of ShahrestanModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? ostan = freezed,}) {
  return _then(ShahrestanModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,ostan: freezed == ostan ? _self.ostan : ostan // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShahrestanModel].
extension ShahrestanModelPatterns on ShahrestanModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShahrestanModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShahrestanModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShahrestanModel value)  $default,){
final _that = this;
switch (_that) {
case _ShahrestanModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShahrestanModel value)?  $default,){
final _that = this;
switch (_that) {
case _ShahrestanModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToInt)  int? id, @JsonKey(fromJson: _anyToString)  String? name, @JsonKey(fromJson: _anyToString)  String? ostan)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShahrestanModel() when $default != null:
return $default(_that.id,_that.name,_that.ostan);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToInt)  int? id, @JsonKey(fromJson: _anyToString)  String? name, @JsonKey(fromJson: _anyToString)  String? ostan)  $default,) {final _that = this;
switch (_that) {
case _ShahrestanModel():
return $default(_that.id,_that.name,_that.ostan);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToInt)  int? id, @JsonKey(fromJson: _anyToString)  String? name, @JsonKey(fromJson: _anyToString)  String? ostan)?  $default,) {final _that = this;
switch (_that) {
case _ShahrestanModel() when $default != null:
return $default(_that.id,_that.name,_that.ostan);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShahrestanModel implements ShahrestanModel {
  const _ShahrestanModel({@JsonKey(fromJson: _anyToInt) this.id, @JsonKey(fromJson: _anyToString) this.name, @JsonKey(fromJson: _anyToString) this.ostan});
  factory _ShahrestanModel.fromJson(Map<String, dynamic> json) => _$ShahrestanModelFromJson(json);

@override@JsonKey(fromJson: _anyToInt) final  int? id;
@override@JsonKey(fromJson: _anyToString) final  String? name;
@override@JsonKey(fromJson: _anyToString) final  String? ostan;

/// Create a copy of ShahrestanModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShahrestanModelCopyWith<_ShahrestanModel> get copyWith => __$ShahrestanModelCopyWithImpl<_ShahrestanModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShahrestanModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShahrestanModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.ostan, ostan) || other.ostan == ostan));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,ostan);
}

@override
String toString() {
    return 'ShahrestanModel(id: $id, name: $name, ostan: $ostan)';
}


}

/// @nodoc
abstract mixin class _$ShahrestanModelCopyWith<$Res> implements $ShahrestanModelCopyWith<$Res> {
  factory _$ShahrestanModelCopyWith(_ShahrestanModel value, $Res Function(_ShahrestanModel) _then) = __$ShahrestanModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToInt) int? id,@JsonKey(fromJson: _anyToString) String? name,@JsonKey(fromJson: _anyToString) String? ostan
});




}
/// @nodoc
class __$ShahrestanModelCopyWithImpl<$Res>
    implements _$ShahrestanModelCopyWith<$Res> {
  __$ShahrestanModelCopyWithImpl(this._self, this._then);

  final _ShahrestanModel _self;
  final $Res Function(_ShahrestanModel) _then;

/// Create a copy of ShahrestanModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? ostan = freezed,}) {
  return _then(_ShahrestanModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,ostan: freezed == ostan ? _self.ostan : ostan // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
