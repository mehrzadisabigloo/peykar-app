// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_slot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimeSlotModel {

@JsonKey(fromJson: _anyToString) String get id;@JsonKey(name: 'repairman_id', fromJson: _anyToString) String get repairmanId;@JsonKey(fromJson: _anyToString) String get date;@JsonKey(name: 'start_time', fromJson: _anyToString) String get startTime;@JsonKey(name: 'end_time', fromJson: _anyToString) String get endTime;@JsonKey(fromJson: _anyToInt) int get capacity;@JsonKey(fromJson: _anyToString) String get status;@JsonKey(name: 'reserved_count', fromJson: _anyToInt) int get reservedCount;@JsonKey(name: 'remaining_capacity', fromJson: _anyToInt) int get remainingCapacity;@JsonKey(name: 'is_full', fromJson: _anyToBool) bool get isFull;@JsonKey(name: 'jalali_date', fromJson: _anyToString) String get jalaliDate;@JsonKey(name: 'feedback_notified_at', fromJson: _anyToString) String? get feedbackNotifiedAt;@JsonKey(name: 'created_at', fromJson: _anyToString) String get createdAt;@JsonKey(name: 'updated_at', fromJson: _anyToString) String get updatedAt; List<TimeSlotReservationModel>? get reservations; RepairmanModel? get repairman;
/// Create a copy of TimeSlotModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeSlotModelCopyWith<TimeSlotModel> get copyWith => _$TimeSlotModelCopyWithImpl<TimeSlotModel>(this as TimeSlotModel, _$identity);

  /// Serializes this TimeSlotModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TimeSlotModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.repairmanId, _this.repairmanId) || other.repairmanId == _this.repairmanId)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.startTime, _this.startTime) || other.startTime == _this.startTime)&&(identical(other.endTime, _this.endTime) || other.endTime == _this.endTime)&&(identical(other.capacity, _this.capacity) || other.capacity == _this.capacity)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.reservedCount, _this.reservedCount) || other.reservedCount == _this.reservedCount)&&(identical(other.remainingCapacity, _this.remainingCapacity) || other.remainingCapacity == _this.remainingCapacity)&&(identical(other.isFull, _this.isFull) || other.isFull == _this.isFull)&&(identical(other.jalaliDate, _this.jalaliDate) || other.jalaliDate == _this.jalaliDate)&&(identical(other.feedbackNotifiedAt, _this.feedbackNotifiedAt) || other.feedbackNotifiedAt == _this.feedbackNotifiedAt)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&const DeepCollectionEquality().equals(other.reservations, _this.reservations)&&(identical(other.repairman, _this.repairman) || other.repairman == _this.repairman));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TimeSlotModel;
  return Object.hash(runtimeType,_this.id,_this.repairmanId,_this.date,_this.startTime,_this.endTime,_this.capacity,_this.status,_this.reservedCount,_this.remainingCapacity,_this.isFull,_this.jalaliDate,_this.feedbackNotifiedAt,_this.createdAt,_this.updatedAt,const DeepCollectionEquality().hash(_this.reservations),_this.repairman);
}

@override
String toString() {
  final _this = this as TimeSlotModel;
  return 'TimeSlotModel(id: ${_this.id}, repairmanId: ${_this.repairmanId}, date: ${_this.date}, startTime: ${_this.startTime}, endTime: ${_this.endTime}, capacity: ${_this.capacity}, status: ${_this.status}, reservedCount: ${_this.reservedCount}, remainingCapacity: ${_this.remainingCapacity}, isFull: ${_this.isFull}, jalaliDate: ${_this.jalaliDate}, feedbackNotifiedAt: ${_this.feedbackNotifiedAt}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, reservations: ${_this.reservations}, repairman: ${_this.repairman})';
}


}

