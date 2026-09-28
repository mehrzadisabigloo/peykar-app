// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_services_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManageServicesModel {

@JsonKey(fromJson: _anyToString) String get id;@JsonKey(name: 'repairman_id', fromJson: _anyToString) String? get repairmanId;@JsonKey(fromJson: _anyToString) String get title;@JsonKey(fromJson: _anyToString) String get description;@JsonKey(fromJson: _imagesFromJson) List<String> get images;@JsonKey(fromJson: _keywordsFromJson) List<String> get keywords;@JsonKey(name: 'price_min', fromJson: _anyToDouble) double get priceMin;@JsonKey(name: 'price_max', fromJson: _anyToDouble) double get priceMax;@JsonKey(fromJson: _anyToString) String get status; RepairmanModel? get repairman;
/// Create a copy of ManageServicesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManageServicesModelCopyWith<ManageServicesModel> get copyWith => _$ManageServicesModelCopyWithImpl<ManageServicesModel>(this as ManageServicesModel, _$identity);

  /// Serializes this ManageServicesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ManageServicesModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageServicesModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.repairmanId, _this.repairmanId) || other.repairmanId == _this.repairmanId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&const DeepCollectionEquality().equals(other.images, _this.images)&&const DeepCollectionEquality().equals(other.keywords, _this.keywords)&&(identical(other.priceMin, _this.priceMin) || other.priceMin == _this.priceMin)&&(identical(other.priceMax, _this.priceMax) || other.priceMax == _this.priceMax)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.repairman, _this.repairman) || other.repairman == _this.repairman));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ManageServicesModel;
  return Object.hash(runtimeType,_this.id,_this.repairmanId,_this.title,_this.description,const DeepCollectionEquality().hash(_this.images),const DeepCollectionEquality().hash(_this.keywords),_this.priceMin,_this.priceMax,_this.status,_this.repairman);
}

@override
String toString() {
  final _this = this as ManageServicesModel;
  return 'ManageServicesModel(id: ${_this.id}, repairmanId: ${_this.repairmanId}, title: ${_this.title}, description: ${_this.description}, images: ${_this.images}, keywords: ${_this.keywords}, priceMin: ${_this.priceMin}, priceMax: ${_this.priceMax}, status: ${_this.status}, repairman: ${_this.repairman})';
}


}

/// @nodoc
abstract mixin class $ManageServicesModelCopyWith<$Res>  {
  factory $ManageServicesModelCopyWith(ManageServicesModel value, $Res Function(ManageServicesModel) _then) = _$ManageServicesModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(name: 'repairman_id', fromJson: _anyToString) String? repairmanId,@JsonKey(fromJson: _anyToString) String title,@JsonKey(fromJson: _anyToString) String description,@JsonKey(fromJson: _imagesFromJson) List<String> images,@JsonKey(fromJson: _keywordsFromJson) List<String> keywords,@JsonKey(name: 'price_min', fromJson: _anyToDouble) double priceMin,@JsonKey(name: 'price_max', fromJson: _anyToDouble) double priceMax,@JsonKey(fromJson: _anyToString) String status, RepairmanModel? repairman
});


$RepairmanModelCopyWith<$Res>? get repairman;

}
/// @nodoc
class _$ManageServicesModelCopyWithImpl<$Res>
    implements $ManageServicesModelCopyWith<$Res> {
  _$ManageServicesModelCopyWithImpl(this._self, this._then);

  final ManageServicesModel _self;
  final $Res Function(ManageServicesModel) _then;

/// Create a copy of ManageServicesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? repairmanId = freezed,Object? title = null,Object? description = null,Object? images = null,Object? keywords = null,Object? priceMin = null,Object? priceMax = null,Object? status = null,Object? repairman = freezed,}) {
  return _then(ManageServicesModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,repairmanId: freezed == repairmanId ? _self.repairmanId : repairmanId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,keywords: null == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>,priceMin: null == priceMin ? _self.priceMin : priceMin // ignore: cast_nullable_to_non_nullable
as double,priceMax: null == priceMax ? _self.priceMax : priceMax // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,repairman: freezed == repairman ? _self.repairman : repairman // ignore: cast_nullable_to_non_nullable
as RepairmanModel?,
  ));
}
/// Create a copy of ManageServicesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RepairmanModelCopyWith<$Res>? get repairman {
    if (_self.repairman == null) {
    return null;
  }

  return $RepairmanModelCopyWith<$Res>(_self.repairman!, (value) {
    return _then(_self.copyWith(repairman: value));
  });
}
}


