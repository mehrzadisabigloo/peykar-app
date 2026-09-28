// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sending_method_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SendingMethodModel {

@JsonKey(fromJson: _anyToString) String? get id;@JsonKey(fromJson: _anyToString) String? get title;@JsonKey(fromJson: _anyToInt) int? get price;@JsonKey(fromJson: _anyToString) String? get status;@JsonKey(name: 'created_at', fromJson: _anyToString) String? get createdAt;@JsonKey(name: 'updated_at', fromJson: _anyToString) String? get updatedAt;@JsonKey(name: 'locations_count', fromJson: _anyToInt) int? get locationsCount; List<SendingMethodLocationModel>? get locations;
/// Create a copy of SendingMethodModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendingMethodModelCopyWith<SendingMethodModel> get copyWith => _$SendingMethodModelCopyWithImpl<SendingMethodModel>(this as SendingMethodModel, _$identity);

  /// Serializes this SendingMethodModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SendingMethodModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendingMethodModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.locationsCount, _this.locationsCount) || other.locationsCount == _this.locationsCount)&&const DeepCollectionEquality().equals(other.locations, _this.locations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SendingMethodModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.price,_this.status,_this.createdAt,_this.updatedAt,_this.locationsCount,const DeepCollectionEquality().hash(_this.locations));
}

@override
String toString() {
  final _this = this as SendingMethodModel;
  return 'SendingMethodModel(id: ${_this.id}, title: ${_this.title}, price: ${_this.price}, status: ${_this.status}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, locationsCount: ${_this.locationsCount}, locations: ${_this.locations})';
}


}