/// @nodoc
abstract mixin class $TimeSlotModelCopyWith<$Res>  {
  factory $TimeSlotModelCopyWith(TimeSlotModel value, $Res Function(TimeSlotModel) _then) = _$TimeSlotModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(name: 'repairman_id', fromJson: _anyToString) String repairmanId,@JsonKey(fromJson: _anyToString) String date,@JsonKey(name: 'start_time', fromJson: _anyToString) String startTime,@JsonKey(name: 'end_time', fromJson: _anyToString) String endTime,@JsonKey(fromJson: _anyToInt) int capacity,@JsonKey(fromJson: _anyToString) String status,@JsonKey(name: 'reserved_count', fromJson: _anyToInt) int reservedCount,@JsonKey(name: 'remaining_capacity', fromJson: _anyToInt) int remainingCapacity,@JsonKey(name: 'is_full', fromJson: _anyToBool) bool isFull,@JsonKey(name: 'jalali_date', fromJson: _anyToString) String jalaliDate,@JsonKey(name: 'feedback_notified_at', fromJson: _anyToString) String? feedbackNotifiedAt,@JsonKey(name: 'created_at', fromJson: _anyToString) String createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String updatedAt, List<TimeSlotReservationModel>? reservations, RepairmanModel? repairman
});


$RepairmanModelCopyWith<$Res>? get repairman;

}
/// @nodoc
class _$TimeSlotModelCopyWithImpl<$Res>
    implements $TimeSlotModelCopyWith<$Res> {
  _$TimeSlotModelCopyWithImpl(this._self, this._then);

  final TimeSlotModel _self;
  final $Res Function(TimeSlotModel) _then;

/// Create a copy of TimeSlotModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? repairmanId = null,Object? date = null,Object? startTime = null,Object? endTime = null,Object? capacity = null,Object? status = null,Object? reservedCount = null,Object? remainingCapacity = null,Object? isFull = null,Object? jalaliDate = null,Object? feedbackNotifiedAt = freezed,Object? createdAt = null,Object? updatedAt = null,Object? reservations = freezed,Object? repairman = freezed,}) {
  return _then(TimeSlotModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,repairmanId: null == repairmanId ? _self.repairmanId : repairmanId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reservedCount: null == reservedCount ? _self.reservedCount : reservedCount // ignore: cast_nullable_to_non_nullable
as int,remainingCapacity: null == remainingCapacity ? _self.remainingCapacity : remainingCapacity // ignore: cast_nullable_to_non_nullable
as int,isFull: null == isFull ? _self.isFull : isFull // ignore: cast_nullable_to_non_nullable
as bool,jalaliDate: null == jalaliDate ? _self.jalaliDate : jalaliDate // ignore: cast_nullable_to_non_nullable
as String,feedbackNotifiedAt: freezed == feedbackNotifiedAt ? _self.feedbackNotifiedAt : feedbackNotifiedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,reservations: freezed == reservations ? _self.reservations : reservations // ignore: cast_nullable_to_non_nullable
as List<TimeSlotReservationModel>?,repairman: freezed == repairman ? _self.repairman : repairman // ignore: cast_nullable_to_non_nullable
as RepairmanModel?,
  ));
}
/// Create a copy of TimeSlotModel
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