/// Adds pattern-matching-related methods to [ManageServicesModel].
extension ManageServicesModelPatterns on ManageServicesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManageServicesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManageServicesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManageServicesModel value)  $default,){
final _that = this;
switch (_that) {
case _ManageServicesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManageServicesModel value)?  $default,){
final _that = this;
switch (_that) {
case _ManageServicesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'repairman_id', fromJson: _anyToString)  String? repairmanId, @JsonKey(fromJson: _anyToString)  String title, @JsonKey(fromJson: _anyToString)  String description, @JsonKey(fromJson: _imagesFromJson)  List<String> images, @JsonKey(fromJson: _keywordsFromJson)  List<String> keywords, @JsonKey(name: 'price_min', fromJson: _anyToDouble)  double priceMin, @JsonKey(name: 'price_max', fromJson: _anyToDouble)  double priceMax, @JsonKey(fromJson: _anyToString)  String status,  RepairmanModel? repairman)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManageServicesModel() when $default != null:
return $default(_that.id,_that.repairmanId,_that.title,_that.description,_that.images,_that.keywords,_that.priceMin,_that.priceMax,_that.status,_that.repairman);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'repairman_id', fromJson: _anyToString)  String? repairmanId, @JsonKey(fromJson: _anyToString)  String title, @JsonKey(fromJson: _anyToString)  String description, @JsonKey(fromJson: _imagesFromJson)  List<String> images, @JsonKey(fromJson: _keywordsFromJson)  List<String> keywords, @JsonKey(name: 'price_min', fromJson: _anyToDouble)  double priceMin, @JsonKey(name: 'price_max', fromJson: _anyToDouble)  double priceMax, @JsonKey(fromJson: _anyToString)  String status,  RepairmanModel? repairman)  $default,) {final _that = this;
switch (_that) {
case _ManageServicesModel():
return $default(_that.id,_that.repairmanId,_that.title,_that.description,_that.images,_that.keywords,_that.priceMin,_that.priceMax,_that.status,_that.repairman);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'repairman_id', fromJson: _anyToString)  String? repairmanId, @JsonKey(fromJson: _anyToString)  String title, @JsonKey(fromJson: _anyToString)  String description, @JsonKey(fromJson: _imagesFromJson)  List<String> images, @JsonKey(fromJson: _keywordsFromJson)  List<String> keywords, @JsonKey(name: 'price_min', fromJson: _anyToDouble)  double priceMin, @JsonKey(name: 'price_max', fromJson: _anyToDouble)  double priceMax, @JsonKey(fromJson: _anyToString)  String status,  RepairmanModel? repairman)?  $default,) {final _that = this;
switch (_that) {
case _ManageServicesModel() when $default != null:
return $default(_that.id,_that.repairmanId,_that.title,_that.description,_that.images,_that.keywords,_that.priceMin,_that.priceMax,_that.status,_that.repairman);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManageServicesModel extends ManageServicesModel {
  const _ManageServicesModel({@JsonKey(fromJson: _anyToString) this.id = '', @JsonKey(name: 'repairman_id', fromJson: _anyToString) this.repairmanId, @JsonKey(fromJson: _anyToString) this.title = '', @JsonKey(fromJson: _anyToString) this.description = '', @JsonKey(fromJson: _imagesFromJson)  List<String> images = const [], @JsonKey(fromJson: _keywordsFromJson)  List<String> keywords = const [], @JsonKey(name: 'price_min', fromJson: _anyToDouble) this.priceMin = 0.0, @JsonKey(name: 'price_max', fromJson: _anyToDouble) this.priceMax = 0.0, @JsonKey(fromJson: _anyToString) this.status = '', this.repairman}): _images = images,_keywords = keywords,super._();
  factory _ManageServicesModel.fromJson(Map<String, dynamic> json) => _$ManageServicesModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String id;
@override@JsonKey(name: 'repairman_id', fromJson: _anyToString) final  String? repairmanId;
@override@JsonKey(fromJson: _anyToString) final  String title;
@override@JsonKey(fromJson: _anyToString) final  String description;
 final  List<String> _images;
@override@JsonKey(fromJson: _imagesFromJson) List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  List<String> _keywords;
@override@JsonKey(fromJson: _keywordsFromJson) List<String> get keywords {
  if (_keywords is EqualUnmodifiableListView) return _keywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_keywords);
}

@override@JsonKey(name: 'price_min', fromJson: _anyToDouble) final  double priceMin;
@override@JsonKey(name: 'price_max', fromJson: _anyToDouble) final  double priceMax;
@override@JsonKey(fromJson: _anyToString) final  String status;
@override final  RepairmanModel? repairman;

/// Create a copy of ManageServicesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManageServicesModelCopyWith<_ManageServicesModel> get copyWith => __$ManageServicesModelCopyWithImpl<_ManageServicesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManageServicesModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManageServicesModel&&(identical(other.id, id) || other.id == id)&&(identical(other.repairmanId, repairmanId) || other.repairmanId == repairmanId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.images, _images)&&const DeepCollectionEquality().equals(other.keywords, _keywords)&&(identical(other.priceMin, priceMin) || other.priceMin == priceMin)&&(identical(other.priceMax, priceMax) || other.priceMax == priceMax)&&(identical(other.status, status) || other.status == status)&&(identical(other.repairman, repairman) || other.repairman == repairman));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,repairmanId,title,description,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_keywords),priceMin,priceMax,status,repairman);
}

@override
String toString() {
    return 'ManageServicesModel(id: $id, repairmanId: $repairmanId, title: $title, description: $description, images: $images, keywords: $keywords, priceMin: $priceMin, priceMax: $priceMax, status: $status, repairman: $repairman)';
}


}