/// @nodoc
abstract mixin class $SendingMethodModelCopyWith<$Res>  {
  factory $SendingMethodModelCopyWith(SendingMethodModel value, $Res Function(SendingMethodModel) _then) = _$SendingMethodModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(fromJson: _anyToString) String? title,@JsonKey(fromJson: _anyToInt) int? price,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,@JsonKey(name: 'locations_count', fromJson: _anyToInt) int? locationsCount, List<SendingMethodLocationModel>? locations
});




}
/// @nodoc
class _$SendingMethodModelCopyWithImpl<$Res>
    implements $SendingMethodModelCopyWith<$Res> {
  _$SendingMethodModelCopyWithImpl(this._self, this._then);

  final SendingMethodModel _self;
  final $Res Function(SendingMethodModel) _then;

/// Create a copy of SendingMethodModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? price = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? locationsCount = freezed,Object? locations = freezed,}) {
  return _then(SendingMethodModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,locationsCount: freezed == locationsCount ? _self.locationsCount : locationsCount // ignore: cast_nullable_to_non_nullable
as int?,locations: freezed == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<SendingMethodLocationModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SendingMethodModel].
extension SendingMethodModelPatterns on SendingMethodModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendingMethodModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendingMethodModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendingMethodModel value)  $default,){
final _that = this;
switch (_that) {
case _SendingMethodModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendingMethodModel value)?  $default,){
final _that = this;
switch (_that) {
case _SendingMethodModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(fromJson: _anyToString)  String? title, @JsonKey(fromJson: _anyToInt)  int? price, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt, @JsonKey(name: 'locations_count', fromJson: _anyToInt)  int? locationsCount,  List<SendingMethodLocationModel>? locations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendingMethodModel() when $default != null:
return $default(_that.id,_that.title,_that.price,_that.status,_that.createdAt,_that.updatedAt,_that.locationsCount,_that.locations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(fromJson: _anyToString)  String? title, @JsonKey(fromJson: _anyToInt)  int? price, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt, @JsonKey(name: 'locations_count', fromJson: _anyToInt)  int? locationsCount,  List<SendingMethodLocationModel>? locations)  $default,) {final _that = this;
switch (_that) {
case _SendingMethodModel():
return $default(_that.id,_that.title,_that.price,_that.status,_that.createdAt,_that.updatedAt,_that.locationsCount,_that.locations);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(fromJson: _anyToString)  String? title, @JsonKey(fromJson: _anyToInt)  int? price, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt, @JsonKey(name: 'locations_count', fromJson: _anyToInt)  int? locationsCount,  List<SendingMethodLocationModel>? locations)?  $default,) {final _that = this;
switch (_that) {
case _SendingMethodModel() when $default != null:
return $default(_that.id,_that.title,_that.price,_that.status,_that.createdAt,_that.updatedAt,_that.locationsCount,_that.locations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendingMethodModel extends SendingMethodModel {
  const _SendingMethodModel({@JsonKey(fromJson: _anyToString) this.id, @JsonKey(fromJson: _anyToString) this.title, @JsonKey(fromJson: _anyToInt) this.price, @JsonKey(fromJson: _anyToString) this.status, @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt, @JsonKey(name: 'locations_count', fromJson: _anyToInt) this.locationsCount,  List<SendingMethodLocationModel>? locations}): _locations = locations,super._();
  factory _SendingMethodModel.fromJson(Map<String, dynamic> json) => _$SendingMethodModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String? id;
@override@JsonKey(fromJson: _anyToString) final  String? title;
@override@JsonKey(fromJson: _anyToInt) final  int? price;
@override@JsonKey(fromJson: _anyToString) final  String? status;
@override@JsonKey(name: 'created_at', fromJson: _anyToString) final  String? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _anyToString) final  String? updatedAt;
@override@JsonKey(name: 'locations_count', fromJson: _anyToInt) final  int? locationsCount;
 final  List<SendingMethodLocationModel>? _locations;
@override List<SendingMethodLocationModel>? get locations {
  final value = _locations;
  if (value == null) return null;
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SendingMethodModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendingMethodModelCopyWith<_SendingMethodModel> get copyWith => __$SendingMethodModelCopyWithImpl<_SendingMethodModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendingMethodModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendingMethodModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.locationsCount, locationsCount) || other.locationsCount == locationsCount)&&const DeepCollectionEquality().equals(other.locations, _locations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,price,status,createdAt,updatedAt,locationsCount,const DeepCollectionEquality().hash(_locations));
}

@override
String toString() {
    return 'SendingMethodModel(id: $id, title: $title, price: $price, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, locationsCount: $locationsCount, locations: $locations)';
}


}

/// @nodoc
abstract mixin class _$SendingMethodModelCopyWith<$Res> implements $SendingMethodModelCopyWith<$Res> {
  factory _$SendingMethodModelCopyWith(_SendingMethodModel value, $Res Function(_SendingMethodModel) _then) = __$SendingMethodModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(fromJson: _anyToString) String? title,@JsonKey(fromJson: _anyToInt) int? price,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,@JsonKey(name: 'locations_count', fromJson: _anyToInt) int? locationsCount, List<SendingMethodLocationModel>? locations
});




}
/// @nodoc
class __$SendingMethodModelCopyWithImpl<$Res>
    implements _$SendingMethodModelCopyWith<$Res> {
  __$SendingMethodModelCopyWithImpl(this._self, this._then);

  final _SendingMethodModel _self;
  final $Res Function(_SendingMethodModel) _then;

/// Create a copy of SendingMethodModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? price = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? locationsCount = freezed,Object? locations = freezed,}) {
  return _then(_SendingMethodModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,locationsCount: freezed == locationsCount ? _self.locationsCount : locationsCount // ignore: cast_nullable_to_non_nullable
as int?,locations: freezed == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<SendingMethodLocationModel>?,
  ));
}


}