/// Adds pattern-matching-related methods to [TimeSlotModel].
extension TimeSlotModelPatterns on TimeSlotModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeSlotModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeSlotModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeSlotModel value)  $default,){
final _that = this;
switch (_that) {
case _TimeSlotModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeSlotModel value)?  $default,){
final _that = this;
switch (_that) {
case _TimeSlotModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'repairman_id', fromJson: _anyToString)  String repairmanId, @JsonKey(fromJson: _anyToString)  String date, @JsonKey(name: 'start_time', fromJson: _anyToString)  String startTime, @JsonKey(name: 'end_time', fromJson: _anyToString)  String endTime, @JsonKey(fromJson: _anyToInt)  int capacity, @JsonKey(fromJson: _anyToString)  String status, @JsonKey(name: 'reserved_count', fromJson: _anyToInt)  int reservedCount, @JsonKey(name: 'remaining_capacity', fromJson: _anyToInt)  int remainingCapacity, @JsonKey(name: 'is_full', fromJson: _anyToBool)  bool isFull, @JsonKey(name: 'jalali_date', fromJson: _anyToString)  String jalaliDate, @JsonKey(name: 'feedback_notified_at', fromJson: _anyToString)  String? feedbackNotifiedAt, @JsonKey(name: 'created_at', fromJson: _anyToString)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String updatedAt,  List<TimeSlotReservationModel>? reservations,  RepairmanModel? repairman)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeSlotModel() when $default != null:
return $default(_that.id,_that.repairmanId,_that.date,_that.startTime,_that.endTime,_that.capacity,_that.status,_that.reservedCount,_that.remainingCapacity,_that.isFull,_that.jalaliDate,_that.feedbackNotifiedAt,_that.createdAt,_that.updatedAt,_that.reservations,_that.repairman);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'repairman_id', fromJson: _anyToString)  String repairmanId, @JsonKey(fromJson: _anyToString)  String date, @JsonKey(name: 'start_time', fromJson: _anyToString)  String startTime, @JsonKey(name: 'end_time', fromJson: _anyToString)  String endTime, @JsonKey(fromJson: _anyToInt)  int capacity, @JsonKey(fromJson: _anyToString)  String status, @JsonKey(name: 'reserved_count', fromJson: _anyToInt)  int reservedCount, @JsonKey(name: 'remaining_capacity', fromJson: _anyToInt)  int remainingCapacity, @JsonKey(name: 'is_full', fromJson: _anyToBool)  bool isFull, @JsonKey(name: 'jalali_date', fromJson: _anyToString)  String jalaliDate, @JsonKey(name: 'feedback_notified_at', fromJson: _anyToString)  String? feedbackNotifiedAt, @JsonKey(name: 'created_at', fromJson: _anyToString)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String updatedAt,  List<TimeSlotReservationModel>? reservations,  RepairmanModel? repairman)  $default,) {final _that = this;
switch (_that) {
case _TimeSlotModel():
return $default(_that.id,_that.repairmanId,_that.date,_that.startTime,_that.endTime,_that.capacity,_that.status,_that.reservedCount,_that.remainingCapacity,_that.isFull,_that.jalaliDate,_that.feedbackNotifiedAt,_that.createdAt,_that.updatedAt,_that.reservations,_that.repairman);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'repairman_id', fromJson: _anyToString)  String repairmanId, @JsonKey(fromJson: _anyToString)  String date, @JsonKey(name: 'start_time', fromJson: _anyToString)  String startTime, @JsonKey(name: 'end_time', fromJson: _anyToString)  String endTime, @JsonKey(fromJson: _anyToInt)  int capacity, @JsonKey(fromJson: _anyToString)  String status, @JsonKey(name: 'reserved_count', fromJson: _anyToInt)  int reservedCount, @JsonKey(name: 'remaining_capacity', fromJson: _anyToInt)  int remainingCapacity, @JsonKey(name: 'is_full', fromJson: _anyToBool)  bool isFull, @JsonKey(name: 'jalali_date', fromJson: _anyToString)  String jalaliDate, @JsonKey(name: 'feedback_notified_at', fromJson: _anyToString)  String? feedbackNotifiedAt, @JsonKey(name: 'created_at', fromJson: _anyToString)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String updatedAt,  List<TimeSlotReservationModel>? reservations,  RepairmanModel? repairman)?  $default,) {final _that = this;
switch (_that) {
case _TimeSlotModel() when $default != null:
return $default(_that.id,_that.repairmanId,_that.date,_that.startTime,_that.endTime,_that.capacity,_that.status,_that.reservedCount,_that.remainingCapacity,_that.isFull,_that.jalaliDate,_that.feedbackNotifiedAt,_that.createdAt,_that.updatedAt,_that.reservations,_that.repairman);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeSlotModel extends TimeSlotModel {
  const _TimeSlotModel({@JsonKey(fromJson: _anyToString) this.id = '', @JsonKey(name: 'repairman_id', fromJson: _anyToString) this.repairmanId = '', @JsonKey(fromJson: _anyToString) this.date = '', @JsonKey(name: 'start_time', fromJson: _anyToString) this.startTime = '', @JsonKey(name: 'end_time', fromJson: _anyToString) this.endTime = '', @JsonKey(fromJson: _anyToInt) this.capacity = 0, @JsonKey(fromJson: _anyToString) this.status = '', @JsonKey(name: 'reserved_count', fromJson: _anyToInt) this.reservedCount = 0, @JsonKey(name: 'remaining_capacity', fromJson: _anyToInt) this.remainingCapacity = 0, @JsonKey(name: 'is_full', fromJson: _anyToBool) this.isFull = false, @JsonKey(name: 'jalali_date', fromJson: _anyToString) this.jalaliDate = '', @JsonKey(name: 'feedback_notified_at', fromJson: _anyToString) this.feedbackNotifiedAt, @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt = '', @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt = '',  List<TimeSlotReservationModel>? reservations, this.repairman}): _reservations = reservations,super._();
  factory _TimeSlotModel.fromJson(Map<String, dynamic> json) => _$TimeSlotModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String id;
@override@JsonKey(name: 'repairman_id', fromJson: _anyToString) final  String repairmanId;
@override@JsonKey(fromJson: _anyToString) final  String date;
@override@JsonKey(name: 'start_time', fromJson: _anyToString) final  String startTime;
@override@JsonKey(name: 'end_time', fromJson: _anyToString) final  String endTime;
@override@JsonKey(fromJson: _anyToInt) final  int capacity;
@override@JsonKey(fromJson: _anyToString) final  String status;
@override@JsonKey(name: 'reserved_count', fromJson: _anyToInt) final  int reservedCount;
@override@JsonKey(name: 'remaining_capacity', fromJson: _anyToInt) final  int remainingCapacity;
@override@JsonKey(name: 'is_full', fromJson: _anyToBool) final  bool isFull;
@override@JsonKey(name: 'jalali_date', fromJson: _anyToString) final  String jalaliDate;
@override@JsonKey(name: 'feedback_notified_at', fromJson: _anyToString) final  String? feedbackNotifiedAt;
@override@JsonKey(name: 'created_at', fromJson: _anyToString) final  String createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _anyToString) final  String updatedAt;
 final  List<TimeSlotReservationModel>? _reservations;
@override List<TimeSlotReservationModel>? get reservations {
  final value = _reservations;
  if (value == null) return null;
  if (_reservations is EqualUnmodifiableListView) return _reservations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  RepairmanModel? repairman;

/// Create a copy of TimeSlotModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeSlotModelCopyWith<_TimeSlotModel> get copyWith => __$TimeSlotModelCopyWithImpl<_TimeSlotModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeSlotModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeSlotModel&&(identical(other.id, id) || other.id == id)&&(identical(other.repairmanId, repairmanId) || other.repairmanId == repairmanId)&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.status, status) || other.status == status)&&(identical(other.reservedCount, reservedCount) || other.reservedCount == reservedCount)&&(identical(other.remainingCapacity, remainingCapacity) || other.remainingCapacity == remainingCapacity)&&(identical(other.isFull, isFull) || other.isFull == isFull)&&(identical(other.jalaliDate, jalaliDate) || other.jalaliDate == jalaliDate)&&(identical(other.feedbackNotifiedAt, feedbackNotifiedAt) || other.feedbackNotifiedAt == feedbackNotifiedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.reservations, _reservations)&&(identical(other.repairman, repairman) || other.repairman == repairman));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,repairmanId,date,startTime,endTime,capacity,status,reservedCount,remainingCapacity,isFull,jalaliDate,feedbackNotifiedAt,createdAt,updatedAt,const DeepCollectionEquality().hash(_reservations),repairman);
}

@override
String toString() {
    return 'TimeSlotModel(id: $id, repairmanId: $repairmanId, date: $date, startTime: $startTime, endTime: $endTime, capacity: $capacity, status: $status, reservedCount: $reservedCount, remainingCapacity: $remainingCapacity, isFull: $isFull, jalaliDate: $jalaliDate, feedbackNotifiedAt: $feedbackNotifiedAt, createdAt: $createdAt, updatedAt: $updatedAt, reservations: $reservations, repairman: $repairman)';
}


}

/// @nodoc
abstract mixin class _$TimeSlotModelCopyWith<$Res> implements $TimeSlotModelCopyWith<$Res> {
  factory _$TimeSlotModelCopyWith(_TimeSlotModel value, $Res Function(_TimeSlotModel) _then) = __$TimeSlotModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(name: 'repairman_id', fromJson: _anyToString) String repairmanId,@JsonKey(fromJson: _anyToString) String date,@JsonKey(name: 'start_time', fromJson: _anyToString) String startTime,@JsonKey(name: 'end_time', fromJson: _anyToString) String endTime,@JsonKey(fromJson: _anyToInt) int capacity,@JsonKey(fromJson: _anyToString) String status,@JsonKey(name: 'reserved_count', fromJson: _anyToInt) int reservedCount,@JsonKey(name: 'remaining_capacity', fromJson: _anyToInt) int remainingCapacity,@JsonKey(name: 'is_full', fromJson: _anyToBool) bool isFull,@JsonKey(name: 'jalali_date', fromJson: _anyToString) String jalaliDate,@JsonKey(name: 'feedback_notified_at', fromJson: _anyToString) String? feedbackNotifiedAt,@JsonKey(name: 'created_at', fromJson: _anyToString) String createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String updatedAt, List<TimeSlotReservationModel>? reservations, RepairmanModel? repairman
});