/// @nodoc
abstract mixin class _$ManageServicesModelCopyWith<$Res> implements $ManageServicesModelCopyWith<$Res> {
  factory _$ManageServicesModelCopyWith(_ManageServicesModel value, $Res Function(_ManageServicesModel) _then) = __$ManageServicesModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(name: 'repairman_id', fromJson: _anyToString) String? repairmanId,@JsonKey(fromJson: _anyToString) String title,@JsonKey(fromJson: _anyToString) String description,@JsonKey(fromJson: _imagesFromJson) List<String> images,@JsonKey(fromJson: _keywordsFromJson) List<String> keywords,@JsonKey(name: 'price_min', fromJson: _anyToDouble) double priceMin,@JsonKey(name: 'price_max', fromJson: _anyToDouble) double priceMax,@JsonKey(fromJson: _anyToString) String status, RepairmanModel? repairman
});


@override $RepairmanModelCopyWith<$Res>? get repairman;

}
/// @nodoc
class __$ManageServicesModelCopyWithImpl<$Res>
    implements _$ManageServicesModelCopyWith<$Res> {
  __$ManageServicesModelCopyWithImpl(this._self, this._then);

  final _ManageServicesModel _self;
  final $Res Function(_ManageServicesModel) _then;

/// Create a copy of ManageServicesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? repairmanId = freezed,Object? title = null,Object? description = null,Object? images = null,Object? keywords = null,Object? priceMin = null,Object? priceMax = null,Object? status = null,Object? repairman = freezed,}) {
  return _then(_ManageServicesModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,repairmanId: freezed == repairmanId ? _self.repairmanId : repairmanId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,keywords: null == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>,priceMin: null == priceMin ? _self.priceMin : priceMin // ignore: cast_nullable_to_non_nullable
as double,priceMax: null == priceMax ? _self.priceMax : priceMax // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,repairman: freezed == repairman ? _self.repairman : repairman // ignore: cast_nullable_to_non_nullable
as RepairmanModel?,
  ));
}

/// Create a copy of ManageServicesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RepairmanModelCopyWith<$Res>? get repairman {
    if (_self.repairman == null) {
    return null;
  }

  return $RepairmanModelCopyWith<$Res>(_self.repairman!, (value) {
    return _then(_self.copyWith(repairman: value));
  });
}
}

// dart format on
