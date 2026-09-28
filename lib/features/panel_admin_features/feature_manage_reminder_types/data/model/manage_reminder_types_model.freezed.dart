// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_reminder_types_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManageReminderTypeModel {

@JsonKey(fromJson: _anyToString) String? get id;@JsonKey(name: 'reminder_type_id', fromJson: _anyToString) String? get reminderTypeId;@JsonKey(fromJson: _anyToString) String? get title;@JsonKey(fromJson: _anyToString) String? get status;@JsonKey(name: 'sort_order', fromJson: _anyToInt) int? get sortOrder;@JsonKey(name: 'created_at', fromJson: _anyToString) String? get createdAt;@JsonKey(name: 'updated_at', fromJson: _anyToString) String? get updatedAt;@JsonKey(name: 'active_sub_items') List<ManageReminderTypeModel>? get subCategories;
/// Create a copy of ManageReminderTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManageReminderTypeModelCopyWith<ManageReminderTypeModel> get copyWith => _$ManageReminderTypeModelCopyWithImpl<ManageReminderTypeModel>(this as ManageReminderTypeModel, _$identity);

  /// Serializes this ManageReminderTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ManageReminderTypeModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageReminderTypeModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.reminderTypeId, _this.reminderTypeId) || other.reminderTypeId == _this.reminderTypeId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.sortOrder, _this.sortOrder) || other.sortOrder == _this.sortOrder)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&const DeepCollectionEquality().equals(other.subCategories, _this.subCategories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ManageReminderTypeModel;
  return Object.hash(runtimeType,_this.id,_this.reminderTypeId,_this.title,_this.status,_this.sortOrder,_this.createdAt,_this.updatedAt,const DeepCollectionEquality().hash(_this.subCategories));
}

@override
String toString() {
  final _this = this as ManageReminderTypeModel;
  return 'ManageReminderTypeModel(id: ${_this.id}, reminderTypeId: ${_this.reminderTypeId}, title: ${_this.title}, status: ${_this.status}, sortOrder: ${_this.sortOrder}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, subCategories: ${_this.subCategories})';
}


}