@override $RepairmanModelCopyWith<$Res>? get repairman;

}
/// @nodoc
class __$TimeSlotModelCopyWithImpl<$Res>
    implements _$TimeSlotModelCopyWith<$Res> {
  __$TimeSlotModelCopyWithImpl(this._self, this._then);

  final _TimeSlotModel _self;
  final $Res Function(_TimeSlotModel) _then;

/// Create a copy of TimeSlotModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? repairmanId = null,Object? date = null,Object? startTime = null,Object? endTime = null,Object? capacity = null,Object? status = null,Object? reservedCount = null,Object? remainingCapacity = null,Object? isFull = null,Object? jalaliDate = null,Object? feedbackNotifiedAt = freezed,Object? createdAt = null,Object? updatedAt = null,Object? reservations = freezed,Object? repairman = freezed,}) {
  return _then(_TimeSlotModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,repairmanId: null == repairmanId ? _self.repairmanId : repairmanId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reservedCount: null == reservedCount ? _self.reservedCount : reservedCount // ignore: cast_nullable_to_non_nullable
as int,remainingCapacity: null == remainingCapacity ? _self.remainingCapacity : remainingCapacity // ignore: cast_nullable_to_non_nullable
as int,isFull: null == isFull ? _self.isFull : isFull // ignore: cast_nullable_to_non_nullable
as bool,jalaliDate: null == jalaliDate ? _self.jalaliDate : jalaliDate // ignore: cast_nullable_to_non_nullable
as String,feedbackNotifiedAt: freezed == feedbackNotifiedAt ? _self.feedbackNotifiedAt : feedbackNotifiedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,reservations: freezed == reservations ? _self._reservations : reservations // ignore: cast_nullable_to_non_nullable
as List<TimeSlotReservationModel>?,repairman: freezed == repairman ? _self.repairman : repairman // ignore: cast_nullable_to_non_nullable
as RepairmanModel?,
  ));
}

