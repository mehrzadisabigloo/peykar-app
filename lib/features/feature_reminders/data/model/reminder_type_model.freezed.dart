// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReminderTypeModel {

@JsonKey(fromJson: _anyToString) String get id;@JsonKey(fromJson: _anyToString) String get title;@JsonKey(fromJson: _anyToString) String get status;@JsonKey(name: 'sort_order', fromJson: _anyToInt) int get sortOrder;@JsonKey(name: 'active_sub_items') List<ReminderSubItemModel> get activeSubItems;
/// Create a copy of ReminderTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderTypeModelCopyWith<ReminderTypeModel> get copyWith => _$ReminderTypeModelCopyWithImpl<ReminderTypeModel>(this as ReminderTypeModel, _$identity);

  /// Serializes this ReminderTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReminderTypeModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderTypeModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.sortOrder, _this.sortOrder) || other.sortOrder == _this.sortOrder)&&const DeepCollectionEquality().equals(other.activeSubItems, _this.activeSubItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReminderTypeModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.status,_this.sortOrder,const DeepCollectionEquality().hash(_this.activeSubItems));
}

@override
String toString() {
  final _this = this as ReminderTypeModel;
  return 'ReminderTypeModel(id: ${_this.id}, title: ${_this.title}, status: ${_this.status}, sortOrder: ${_this.sortOrder}, activeSubItems: ${_this.activeSubItems})';
}


}

/// @nodoc
abstract mixin class $ReminderTypeModelCopyWith<$Res>  {
  factory $ReminderTypeModelCopyWith(ReminderTypeModel value, $Res Function(ReminderTypeModel) _then) = _$ReminderTypeModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(fromJson: _anyToString) String title,@JsonKey(fromJson: _anyToString) String status,@JsonKey(name: 'sort_order', fromJson: _anyToInt) int sortOrder,@JsonKey(name: 'active_sub_items') List<ReminderSubItemModel> activeSubItems
});




}
/// @nodoc
class _$ReminderTypeModelCopyWithImpl<$Res>
    implements $ReminderTypeModelCopyWith<$Res> {
  _$ReminderTypeModelCopyWithImpl(this._self, this._then);

  final ReminderTypeModel _self;
  final $Res Function(ReminderTypeModel) _then;

/// Create a copy of ReminderTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? status = null,Object? sortOrder = null,Object? activeSubItems = null,}) {
  return _then(ReminderTypeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,activeSubItems: null == activeSubItems ? _self.activeSubItems : activeSubItems // ignore: cast_nullable_to_non_nullable
as List<ReminderSubItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReminderTypeModel].
extension ReminderTypeModelPatterns on ReminderTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReminderTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReminderTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReminderTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _ReminderTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReminderTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReminderTypeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(fromJson: _anyToString)  String title, @JsonKey(fromJson: _anyToString)  String status, @JsonKey(name: 'sort_order', fromJson: _anyToInt)  int sortOrder, @JsonKey(name: 'active_sub_items')  List<ReminderSubItemModel> activeSubItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReminderTypeModel() when $default != null:
return $default(_that.id,_that.title,_that.status,_that.sortOrder,_that.activeSubItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(fromJson: _anyToString)  String title, @JsonKey(fromJson: _anyToString)  String status, @JsonKey(name: 'sort_order', fromJson: _anyToInt)  int sortOrder, @JsonKey(name: 'active_sub_items')  List<ReminderSubItemModel> activeSubItems)  $default,) {final _that = this;
switch (_that) {
case _ReminderTypeModel():
return $default(_that.id,_that.title,_that.status,_that.sortOrder,_that.activeSubItems);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(fromJson: _anyToString)  String title, @JsonKey(fromJson: _anyToString)  String status, @JsonKey(name: 'sort_order', fromJson: _anyToInt)  int sortOrder, @JsonKey(name: 'active_sub_items')  List<ReminderSubItemModel> activeSubItems)?  $default,) {final _that = this;
switch (_that) {
case _ReminderTypeModel() when $default != null:
return $default(_that.id,_that.title,_that.status,_that.sortOrder,_that.activeSubItems);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReminderTypeModel implements ReminderTypeModel {
  const _ReminderTypeModel({@JsonKey(fromJson: _anyToString) this.id = '', @JsonKey(fromJson: _anyToString) this.title = '', @JsonKey(fromJson: _anyToString) this.status = '', @JsonKey(name: 'sort_order', fromJson: _anyToInt) this.sortOrder = 0, @JsonKey(name: 'active_sub_items')  List<ReminderSubItemModel> activeSubItems = const []}): _activeSubItems = activeSubItems;
  factory _ReminderTypeModel.fromJson(Map<String, dynamic> json) => _$ReminderTypeModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String id;
@override@JsonKey(fromJson: _anyToString) final  String title;
@override@JsonKey(fromJson: _anyToString) final  String status;
@override@JsonKey(name: 'sort_order', fromJson: _anyToInt) final  int sortOrder;
 final  List<ReminderSubItemModel> _activeSubItems;
@override@JsonKey(name: 'active_sub_items') List<ReminderSubItemModel> get activeSubItems {
  if (_activeSubItems is EqualUnmodifiableListView) return _activeSubItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeSubItems);
}


/// Create a copy of ReminderTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderTypeModelCopyWith<_ReminderTypeModel> get copyWith => __$ReminderTypeModelCopyWithImpl<_ReminderTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReminderTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReminderTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other.activeSubItems, _activeSubItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,status,sortOrder,const DeepCollectionEquality().hash(_activeSubItems));
}

@override
String toString() {
    return 'ReminderTypeModel(id: $id, title: $title, status: $status, sortOrder: $sortOrder, activeSubItems: $activeSubItems)';
}


}