/// @nodoc
mixin _$SendingMethodLocationModel {

@JsonKey(fromJson: _anyToString) String? get id;@JsonKey(fromJson: _anyToString) set id(String? value);@JsonKey(name: 'sending_method_id', fromJson: _anyToString) String? get sendingMethodId;@JsonKey(name: 'sending_method_id', fromJson: _anyToString) set sendingMethodId(String? value);@JsonKey(name: 'ostan_id', fromJson: _anyToInt) int? get ostanId;@JsonKey(name: 'ostan_id', fromJson: _anyToInt) set ostanId(int? value);@JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) int? get shahrestanId;@JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) set shahrestanId(int? value);@JsonKey(fromJson: _anyToInt) int? get price;@JsonKey(fromJson: _anyToInt) set price(int? value);@JsonKey(fromJson: _anyToString) String? get status;@JsonKey(fromJson: _anyToString) set status(String? value);@JsonKey(name: 'created_at', fromJson: _anyToString) String? get createdAt;@JsonKey(name: 'created_at', fromJson: _anyToString) set createdAt(String? value);@JsonKey(name: 'updated_at', fromJson: _anyToString) String? get updatedAt;@JsonKey(name: 'updated_at', fromJson: _anyToString) set updatedAt(String? value);
/// Create a copy of SendingMethodLocationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendingMethodLocationModelCopyWith<SendingMethodLocationModel> get copyWith => _$SendingMethodLocationModelCopyWithImpl<SendingMethodLocationModel>(this as SendingMethodLocationModel, _$identity);

  /// Serializes this SendingMethodLocationModel to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  final _this = this as SendingMethodLocationModel;
  return 'SendingMethodLocationModel(id: ${_this.id}, sendingMethodId: ${_this.sendingMethodId}, ostanId: ${_this.ostanId}, shahrestanId: ${_this.shahrestanId}, price: ${_this.price}, status: ${_this.status}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $SendingMethodLocationModelCopyWith<$Res>  {
  factory $SendingMethodLocationModelCopyWith(SendingMethodLocationModel value, $Res Function(SendingMethodLocationModel) _then) = _$SendingMethodLocationModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(name: 'sending_method_id', fromJson: _anyToString) String? sendingMethodId,@JsonKey(name: 'ostan_id', fromJson: _anyToInt) int? ostanId,@JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) int? shahrestanId,@JsonKey(fromJson: _anyToInt) int? price,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt
});




}
/// @nodoc
class _$SendingMethodLocationModelCopyWithImpl<$Res>
    implements $SendingMethodLocationModelCopyWith<$Res> {
  _$SendingMethodLocationModelCopyWithImpl(this._self, this._then);

  final SendingMethodLocationModel _self;
  final $Res Function(SendingMethodLocationModel) _then;

/// Create a copy of SendingMethodLocationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? sendingMethodId = freezed,Object? ostanId = freezed,Object? shahrestanId = freezed,Object? price = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(SendingMethodLocationModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,sendingMethodId: freezed == sendingMethodId ? _self.sendingMethodId : sendingMethodId // ignore: cast_nullable_to_non_nullable
as String?,ostanId: freezed == ostanId ? _self.ostanId : ostanId // ignore: cast_nullable_to_non_nullable
as int?,shahrestanId: freezed == shahrestanId ? _self.shahrestanId : shahrestanId // ignore: cast_nullable_to_non_nullable
as int?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SendingMethodLocationModel].
extension SendingMethodLocationModelPatterns on SendingMethodLocationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendingMethodLocationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendingMethodLocationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendingMethodLocationModel value)  $default,){
final _that = this;
switch (_that) {
case _SendingMethodLocationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendingMethodLocationModel value)?  $default,){
final _that = this;
switch (_that) {
case _SendingMethodLocationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(name: 'sending_method_id', fromJson: _anyToString)  String? sendingMethodId, @JsonKey(name: 'ostan_id', fromJson: _anyToInt)  int? ostanId, @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt)  int? shahrestanId, @JsonKey(fromJson: _anyToInt)  int? price, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendingMethodLocationModel() when $default != null:
return $default(_that.id,_that.sendingMethodId,_that.ostanId,_that.shahrestanId,_that.price,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(name: 'sending_method_id', fromJson: _anyToString)  String? sendingMethodId, @JsonKey(name: 'ostan_id', fromJson: _anyToInt)  int? ostanId, @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt)  int? shahrestanId, @JsonKey(fromJson: _anyToInt)  int? price, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SendingMethodLocationModel():
return $default(_that.id,_that.sendingMethodId,_that.ostanId,_that.shahrestanId,_that.price,_that.status,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(name: 'sending_method_id', fromJson: _anyToString)  String? sendingMethodId, @JsonKey(name: 'ostan_id', fromJson: _anyToInt)  int? ostanId, @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt)  int? shahrestanId, @JsonKey(fromJson: _anyToInt)  int? price, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SendingMethodLocationModel() when $default != null:
return $default(_that.id,_that.sendingMethodId,_that.ostanId,_that.shahrestanId,_that.price,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendingMethodLocationModel extends SendingMethodLocationModel {
   _SendingMethodLocationModel({@JsonKey(fromJson: _anyToString) this.id, @JsonKey(name: 'sending_method_id', fromJson: _anyToString) this.sendingMethodId, @JsonKey(name: 'ostan_id', fromJson: _anyToInt) this.ostanId, @JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) this.shahrestanId, @JsonKey(fromJson: _anyToInt) this.price, @JsonKey(fromJson: _anyToString) this.status, @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt}): super._();
  factory _SendingMethodLocationModel.fromJson(Map<String, dynamic> json) => _$SendingMethodLocationModelFromJson(json);

@override@JsonKey(fromJson: _anyToString)  String? id;
@override@JsonKey(name: 'sending_method_id', fromJson: _anyToString)  String? sendingMethodId;
@override@JsonKey(name: 'ostan_id', fromJson: _anyToInt)  int? ostanId;
@override@JsonKey(name: 'shahrestan_id', fromJson: _anyToInt)  int? shahrestanId;
@override@JsonKey(fromJson: _anyToInt)  int? price;
@override@JsonKey(fromJson: _anyToString)  String? status;
@override@JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt;

/// Create a copy of SendingMethodLocationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendingMethodLocationModelCopyWith<_SendingMethodLocationModel> get copyWith => __$SendingMethodLocationModelCopyWithImpl<_SendingMethodLocationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendingMethodLocationModelToJson(this, );
}



@override
String toString() {
    return 'SendingMethodLocationModel(id: $id, sendingMethodId: $sendingMethodId, ostanId: $ostanId, shahrestanId: $shahrestanId, price: $price, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SendingMethodLocationModelCopyWith<$Res> implements $SendingMethodLocationModelCopyWith<$Res> {
  factory _$SendingMethodLocationModelCopyWith(_SendingMethodLocationModel value, $Res Function(_SendingMethodLocationModel) _then) = __$SendingMethodLocationModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(name: 'sending_method_id', fromJson: _anyToString) String? sendingMethodId,@JsonKey(name: 'ostan_id', fromJson: _anyToInt) int? ostanId,@JsonKey(name: 'shahrestan_id', fromJson: _anyToInt) int? shahrestanId,@JsonKey(fromJson: _anyToInt) int? price,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt
});




}
/// @nodoc
class __$SendingMethodLocationModelCopyWithImpl<$Res>
    implements _$SendingMethodLocationModelCopyWith<$Res> {
  __$SendingMethodLocationModelCopyWithImpl(this._self, this._then);

  final _SendingMethodLocationModel _self;
  final $Res Function(_SendingMethodLocationModel) _then;

/// Create a copy of SendingMethodLocationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? sendingMethodId = freezed,Object? ostanId = freezed,Object? shahrestanId = freezed,Object? price = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_SendingMethodLocationModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,sendingMethodId: freezed == sendingMethodId ? _self.sendingMethodId : sendingMethodId // ignore: cast_nullable_to_non_nullable
as String?,ostanId: freezed == ostanId ? _self.ostanId : ostanId // ignore: cast_nullable_to_non_nullable
as int?,shahrestanId: freezed == shahrestanId ? _self.shahrestanId : shahrestanId // ignore: cast_nullable_to_non_nullable
as int?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