/// Create a copy of TimeSlotModel
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


/// @nodoc
mixin _$TimeSlotReservationModel {

@JsonKey(fromJson: _anyToString) String get id;@JsonKey(name: 'user_id', fromJson: _anyToString) String get userId;@JsonKey(name: 'time_slot_id', fromJson: _anyToString) String get timeSlotId; String? get description;@JsonKey(fromJson: _anyToString) String get status;@JsonKey(name: 'created_at', fromJson: _anyToString) String get createdAt;@JsonKey(name: 'updated_at', fromJson: _anyToString) String get updatedAt; TimeSlotReservationUserModel? get user;
/// Create a copy of TimeSlotReservationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeSlotReservationModelCopyWith<TimeSlotReservationModel> get copyWith => _$TimeSlotReservationModelCopyWithImpl<TimeSlotReservationModel>(this as TimeSlotReservationModel, _$identity);

  /// Serializes this TimeSlotReservationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TimeSlotReservationModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotReservationModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.timeSlotId, _this.timeSlotId) || other.timeSlotId == _this.timeSlotId)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.user, _this.user) || other.user == _this.user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TimeSlotReservationModel;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.timeSlotId,_this.description,_this.status,_this.createdAt,_this.updatedAt,_this.user);
}

@override
String toString() {
  final _this = this as TimeSlotReservationModel;
  return 'TimeSlotReservationModel(id: ${_this.id}, userId: ${_this.userId}, timeSlotId: ${_this.timeSlotId}, description: ${_this.description}, status: ${_this.status}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, user: ${_this.user})';
}


}

/// @nodoc
abstract mixin class $TimeSlotReservationModelCopyWith<$Res>  {
  factory $TimeSlotReservationModelCopyWith(TimeSlotReservationModel value, $Res Function(TimeSlotReservationModel) _then) = _$TimeSlotReservationModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(name: 'user_id', fromJson: _anyToString) String userId,@JsonKey(name: 'time_slot_id', fromJson: _anyToString) String timeSlotId, String? description,@JsonKey(fromJson: _anyToString) String status,@JsonKey(name: 'created_at', fromJson: _anyToString) String createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String updatedAt, TimeSlotReservationUserModel? user
});


$TimeSlotReservationUserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$TimeSlotReservationModelCopyWithImpl<$Res>
    implements $TimeSlotReservationModelCopyWith<$Res> {
  _$TimeSlotReservationModelCopyWithImpl(this._self, this._then);

  final TimeSlotReservationModel _self;
  final $Res Function(TimeSlotReservationModel) _then;

/// Create a copy of TimeSlotReservationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? timeSlotId = null,Object? description = freezed,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? user = freezed,}) {
  return _then(TimeSlotReservationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,timeSlotId: null == timeSlotId ? _self.timeSlotId : timeSlotId // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as TimeSlotReservationUserModel?,
  ));
}
/// Create a copy of TimeSlotReservationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeSlotReservationUserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $TimeSlotReservationUserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [TimeSlotReservationModel].
extension TimeSlotReservationModelPatterns on TimeSlotReservationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeSlotReservationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeSlotReservationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeSlotReservationModel value)  $default,){
final _that = this;
switch (_that) {
case _TimeSlotReservationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeSlotReservationModel value)?  $default,){
final _that = this;
switch (_that) {
case _TimeSlotReservationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'user_id', fromJson: _anyToString)  String userId, @JsonKey(name: 'time_slot_id', fromJson: _anyToString)  String timeSlotId,  String? description, @JsonKey(fromJson: _anyToString)  String status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String updatedAt,  TimeSlotReservationUserModel? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeSlotReservationModel() when $default != null:
return $default(_that.id,_that.userId,_that.timeSlotId,_that.description,_that.status,_that.createdAt,_that.updatedAt,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'user_id', fromJson: _anyToString)  String userId, @JsonKey(name: 'time_slot_id', fromJson: _anyToString)  String timeSlotId,  String? description, @JsonKey(fromJson: _anyToString)  String status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String updatedAt,  TimeSlotReservationUserModel? user)  $default,) {final _that = this;
switch (_that) {
case _TimeSlotReservationModel():
return $default(_that.id,_that.userId,_that.timeSlotId,_that.description,_that.status,_that.createdAt,_that.updatedAt,_that.user);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'user_id', fromJson: _anyToString)  String userId, @JsonKey(name: 'time_slot_id', fromJson: _anyToString)  String timeSlotId,  String? description, @JsonKey(fromJson: _anyToString)  String status, @JsonKey(name: 'created_at', fromJson: _anyToString)  String createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String updatedAt,  TimeSlotReservationUserModel? user)?  $default,) {final _that = this;
switch (_that) {
case _TimeSlotReservationModel() when $default != null:
return $default(_that.id,_that.userId,_that.timeSlotId,_that.description,_that.status,_that.createdAt,_that.updatedAt,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeSlotReservationModel extends TimeSlotReservationModel {
  const _TimeSlotReservationModel({@JsonKey(fromJson: _anyToString) this.id = '', @JsonKey(name: 'user_id', fromJson: _anyToString) this.userId = '', @JsonKey(name: 'time_slot_id', fromJson: _anyToString) this.timeSlotId = '', this.description, @JsonKey(fromJson: _anyToString) this.status = '', @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt = '', @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt = '', this.user}): super._();
  factory _TimeSlotReservationModel.fromJson(Map<String, dynamic> json) => _$TimeSlotReservationModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String id;
@override@JsonKey(name: 'user_id', fromJson: _anyToString) final  String userId;
@override@JsonKey(name: 'time_slot_id', fromJson: _anyToString) final  String timeSlotId;
@override final  String? description;
@override@JsonKey(fromJson: _anyToString) final  String status;
@override@JsonKey(name: 'created_at', fromJson: _anyToString) final  String createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _anyToString) final  String updatedAt;
@override final  TimeSlotReservationUserModel? user;

/// Create a copy of TimeSlotReservationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeSlotReservationModelCopyWith<_TimeSlotReservationModel> get copyWith => __$TimeSlotReservationModelCopyWithImpl<_TimeSlotReservationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeSlotReservationModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeSlotReservationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.timeSlotId, timeSlotId) || other.timeSlotId == timeSlotId)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,timeSlotId,description,status,createdAt,updatedAt,user);
}

@override
String toString() {
    return 'TimeSlotReservationModel(id: $id, userId: $userId, timeSlotId: $timeSlotId, description: $description, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
}


}

/// @nodoc
abstract mixin class _$TimeSlotReservationModelCopyWith<$Res> implements $TimeSlotReservationModelCopyWith<$Res> {
  factory _$TimeSlotReservationModelCopyWith(_TimeSlotReservationModel value, $Res Function(_TimeSlotReservationModel) _then) = __$TimeSlotReservationModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(name: 'user_id', fromJson: _anyToString) String userId,@JsonKey(name: 'time_slot_id', fromJson: _anyToString) String timeSlotId, String? description,@JsonKey(fromJson: _anyToString) String status,@JsonKey(name: 'created_at', fromJson: _anyToString) String createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String updatedAt, TimeSlotReservationUserModel? user
});