/// @nodoc
abstract mixin class _$ReminderTypeModelCopyWith<$Res> implements $ReminderTypeModelCopyWith<$Res> {
  factory _$ReminderTypeModelCopyWith(_ReminderTypeModel value, $Res Function(_ReminderTypeModel) _then) = __$ReminderTypeModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(fromJson: _anyToString) String title,@JsonKey(fromJson: _anyToString) String status,@JsonKey(name: 'sort_order', fromJson: _anyToInt) int sortOrder,@JsonKey(name: 'active_sub_items') List<ReminderSubItemModel> activeSubItems
});




}
/// @nodoc
class __$ReminderTypeModelCopyWithImpl<$Res>
    implements _$ReminderTypeModelCopyWith<$Res> {
  __$ReminderTypeModelCopyWithImpl(this._self, this._then);

  final _ReminderTypeModel _self;
  final $Res Function(_ReminderTypeModel) _then;

/// Create a copy of ReminderTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? status = null,Object? sortOrder = null,Object? activeSubItems = null,}) {
  return _then(_ReminderTypeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,activeSubItems: null == activeSubItems ? _self._activeSubItems : activeSubItems // ignore: cast_nullable_to_non_nullable
as List<ReminderSubItemModel>,
  ));
}


}


/// @nodoc
mixin _$ReminderSubItemModel {

@JsonKey(fromJson: _anyToString) String get id;@JsonKey(name: 'reminder_type_id', fromJson: _anyToString) String get reminderTypeId;@JsonKey(fromJson: _anyToString) String get title;@JsonKey(fromJson: _anyToString) String get status;@JsonKey(name: 'sort_order', fromJson: _anyToInt) int get sortOrder;
/// Create a copy of ReminderSubItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderSubItemModelCopyWith<ReminderSubItemModel> get copyWith => _$ReminderSubItemModelCopyWithImpl<ReminderSubItemModel>(this as ReminderSubItemModel, _$identity);

  /// Serializes this ReminderSubItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReminderSubItemModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderSubItemModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.reminderTypeId, _this.reminderTypeId) || other.reminderTypeId == _this.reminderTypeId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.sortOrder, _this.sortOrder) || other.sortOrder == _this.sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReminderSubItemModel;
  return Object.hash(runtimeType,_this.id,_this.reminderTypeId,_this.title,_this.status,_this.sortOrder);
}

@override
String toString() {
  final _this = this as ReminderSubItemModel;
  return 'ReminderSubItemModel(id: ${_this.id}, reminderTypeId: ${_this.reminderTypeId}, title: ${_this.title}, status: ${_this.status}, sortOrder: ${_this.sortOrder})';
}


}

