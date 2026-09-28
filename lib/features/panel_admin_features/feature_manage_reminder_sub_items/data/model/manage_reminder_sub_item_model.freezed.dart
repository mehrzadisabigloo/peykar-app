// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_reminder_sub_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManageReminderSubItemModel {

@JsonKey(fromJson: _anyToString) String? get id;@JsonKey(fromJson: _anyToString) String? get title;@JsonKey(fromJson: _anyToString) String? get status;@JsonKey(name: 'reminder_type_id', fromJson: _anyToString) String? get reminderTypeId;@JsonKey(name: 'created_at', fromJson: _anyToString) String? get createdAt;@JsonKey(name: 'updated_at', fromJson: _anyToString) String? get updatedAt;
/// Create a copy of ManageReminderSubItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManageReminderSubItemModelCopyWith<ManageReminderSubItemModel> get copyWith => _$ManageReminderSubItemModelCopyWithImpl<ManageReminderSubItemModel>(this as ManageReminderSubItemModel, _$identity);

  /// Serializes this ManageReminderSubItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ManageReminderSubItemModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageReminderSubItemModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.reminderTypeId, _this.reminderTypeId) || other.reminderTypeId == _this.reminderTypeId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ManageReminderSubItemModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.status,_this.reminderTypeId,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as ManageReminderSubItemModel;
  return 'ManageReminderSubItemModel(id: ${_this.id}, title: ${_this.title}, status: ${_this.status}, reminderTypeId: ${_this.reminderTypeId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $ManageReminderSubItemModelCopyWith<$Res>  {
  factory $ManageReminderSubItemModelCopyWith(ManageReminderSubItemModel value, $Res Function(ManageReminderSubItemModel) _then) = _$ManageReminderSubItemModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(fromJson: _anyToString) String? title,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'reminder_type_id', fromJson: _anyToString) String? reminderTypeId,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt
});




}
/// @nodoc
class _$ManageReminderSubItemModelCopyWithImpl<$Res>
    implements $ManageReminderSubItemModelCopyWith<$Res> {
  _$ManageReminderSubItemModelCopyWithImpl(this._self, this._then);

  final ManageReminderSubItemModel _self;
  final $Res Function(ManageReminderSubItemModel) _then;

/// Create a copy of ManageReminderSubItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? status = freezed,Object? reminderTypeId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(ManageReminderSubItemModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,reminderTypeId: freezed == reminderTypeId ? _self.reminderTypeId : reminderTypeId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ManageReminderSubItemModel].
extension ManageReminderSubItemModelPatterns on ManageReminderSubItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManageReminderSubItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManageReminderSubItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManageReminderSubItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ManageReminderSubItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManageReminderSubItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ManageReminderSubItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(fromJson: _anyToString)  String? title, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'reminder_type_id', fromJson: _anyToString)  String? reminderTypeId, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManageReminderSubItemModel() when $default != null:
return $default(_that.id,_that.title,_that.status,_that.reminderTypeId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(fromJson: _anyToString)  String? title, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'reminder_type_id', fromJson: _anyToString)  String? reminderTypeId, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ManageReminderSubItemModel():
return $default(_that.id,_that.title,_that.status,_that.reminderTypeId,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String? id, @JsonKey(fromJson: _anyToString)  String? title, @JsonKey(fromJson: _anyToString)  String? status, @JsonKey(name: 'reminder_type_id', fromJson: _anyToString)  String? reminderTypeId, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ManageReminderSubItemModel() when $default != null:
return $default(_that.id,_that.title,_that.status,_that.reminderTypeId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManageReminderSubItemModel extends ManageReminderSubItemModel {
  const _ManageReminderSubItemModel({@JsonKey(fromJson: _anyToString) this.id, @JsonKey(fromJson: _anyToString) this.title, @JsonKey(fromJson: _anyToString) this.status, @JsonKey(name: 'reminder_type_id', fromJson: _anyToString) this.reminderTypeId, @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt}): super._();
  factory _ManageReminderSubItemModel.fromJson(Map<String, dynamic> json) => _$ManageReminderSubItemModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String? id;
@override@JsonKey(fromJson: _anyToString) final  String? title;
@override@JsonKey(fromJson: _anyToString) final  String? status;
@override@JsonKey(name: 'reminder_type_id', fromJson: _anyToString) final  String? reminderTypeId;
@override@JsonKey(name: 'created_at', fromJson: _anyToString) final  String? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _anyToString) final  String? updatedAt;

/// Create a copy of ManageReminderSubItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManageReminderSubItemModelCopyWith<_ManageReminderSubItemModel> get copyWith => __$ManageReminderSubItemModelCopyWithImpl<_ManageReminderSubItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManageReminderSubItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManageReminderSubItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.reminderTypeId, reminderTypeId) || other.reminderTypeId == reminderTypeId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,status,reminderTypeId,createdAt,updatedAt);
}

@override
String toString() {
    return 'ManageReminderSubItemModel(id: $id, title: $title, status: $status, reminderTypeId: $reminderTypeId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ManageReminderSubItemModelCopyWith<$Res> implements $ManageReminderSubItemModelCopyWith<$Res> {
  factory _$ManageReminderSubItemModelCopyWith(_ManageReminderSubItemModel value, $Res Function(_ManageReminderSubItemModel) _then) = __$ManageReminderSubItemModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String? id,@JsonKey(fromJson: _anyToString) String? title,@JsonKey(fromJson: _anyToString) String? status,@JsonKey(name: 'reminder_type_id', fromJson: _anyToString) String? reminderTypeId,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt
});




}
/// @nodoc
class __$ManageReminderSubItemModelCopyWithImpl<$Res>
    implements _$ManageReminderSubItemModelCopyWith<$Res> {
  __$ManageReminderSubItemModelCopyWithImpl(this._self, this._then);

  final _ManageReminderSubItemModel _self;
  final $Res Function(_ManageReminderSubItemModel) _then;

/// Create a copy of ManageReminderSubItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? status = freezed,Object? reminderTypeId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ManageReminderSubItemModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,reminderTypeId: freezed == reminderTypeId ? _self.reminderTypeId : reminderTypeId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
