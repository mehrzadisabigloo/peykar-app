// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_rating_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManageRatingListModel {

@JsonKey(name: 'current_page') int get currentPage; List<ManageRatingModel> get data;@JsonKey(name: 'last_page') int get lastPage; int get total;
/// Create a copy of ManageRatingListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManageRatingListModelCopyWith<ManageRatingListModel> get copyWith => _$ManageRatingListModelCopyWithImpl<ManageRatingListModel>(this as ManageRatingListModel, _$identity);

  /// Serializes this ManageRatingListModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ManageRatingListModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageRatingListModel&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&const DeepCollectionEquality().equals(other.data, _this.data)&&(identical(other.lastPage, _this.lastPage) || other.lastPage == _this.lastPage)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ManageRatingListModel;
  return Object.hash(runtimeType,_this.currentPage,const DeepCollectionEquality().hash(_this.data),_this.lastPage,_this.total);
}

@override
String toString() {
  final _this = this as ManageRatingListModel;
  return 'ManageRatingListModel(currentPage: ${_this.currentPage}, data: ${_this.data}, lastPage: ${_this.lastPage}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $ManageRatingListModelCopyWith<$Res>  {
  factory $ManageRatingListModelCopyWith(ManageRatingListModel value, $Res Function(ManageRatingListModel) _then) = _$ManageRatingListModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage, List<ManageRatingModel> data,@JsonKey(name: 'last_page') int lastPage, int total
});




}
/// @nodoc
class _$ManageRatingListModelCopyWithImpl<$Res>
    implements $ManageRatingListModelCopyWith<$Res> {
  _$ManageRatingListModelCopyWithImpl(this._self, this._then);

  final ManageRatingListModel _self;
  final $Res Function(ManageRatingListModel) _then;

/// Create a copy of ManageRatingListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? data = null,Object? lastPage = null,Object? total = null,}) {
  return _then(ManageRatingListModel(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ManageRatingModel>,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ManageRatingListModel].
extension ManageRatingListModelPatterns on ManageRatingListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManageRatingListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManageRatingListModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManageRatingListModel value)  $default,){
final _that = this;
switch (_that) {
case _ManageRatingListModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManageRatingListModel value)?  $default,){
final _that = this;
switch (_that) {
case _ManageRatingListModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage,  List<ManageRatingModel> data, @JsonKey(name: 'last_page')  int lastPage,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManageRatingListModel() when $default != null:
return $default(_that.currentPage,_that.data,_that.lastPage,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage,  List<ManageRatingModel> data, @JsonKey(name: 'last_page')  int lastPage,  int total)  $default,) {final _that = this;
switch (_that) {
case _ManageRatingListModel():
return $default(_that.currentPage,_that.data,_that.lastPage,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page')  int currentPage,  List<ManageRatingModel> data, @JsonKey(name: 'last_page')  int lastPage,  int total)?  $default,) {final _that = this;
switch (_that) {
case _ManageRatingListModel() when $default != null:
return $default(_that.currentPage,_that.data,_that.lastPage,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManageRatingListModel extends ManageRatingListModel {
  const _ManageRatingListModel({@JsonKey(name: 'current_page') required this.currentPage, required  List<ManageRatingModel> data, @JsonKey(name: 'last_page') required this.lastPage, required this.total}): _data = data,super._();
  factory _ManageRatingListModel.fromJson(Map<String, dynamic> json) => _$ManageRatingListModelFromJson(json);

@override@JsonKey(name: 'current_page') final  int currentPage;
 final  List<ManageRatingModel> _data;
@override List<ManageRatingModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey(name: 'last_page') final  int lastPage;
@override final  int total;

/// Create a copy of ManageRatingListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManageRatingListModelCopyWith<_ManageRatingListModel> get copyWith => __$ManageRatingListModelCopyWithImpl<_ManageRatingListModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManageRatingListModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManageRatingListModel&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other.data, _data)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,currentPage,const DeepCollectionEquality().hash(_data),lastPage,total);
}

@override
String toString() {
    return 'ManageRatingListModel(currentPage: $currentPage, data: $data, lastPage: $lastPage, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ManageRatingListModelCopyWith<$Res> implements $ManageRatingListModelCopyWith<$Res> {
  factory _$ManageRatingListModelCopyWith(_ManageRatingListModel value, $Res Function(_ManageRatingListModel) _then) = __$ManageRatingListModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage, List<ManageRatingModel> data,@JsonKey(name: 'last_page') int lastPage, int total
});




}
/// @nodoc
class __$ManageRatingListModelCopyWithImpl<$Res>
    implements _$ManageRatingListModelCopyWith<$Res> {
  __$ManageRatingListModelCopyWithImpl(this._self, this._then);

  final _ManageRatingListModel _self;
  final $Res Function(_ManageRatingListModel) _then;

/// Create a copy of ManageRatingListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? data = null,Object? lastPage = null,Object? total = null,}) {
  return _then(_ManageRatingListModel(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ManageRatingModel>,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
