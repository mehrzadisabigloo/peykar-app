// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManageServiceModel {

@JsonKey(fromJson: _anyToString) String? get id;@JsonKey(fromJson: _anyToString) String? get title;@JsonKey(fromJson: _anyToString) String? get description;@JsonKey(fromJson: _imagesFromJson) List<String>? get images;@JsonKey(fromJson: _keywordsFromJson) List<String>? get keywords;@JsonKey(readValue: _priceMinFromJson) double? get priceMin;@JsonKey(readValue: _priceMaxFromJson) double? get priceMax;@JsonKey(fromJson: _anyToString) String? get status;@JsonKey(name: 'created_at', fromJson: _anyToString) String? get createdAt;@JsonKey(name: 'updated_at', fromJson: _anyToString) String? get updatedAt; OccupationModel? get occupation;
/// Create a copy of ManageServiceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManageServiceModelCopyWith<ManageServiceModel> get copyWith => _$ManageServiceModelCopyWithImpl<ManageServiceModel>(this as ManageServiceModel, _$identity);

  /// Serializes this ManageServiceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ManageServiceModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageServiceModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&const DeepCollectionEquality().equals(other.images, _this.images)&&const DeepCollectionEquality().equals(other.keywords, _this.keywords)&&(identical(other.priceMin, _this.priceMin) || other.priceMin == _this.priceMin)&&(identical(other.priceMax, _this.priceMax) || other.priceMax == _this.priceMax)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.occupation, _this.occupation) || other.occupation == _this.occupation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ManageServiceModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.description,const DeepCollectionEquality().hash(_this.images),const DeepCollectionEquality().hash(_this.keywords),_this.priceMin,_this.priceMax,_this.status,_this.createdAt,_this.updatedAt,_this.occupation);
}

@override
String toString() {
  final _this = this as ManageServiceModel;
  return 'ManageServiceModel(id: ${_this.id}, title: ${_this.title}, description: ${_this.description}, images: ${_this.images}, keywords: ${_this.keywords}, priceMin: ${_this.priceMin}, priceMax: ${_this.priceMax}, status: ${_this.status}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, occupation: ${_this.occupation})';
}


}

/// @nodoc
abstract mixin class $ManageServiceModelCopyWith<$Res>  {
  factory $ManageServiceModelCopyWith(ManageServiceModel value, $Res Function(ManageServiceModel) _then) = _$ManageServiceModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(fromJson: _anyToString) String? title,@JsonKey(fromJson: _anyToString) String? description,@JsonKey(fromJson: _imagesFromJson) List<String>? images,@JsonKey(fromJson: _keywordsFromJson) List<String>? keywords,@JsonKey(readValue: _priceMinFromJson) double? priceMin,@JsonKey(readValue: _priceMaxFromJson) double? priceMax,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt, OccupationModel? occupation
});


$OccupationModelCopyWith<$Res>? get occupation;

}
/// @nodoc
class _$ManageServiceModelCopyWithImpl<$Res>
    implements $ManageServiceModelCopyWith<$Res> {
  _$ManageServiceModelCopyWithImpl(this._self, this._then);

  final ManageServiceModel _self;
  final $Res Function(ManageServiceModel) _then;

/// Create a copy of ManageServiceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? description = freezed,Object? images = freezed,Object? keywords = freezed,Object? priceMin = freezed,Object? priceMax = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? occupation = freezed,}) {
  return _then(ManageServiceModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,keywords: freezed == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>?,priceMin: freezed == priceMin ? _self.priceMin : priceMin // ignore: cast_nullable_to_non_nullable
as double?,priceMax: freezed == priceMax ? _self.priceMax : priceMax // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,occupation: freezed == occupation ? _self.occupation : occupation // ignore: cast_nullable_to_non_nullable
as OccupationModel?,
  ));
}
/// Create a copy of ManageServiceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OccupationModelCopyWith<$Res>? get occupation {
    if (_self.occupation == null) {
    return null;
  }

  return $OccupationModelCopyWith<$Res>(_self.occupation!, (value) {
    return _then(_self.copyWith(occupation: value));
  });
}
}