/// @nodoc
abstract mixin class $ManageReminderTypeModelCopyWith<$Res>  {
  factory $ManageReminderTypeModelCopyWith(ManageReminderTypeModel value, $Res Function(ManageReminderTypeModel) _then) = _$ManageReminderTypeModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(name: 'reminder_type_id', fromJson: _anyToString) String? reminderTypeId,@JsonKey(fromJson: _anyToString) String? title,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'sort_order', fromJson: _anyToInt) int? sortOrder,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,@JsonKey(name: 'active_sub_items') List<ManageReminderTypeModel>? subCategories
});




}
/// @nodoc
class _$ManageReminderTypeModelCopyWithImpl<$Res>
    implements $ManageReminderTypeModelCopyWith<$Res> {
  _$ManageReminderTypeModelCopyWithImpl(this._self, this._then);

  final ManageReminderTypeModel _self;
  final $Res Function(ManageReminderTypeModel) _then;

/// Create a copy of ManageReminderTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? reminderTypeId = freezed,Object? title = freezed,Object? status = freezed,Object? sortOrder = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? subCategories = freezed,}) {
  return _then(ManageReminderTypeModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,reminderTypeId: freezed == reminderTypeId ? _self.reminderTypeId : reminderTypeId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,subCategories: freezed == subCategories ? _self.subCategories : subCategories // ignore: cast_nullable_to_non_nullable
as List<ManageReminderTypeModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ManageReminderTypeModel].
extension ManageReminderTypeModelPatterns on ManageReminderTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManageReminderTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManageReminderTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManageReminderTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _ManageReminderTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManageReminderTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _ManageReminderTypeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(name: 'reminder_type_id', fromJson: _anyToString)  String? reminderTypeId, @JsonKey(fromJson: _anyToString)  String? title, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'sort_order', fromJson: _anyToInt)  int? sortOrder, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt, @JsonKey(name: 'active_sub_items')  List<ManageReminderTypeModel>? subCategories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManageReminderTypeModel() when $default != null:
return $default(_that.id,_that.reminderTypeId,_that.title,_that.status,_that.sortOrder,_that.createdAt,_that.updatedAt,_that.subCategories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(name: 'reminder_type_id', fromJson: _anyToString)  String? reminderTypeId, @JsonKey(fromJson: _anyToString)  String? title, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'sort_order', fromJson: _anyToInt)  int? sortOrder, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt, @JsonKey(name: 'active_sub_items')  List<ManageReminderTypeModel>? subCategories)  $default,) {final _that = this;
switch (_that) {
case _ManageReminderTypeModel():
return $default(_that.id,_that.reminderTypeId,_that.title,_that.status,_that.sortOrder,_that.createdAt,_that.updatedAt,_that.subCategories);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(name: 'reminder_type_id', fromJson: _anyToString)  String? reminderTypeId, @JsonKey(fromJson: _anyToString)  String? title, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'sort_order', fromJson: _anyToInt)  int? sortOrder, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt, @JsonKey(name: 'active_sub_items')  List<ManageReminderTypeModel>? subCategories)?  $default,) {final _that = this;
switch (_that) {
case _ManageReminderTypeModel() when $default != null:
return $default(_that.id,_that.reminderTypeId,_that.title,_that.status,_that.sortOrder,_that.createdAt,_that.updatedAt,_that.subCategories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManageReminderTypeModel extends ManageReminderTypeModel {
  const _ManageReminderTypeModel({@JsonKey(fromJson: _anyToString) this.id, @JsonKey(name: 'reminder_type_id', fromJson: _anyToString) this.reminderTypeId, @JsonKey(fromJson: _anyToString) this.title, @JsonKey(fromJson: _anyToString) this.status, @JsonKey(name: 'sort_order', fromJson: _anyToInt) this.sortOrder, @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt, @JsonKey(name: 'active_sub_items')  List<ManageReminderTypeModel>? subCategories}): _subCategories = subCategories,super._();
  factory _ManageReminderTypeModel.fromJson(Map<String, dynamic> json) => _$ManageReminderTypeModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String? id;
@override@JsonKey(name: 'reminder_type_id', fromJson: _anyToString) final  String? reminderTypeId;
@override@JsonKey(fromJson: _anyToString) final  String? title;
@override@JsonKey(fromJson: _anyToString) final  String? status;
@override@JsonKey(name: 'sort_order', fromJson: _anyToInt) final  int? sortOrder;
@override@JsonKey(name: 'created_at', fromJson: _anyToString) final  String? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _anyToString) final  String? updatedAt;
 final  List<ManageReminderTypeModel>? _subCategories;
@override@JsonKey(name: 'active_sub_items') List<ManageReminderTypeModel>? get subCategories {
  final value = _subCategories;
  if (value == null) return null;
  if (_subCategories is EqualUnmodifiableListView) return _subCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ManageReminderTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManageReminderTypeModelCopyWith<_ManageReminderTypeModel> get copyWith => __$ManageReminderTypeModelCopyWithImpl<_ManageReminderTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManageReminderTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManageReminderTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reminderTypeId, reminderTypeId) || other.reminderTypeId == reminderTypeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.subCategories, _subCategories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,reminderTypeId,title,status,sortOrder,createdAt,updatedAt,const DeepCollectionEquality().hash(_subCategories));
}

@override
String toString() {
    return 'ManageReminderTypeModel(id: $id, reminderTypeId: $reminderTypeId, title: $title, status: $status, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt, subCategories: $subCategories)';
}


}

/// @nodoc
abstract mixin class _$ManageReminderTypeModelCopyWith<$Res> implements $ManageReminderTypeModelCopyWith<$Res> {
  factory _$ManageReminderTypeModelCopyWith(_ManageReminderTypeModel value, $Res Function(_ManageReminderTypeModel) _then) = __$ManageReminderTypeModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(name: 'reminder_type_id', fromJson: _anyToString) String? reminderTypeId,@JsonKey(fromJson: _anyToString) String? title,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'sort_order', fromJson: _anyToInt) int? sortOrder,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,@JsonKey(name: 'active_sub_items') List<ManageReminderTypeModel>? subCategories
});




}
/// @nodoc
class __$ManageReminderTypeModelCopyWithImpl<$Res>
    implements _$ManageReminderTypeModelCopyWith<$Res> {
  __$ManageReminderTypeModelCopyWithImpl(this._self, this._then);

  final _ManageReminderTypeModel _self;
  final $Res Function(_ManageReminderTypeModel) _then;

/// Create a copy of ManageReminderTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? reminderTypeId = freezed,Object? title = freezed,Object? status = freezed,Object? sortOrder = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? subCategories = freezed,}) {
  return _then(_ManageReminderTypeModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,reminderTypeId: freezed == reminderTypeId ? _self.reminderTypeId : reminderTypeId // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,subCategories: freezed == subCategories ? _self._subCategories : subCategories // ignore: cast_nullable_to_non_nullable
as List<ManageReminderTypeModel>?,
  ));
}


}

// dart format on