@override $TimeSlotReservationUserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$TimeSlotReservationModelCopyWithImpl<$Res>
    implements _$TimeSlotReservationModelCopyWith<$Res> {
  __$TimeSlotReservationModelCopyWithImpl(this._self, this._then);

  final _TimeSlotReservationModel _self;
  final $Res Function(_TimeSlotReservationModel) _then;

/// Create a copy of TimeSlotReservationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? timeSlotId = null,Object? description = freezed,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? user = freezed,}) {
  return _then(_TimeSlotReservationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,timeSlotId: null == timeSlotId ? _self.timeSlotId : timeSlotId // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as TimeSlotReservationUserModel?,
  ));
}

/// Create a copy of TimeSlotReservationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimeSlotReservationUserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $TimeSlotReservationUserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$TimeSlotReservationUserModel {

@JsonKey(fromJson: _anyToString) String get id;@JsonKey(name: 'first_name', fromJson: _anyToString) String get firstName;@JsonKey(name: 'last_name', fromJson: _anyToString) String get lastName;@JsonKey(fromJson: _anyToString) String get mobile;@JsonKey(name: 'profile_image_id') String? get profileImageId;
/// Create a copy of TimeSlotReservationUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeSlotReservationUserModelCopyWith<TimeSlotReservationUserModel> get copyWith => _$TimeSlotReservationUserModelCopyWithImpl<TimeSlotReservationUserModel>(this as TimeSlotReservationUserModel, _$identity);

  /// Serializes this TimeSlotReservationUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TimeSlotReservationUserModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeSlotReservationUserModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.mobile, _this.mobile) || other.mobile == _this.mobile)&&(identical(other.profileImageId, _this.profileImageId) || other.profileImageId == _this.profileImageId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TimeSlotReservationUserModel;
  return Object.hash(runtimeType,_this.id,_this.firstName,_this.lastName,_this.mobile,_this.profileImageId);
}

@override
String toString() {
  final _this = this as TimeSlotReservationUserModel;
  return 'TimeSlotReservationUserModel(id: ${_this.id}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, mobile: ${_this.mobile}, profileImageId: ${_this.profileImageId})';
}


}