/// Adds pattern-matching-related methods to [ManageServiceModel].
extension ManageServiceModelPatterns on ManageServiceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManageServiceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManageServiceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManageServiceModel value)  $default,){
final _that = this;
switch (_that) {
case _ManageServiceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManageServiceModel value)?  $default,){
final _that = this;
switch (_that) {
case _ManageServiceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(fromJson: _anyToString)  String? title, @JsonKey(fromJson: _anyToString)  String? description, @JsonKey(fromJson: _imagesFromJson)  List<String>? images, @JsonKey(fromJson: _keywordsFromJson)  List<String>? keywords, @JsonKey(readValue: _priceMinFromJson)  double? priceMin, @JsonKey(readValue: _priceMaxFromJson)  double? priceMax, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt,  OccupationModel? occupation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManageServiceModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.images,_that.keywords,_that.priceMin,_that.priceMax,_that.status,_that.createdAt,_that.updatedAt,_that.occupation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(fromJson: _anyToString)  String? title, @JsonKey(fromJson: _anyToString)  String? description, @JsonKey(fromJson: _imagesFromJson)  List<String>? images, @JsonKey(fromJson: _keywordsFromJson)  List<String>? keywords, @JsonKey(readValue: _priceMinFromJson)  double? priceMin, @JsonKey(readValue: _priceMaxFromJson)  double? priceMax, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt,  OccupationModel? occupation)  $default,) {final _that = this;
switch (_that) {
case _ManageServiceModel():
return $default(_that.id,_that.title,_that.description,_that.images,_that.keywords,_that.priceMin,_that.priceMax,_that.status,_that.createdAt,_that.updatedAt,_that.occupation);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(fromJson: _anyToString)  String? title, @JsonKey(fromJson: _anyToString)  String? description, @JsonKey(fromJson: _imagesFromJson)  List<String>? images, @JsonKey(fromJson: _keywordsFromJson)  List<String>? keywords, @JsonKey(readValue: _priceMinFromJson)  double? priceMin, @JsonKey(readValue: _priceMaxFromJson)  double? priceMax, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt,  OccupationModel? occupation)?  $default,) {final _that = this;
switch (_that) {
case _ManageServiceModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.images,_that.keywords,_that.priceMin,_that.priceMax,_that.status,_that.createdAt,_that.updatedAt,_that.occupation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManageServiceModel extends ManageServiceModel {
  const _ManageServiceModel({@JsonKey(fromJson: _anyToString) this.id, @JsonKey(fromJson: _anyToString) this.title, @JsonKey(fromJson: _anyToString) this.description, @JsonKey(fromJson: _imagesFromJson)  List<String>? images, @JsonKey(fromJson: _keywordsFromJson)  List<String>? keywords, @JsonKey(readValue: _priceMinFromJson) this.priceMin, @JsonKey(readValue: _priceMaxFromJson) this.priceMax, @JsonKey(fromJson: _anyToString) this.status, @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt, this.occupation}): _images = images,_keywords = keywords,super._();
  factory _ManageServiceModel.fromJson(Map<String, dynamic> json) => _$ManageServiceModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String? id;
@override@JsonKey(fromJson: _anyToString) final  String? title;
@override@JsonKey(fromJson: _anyToString) final  String? description;
 final  List<String>? _images;
@override@JsonKey(fromJson: _imagesFromJson) List<String>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _keywords;
@override@JsonKey(fromJson: _keywordsFromJson) List<String>? get keywords {
  final value = _keywords;
  if (value == null) return null;
  if (_keywords is EqualUnmodifiableListView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(readValue: _priceMinFromJson) final  double? priceMin;
@override@JsonKey(readValue: _priceMaxFromJson) final  double? priceMax;
@override@JsonKey(fromJson: _anyToString) final  String? status;
@override@JsonKey(name: 'created_at', fromJson: _anyToString) final  String? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _anyToString) final  String? updatedAt;
@override final  OccupationModel? occupation;

/// Create a copy of ManageServiceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManageServiceModelCopyWith<_ManageServiceModel> get copyWith => __$ManageServiceModelCopyWithImpl<_ManageServiceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManageServiceModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManageServiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.images, _images)&&const DeepCollectionEquality().equals(other.keywords, _keywords)&&(identical(other.priceMin, priceMin) || other.priceMin == priceMin)&&(identical(other.priceMax, priceMax) || other.priceMax == priceMax)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.occupation, occupation) || other.occupation == occupation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,description,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_keywords),priceMin,priceMax,status,createdAt,updatedAt,occupation);
}

@override
String toString() {
    return 'ManageServiceModel(id: $id, title: $title, description: $description, images: $images, keywords: $keywords, priceMin: $priceMin, priceMax: $priceMax, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, occupation: $occupation)';
}


}

/// @nodoc
abstract mixin class _$ManageServiceModelCopyWith<$Res> implements $ManageServiceModelCopyWith<$Res> {
  factory _$ManageServiceModelCopyWith(_ManageServiceModel value, $Res Function(_ManageServiceModel) _then) = __$ManageServiceModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(fromJson: _anyToString) String? title,@JsonKey(fromJson: _anyToString) String? description,@JsonKey(fromJson: _imagesFromJson) List<String>? images,@JsonKey(fromJson: _keywordsFromJson) List<String>? keywords,@JsonKey(readValue: _priceMinFromJson) double? priceMin,@JsonKey(readValue: _priceMaxFromJson) double? priceMax,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt, OccupationModel? occupation
});


@override $OccupationModelCopyWith<$Res>? get occupation;

}
/// @nodoc
class __$ManageServiceModelCopyWithImpl<$Res>
    implements _$ManageServiceModelCopyWith<$Res> {
  __$ManageServiceModelCopyWithImpl(this._self, this._then);

  final _ManageServiceModel _self;
  final $Res Function(_ManageServiceModel) _then;

/// Create a copy of ManageServiceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? description = freezed,Object? images = freezed,Object? keywords = freezed,Object? priceMin = freezed,Object? priceMax = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? occupation = freezed,}) {
  return _then(_ManageServiceModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,keywords: freezed == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>?,priceMin: freezed == priceMin ? _self.priceMin : priceMin // ignore: cast_nullable_to_non_nullable
as double?,priceMax: freezed == priceMax ? _self.priceMax : priceMax // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,occupation: freezed == occupation ? _self.occupation : occupation // ignore: cast_nullable_to_non_nullable
as OccupationModel?,
  ));
}

/// Create a copy of ManageServiceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OccupationModelCopyWith<$Res>? get occupation {
    if (_self.occupation == null) {
    return null;
  }

  return $OccupationModelCopyWith<$Res>(_self.occupation!, (value) {
    return _then(_self.copyWith(occupation: value));
  });
}
}

// dart format on