/// @nodoc
abstract mixin class $ReminderSubItemModelCopyWith<$Res>  {
  factory $ReminderSubItemModelCopyWith(ReminderSubItemModel value, $Res Function(ReminderSubItemModel) _then) = _$ReminderSubItemModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(name: 'reminder_type_id', fromJson: _anyToString) String reminderTypeId,@JsonKey(fromJson: _anyToString) String title,@JsonKey(fromJson: _anyToString) String status,@JsonKey(name: 'sort_order', fromJson: _anyToInt) int sortOrder
});




}
/// @nodoc
class _$ReminderSubItemModelCopyWithImpl<$Res>
    implements $ReminderSubItemModelCopyWith<$Res> {
  _$ReminderSubItemModelCopyWithImpl(this._self, this._then);

  final ReminderSubItemModel _self;
  final $Res Function(ReminderSubItemModel) _then;

/// Create a copy of ReminderSubItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reminderTypeId = null,Object? title = null,Object? status = null,Object? sortOrder = null,}) {
  return _then(ReminderSubItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reminderTypeId: null == reminderTypeId ? _self.reminderTypeId : reminderTypeId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReminderSubItemModel].
extension ReminderSubItemModelPatterns on ReminderSubItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReminderSubItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReminderSubItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReminderSubItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ReminderSubItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReminderSubItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReminderSubItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'reminder_type_id', fromJson: _anyToString)  String reminderTypeId, @JsonKey(fromJson: _anyToString)  String title, @JsonKey(fromJson: _anyToString)  String status, @JsonKey(name: 'sort_order', fromJson: _anyToInt)  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReminderSubItemModel() when $default != null:
return $default(_that.id,_that.reminderTypeId,_that.title,_that.status,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'reminder_type_id', fromJson: _anyToString)  String reminderTypeId, @JsonKey(fromJson: _anyToString)  String title, @JsonKey(fromJson: _anyToString)  String status, @JsonKey(name: 'sort_order', fromJson: _anyToInt)  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _ReminderSubItemModel():
return $default(_that.id,_that.reminderTypeId,_that.title,_that.status,_that.sortOrder);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'reminder_type_id', fromJson: _anyToString)  String reminderTypeId, @JsonKey(fromJson: _anyToString)  String title, @JsonKey(fromJson: _anyToString)  String status, @JsonKey(name: 'sort_order', fromJson: _anyToInt)  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _ReminderSubItemModel() when $default != null:
return $default(_that.id,_that.reminderTypeId,_that.title,_that.status,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReminderSubItemModel implements ReminderSubItemModel {
  const _ReminderSubItemModel({@JsonKey(fromJson: _anyToString) this.id = '', @JsonKey(name: 'reminder_type_id', fromJson: _anyToString) this.reminderTypeId = '', @JsonKey(fromJson: _anyToString) this.title = '', @JsonKey(fromJson: _anyToString) this.status = '', @JsonKey(name: 'sort_order', fromJson: _anyToInt) this.sortOrder = 0});
  factory _ReminderSubItemModel.fromJson(Map<String, dynamic> json) => _$ReminderSubItemModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String id;
@override@JsonKey(name: 'reminder_type_id', fromJson: _anyToString) final  String reminderTypeId;
@override@JsonKey(fromJson: _anyToString) final  String title;
@override@JsonKey(fromJson: _anyToString) final  String status;
@override@JsonKey(name: 'sort_order', fromJson: _anyToInt) final  int sortOrder;

/// Create a copy of ReminderSubItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderSubItemModelCopyWith<_ReminderSubItemModel> get copyWith => __$ReminderSubItemModelCopyWithImpl<_ReminderSubItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReminderSubItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReminderSubItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reminderTypeId, reminderTypeId) || other.reminderTypeId == reminderTypeId)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,reminderTypeId,title,status,sortOrder);
}

@override
String toString() {
    return 'ReminderSubItemModel(id: $id, reminderTypeId: $reminderTypeId, title: $title, status: $status, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$ReminderSubItemModelCopyWith<$Res> implements $ReminderSubItemModelCopyWith<$Res> {
  factory _$ReminderSubItemModelCopyWith(_ReminderSubItemModel value, $Res Function(_ReminderSubItemModel) _then) = __$ReminderSubItemModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(name: 'reminder_type_id', fromJson: _anyToString) String reminderTypeId,@JsonKey(fromJson: _anyToString) String title,@JsonKey(fromJson: _anyToString) String status,@JsonKey(name: 'sort_order', fromJson: _anyToInt) int sortOrder
});




}
/// @nodoc
class __$ReminderSubItemModelCopyWithImpl<$Res>
    implements _$ReminderSubItemModelCopyWith<$Res> {
  __$ReminderSubItemModelCopyWithImpl(this._self, this._then);

  final _ReminderSubItemModel _self;
  final $Res Function(_ReminderSubItemModel) _then;

/// Create a copy of ReminderSubItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reminderTypeId = null,Object? title = null,Object? status = null,Object? sortOrder = null,}) {
  return _then(_ReminderSubItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reminderTypeId: null == reminderTypeId ? _self.reminderTypeId : reminderTypeId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ReminderTypeListModel {

 List<ReminderTypeModel> get data;@JsonKey(name: 'current_page') int get currentPage;@JsonKey(name: 'last_page') int get lastPage;@JsonKey(fromJson: _anyToInt) int get total;
/// Create a copy of ReminderTypeListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderTypeListModelCopyWith<ReminderTypeListModel> get copyWith => _$ReminderTypeListModelCopyWithImpl<ReminderTypeListModel>(this as ReminderTypeListModel, _$identity);

  /// Serializes this ReminderTypeListModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReminderTypeListModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderTypeListModel&&const DeepCollectionEquality().equals(other.data, _this.data)&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&(identical(other.lastPage, _this.lastPage) || other.lastPage == _this.lastPage)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReminderTypeListModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.data),_this.currentPage,_this.lastPage,_this.total);
}

@override
String toString() {
  final _this = this as ReminderTypeListModel;
  return 'ReminderTypeListModel(data: ${_this.data}, currentPage: ${_this.currentPage}, lastPage: ${_this.lastPage}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $ReminderTypeListModelCopyWith<$Res>  {
  factory $ReminderTypeListModelCopyWith(ReminderTypeListModel value, $Res Function(ReminderTypeListModel) _then) = _$ReminderTypeListModelCopyWithImpl;
@useResult
$Res call({
 List<ReminderTypeModel> data,@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'last_page') int lastPage,@JsonKey(fromJson: _anyToInt) int total
});




}
/// @nodoc
class _$ReminderTypeListModelCopyWithImpl<$Res>
    implements $ReminderTypeListModelCopyWith<$Res> {
  _$ReminderTypeListModelCopyWithImpl(this._self, this._then);

  final ReminderTypeListModel _self;
  final $Res Function(ReminderTypeListModel) _then;

/// Create a copy of ReminderTypeListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? currentPage = null,Object? lastPage = null,Object? total = null,}) {
  return _then(ReminderTypeListModel(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ReminderTypeModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReminderTypeListModel].
extension ReminderTypeListModelPatterns on ReminderTypeListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReminderTypeListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReminderTypeListModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReminderTypeListModel value)  $default,){
final _that = this;
switch (_that) {
case _ReminderTypeListModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReminderTypeListModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReminderTypeListModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ReminderTypeModel> data, @JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(fromJson: _anyToInt)  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReminderTypeListModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ReminderTypeModel> data, @JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(fromJson: _anyToInt)  int total)  $default,) {final _that = this;
switch (_that) {
case _ReminderTypeListModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ReminderTypeModel> data, @JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(fromJson: _anyToInt)  int total)?  $default,) {final _that = this;
switch (_that) {
case _ReminderTypeListModel() when $default != null:
return $default(_that.data,_that.currentPage,_that.lastPage,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReminderTypeListModel implements ReminderTypeListModel {
  const _ReminderTypeListModel({ List<ReminderTypeModel> data = const [], @JsonKey(name: 'current_page') this.currentPage = 1, @JsonKey(name: 'last_page') this.lastPage = 1, @JsonKey(fromJson: _anyToInt) this.total = 0}): _data = data;
  factory _ReminderTypeListModel.fromJson(Map<String, dynamic> json) => _$ReminderTypeListModelFromJson(json);

 final  List<ReminderTypeModel> _data;
@override@JsonKey() List<ReminderTypeModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey(name: 'current_page') final  int currentPage;
@override@JsonKey(name: 'last_page') final  int lastPage;
@override@JsonKey(fromJson: _anyToInt) final  int total;

/// Create a copy of ReminderTypeListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderTypeListModelCopyWith<_ReminderTypeListModel> get copyWith => __$ReminderTypeListModelCopyWithImpl<_ReminderTypeListModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReminderTypeListModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReminderTypeListModel&&const DeepCollectionEquality().equals(other.data, _data)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),currentPage,lastPage,total);
}

@override
String toString() {
    return 'ReminderTypeListModel(data: $data, currentPage: $currentPage, lastPage: $lastPage, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ReminderTypeListModelCopyWith<$Res> implements $ReminderTypeListModelCopyWith<$Res> {
  factory _$ReminderTypeListModelCopyWith(_ReminderTypeListModel value, $Res Function(_ReminderTypeListModel) _then) = __$ReminderTypeListModelCopyWithImpl;
@override @useResult
$Res call({
 List<ReminderTypeModel> data,@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'last_page') int lastPage,@JsonKey(fromJson: _anyToInt) int total
});




}
/// @nodoc
class __$ReminderTypeListModelCopyWithImpl<$Res>
    implements _$ReminderTypeListModelCopyWith<$Res> {
  __$ReminderTypeListModelCopyWithImpl(this._self, this._then);

  final _ReminderTypeListModel _self;
  final $Res Function(_ReminderTypeListModel) _then;

/// Create a copy of ReminderTypeListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? currentPage = null,Object? lastPage = null,Object? total = null,}) {
  return _then(_ReminderTypeListModel(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ReminderTypeModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