/// @nodoc
abstract mixin class $TimeSlotReservationUserModelCopyWith<$Res>  {
  factory $TimeSlotReservationUserModelCopyWith(TimeSlotReservationUserModel value, $Res Function(TimeSlotReservationUserModel) _then) = _$TimeSlotReservationUserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(name: 'first_name', fromJson: _anyToString) String firstName,@JsonKey(name: 'last_name', fromJson: _anyToString) String lastName,@JsonKey(fromJson: _anyToString) String mobile,@JsonKey(name: 'profile_image_id') String? profileImageId
});




}
/// @nodoc
class _$TimeSlotReservationUserModelCopyWithImpl<$Res>
    implements $TimeSlotReservationUserModelCopyWith<$Res> {
  _$TimeSlotReservationUserModelCopyWithImpl(this._self, this._then);

  final TimeSlotReservationUserModel _self;
  final $Res Function(TimeSlotReservationUserModel) _then;

/// Create a copy of TimeSlotReservationUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? mobile = null,Object? profileImageId = freezed,}) {
  return _then(TimeSlotReservationUserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,profileImageId: freezed == profileImageId ? _self.profileImageId : profileImageId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeSlotReservationUserModel].
extension TimeSlotReservationUserModelPatterns on TimeSlotReservationUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeSlotReservationUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeSlotReservationUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeSlotReservationUserModel value)  $default,){
final _that = this;
switch (_that) {
case _TimeSlotReservationUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeSlotReservationUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _TimeSlotReservationUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'first_name', fromJson: _anyToString)  String firstName, @JsonKey(name: 'last_name', fromJson: _anyToString)  String lastName, @JsonKey(fromJson: _anyToString)  String mobile, @JsonKey(name: 'profile_image_id')  String? profileImageId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeSlotReservationUserModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.mobile,_that.profileImageId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'first_name', fromJson: _anyToString)  String firstName, @JsonKey(name: 'last_name', fromJson: _anyToString)  String lastName, @JsonKey(fromJson: _anyToString)  String mobile, @JsonKey(name: 'profile_image_id')  String? profileImageId)  $default,) {final _that = this;
switch (_that) {
case _TimeSlotReservationUserModel():
return $default(_that.id,_that.firstName,_that.lastName,_that.mobile,_that.profileImageId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'first_name', fromJson: _anyToString)  String firstName, @JsonKey(name: 'last_name', fromJson: _anyToString)  String lastName, @JsonKey(fromJson: _anyToString)  String mobile, @JsonKey(name: 'profile_image_id')  String? profileImageId)?  $default,) {final _that = this;
switch (_that) {
case _TimeSlotReservationUserModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.mobile,_that.profileImageId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeSlotReservationUserModel extends TimeSlotReservationUserModel {
  const _TimeSlotReservationUserModel({@JsonKey(fromJson: _anyToString) this.id = '', @JsonKey(name: 'first_name', fromJson: _anyToString) this.firstName = '', @JsonKey(name: 'last_name', fromJson: _anyToString) this.lastName = '', @JsonKey(fromJson: _anyToString) this.mobile = '', @JsonKey(name: 'profile_image_id') this.profileImageId}): super._();
  factory _TimeSlotReservationUserModel.fromJson(Map<String, dynamic> json) => _$TimeSlotReservationUserModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String id;
@override@JsonKey(name: 'first_name', fromJson: _anyToString) final  String firstName;
@override@JsonKey(name: 'last_name', fromJson: _anyToString) final  String lastName;
@override@JsonKey(fromJson: _anyToString) final  String mobile;
@override@JsonKey(name: 'profile_image_id') final  String? profileImageId;

/// Create a copy of TimeSlotReservationUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeSlotReservationUserModelCopyWith<_TimeSlotReservationUserModel> get copyWith => __$TimeSlotReservationUserModelCopyWithImpl<_TimeSlotReservationUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeSlotReservationUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeSlotReservationUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.profileImageId, profileImageId) || other.profileImageId == profileImageId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,firstName,lastName,mobile,profileImageId);
}

@override
String toString() {
    return 'TimeSlotReservationUserModel(id: $id, firstName: $firstName, lastName: $lastName, mobile: $mobile, profileImageId: $profileImageId)';
}


}

/// @nodoc
abstract mixin class _$TimeSlotReservationUserModelCopyWith<$Res> implements $TimeSlotReservationUserModelCopyWith<$Res> {
  factory _$TimeSlotReservationUserModelCopyWith(_TimeSlotReservationUserModel value, $Res Function(_TimeSlotReservationUserModel) _then) = __$TimeSlotReservationUserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(name: 'first_name', fromJson: _anyToString) String firstName,@JsonKey(name: 'last_name', fromJson: _anyToString) String lastName,@JsonKey(fromJson: _anyToString) String mobile,@JsonKey(name: 'profile_image_id') String? profileImageId
});




}
/// @nodoc
class __$TimeSlotReservationUserModelCopyWithImpl<$Res>
    implements _$TimeSlotReservationUserModelCopyWith<$Res> {
  __$TimeSlotReservationUserModelCopyWithImpl(this._self, this._then);

  final _TimeSlotReservationUserModel _self;
  final $Res Function(_TimeSlotReservationUserModel) _then;

/// Create a copy of TimeSlotReservationUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? mobile = null,Object? profileImageId = freezed,}) {
  return _then(_TimeSlotReservationUserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,mobile: null == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String,profileImageId: freezed == profileImageId ? _self.profileImageId : profileImageId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
