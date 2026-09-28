// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReminderModel {

@JsonKey(fromJson: _anyToString) String get id;@JsonKey(name: 'user_id', fromJson: _anyToString) String? get userId;@JsonKey(fromJson: _anyToString) String get title;@JsonKey(fromJson: _anyToString) String get description;@JsonKey(name: 'remaining_text', fromJson: _anyToString) String get remainingText;@JsonKey(fromJson: _anyToDouble) double get progress;@JsonKey(name: 'time_reminder', fromJson: _anyToBool) bool get isTimeReminder;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'color', fromJson: _parseColor, toJson: _colorToJson) Color get progressColor;@JsonKey(name: 'kilometer_logs') List<KilometerLogModel>? get kilometerLogs;@JsonKey(name: 'time_logs') List<TimeLogModel>? get timeLogs;@JsonKey(name: 'kilometer_logs_jalali') List<KilometerLogModel>? get kilometerLogsJalali;@JsonKey(name: 'time_logs_jalali') List<TimeLogModel>? get timeLogsJalali;@JsonKey(name: 'current_km', fromJson: _anyToInt) int? get currentKm;@JsonKey(name: 'next_km', fromJson: _anyToInt) int? get nextKm;@JsonKey(name: 'service_provider_id', fromJson: _anyToString) String? get serviceProviderId;@JsonKey(name: 'reminder_type_id', fromJson: _anyToString) String? get reminderTypeId;@JsonKey(name: 'reminder_sub_items') List<String>? get reminderSubItems;@JsonKey(name: 'created_at', fromJson: _anyToString) String? get createdAt;@JsonKey(name: 'updated_at', fromJson: _anyToString) String? get updatedAt;@JsonKey(name: 'created_at_jalali', fromJson: _anyToString) String? get createdAtJalali;@JsonKey(name: 'updated_at_jalali', fromJson: _anyToString) String? get updatedAtJalali;@JsonKey(name: 'reminder_type') ReminderTypeModel? get reminderType;
/// Create a copy of ReminderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderModelCopyWith<ReminderModel> get copyWith => _$ReminderModelCopyWithImpl<ReminderModel>(this as ReminderModel, _$identity);

  /// Serializes this ReminderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReminderModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.remainingText, _this.remainingText) || other.remainingText == _this.remainingText)&&(identical(other.progress, _this.progress) || other.progress == _this.progress)&&(identical(other.isTimeReminder, _this.isTimeReminder) || other.isTimeReminder == _this.isTimeReminder)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.progressColor, _this.progressColor) || other.progressColor == _this.progressColor)&&const DeepCollectionEquality().equals(other.kilometerLogs, _this.kilometerLogs)&&const DeepCollectionEquality().equals(other.timeLogs, _this.timeLogs)&&const DeepCollectionEquality().equals(other.kilometerLogsJalali, _this.kilometerLogsJalali)&&const DeepCollectionEquality().equals(other.timeLogsJalali, _this.timeLogsJalali)&&(identical(other.currentKm, _this.currentKm) || other.currentKm == _this.currentKm)&&(identical(other.nextKm, _this.nextKm) || other.nextKm == _this.nextKm)&&(identical(other.serviceProviderId, _this.serviceProviderId) || other.serviceProviderId == _this.serviceProviderId)&&(identical(other.reminderTypeId, _this.reminderTypeId) || other.reminderTypeId == _this.reminderTypeId)&&const DeepCollectionEquality().equals(other.reminderSubItems, _this.reminderSubItems)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.createdAtJalali, _this.createdAtJalali) || other.createdAtJalali == _this.createdAtJalali)&&(identical(other.updatedAtJalali, _this.updatedAtJalali) || other.updatedAtJalali == _this.updatedAtJalali)&&(identical(other.reminderType, _this.reminderType) || other.reminderType == _this.reminderType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReminderModel;
  return Object.hashAll([runtimeType,_this.id,_this.userId,_this.title,_this.description,_this.remainingText,_this.progress,_this.isTimeReminder,_this.imageUrl,_this.progressColor,const DeepCollectionEquality().hash(_this.kilometerLogs),const DeepCollectionEquality().hash(_this.timeLogs),const DeepCollectionEquality().hash(_this.kilometerLogsJalali),const DeepCollectionEquality().hash(_this.timeLogsJalali),_this.currentKm,_this.nextKm,_this.serviceProviderId,_this.reminderTypeId,const DeepCollectionEquality().hash(_this.reminderSubItems),_this.createdAt,_this.updatedAt,_this.createdAtJalali,_this.updatedAtJalali,_this.reminderType]);
}

@override
String toString() {
  final _this = this as ReminderModel;
  return 'ReminderModel(id: ${_this.id}, userId: ${_this.userId}, title: ${_this.title}, description: ${_this.description}, remainingText: ${_this.remainingText}, progress: ${_this.progress}, isTimeReminder: ${_this.isTimeReminder}, imageUrl: ${_this.imageUrl}, progressColor: ${_this.progressColor}, kilometerLogs: ${_this.kilometerLogs}, timeLogs: ${_this.timeLogs}, kilometerLogsJalali: ${_this.kilometerLogsJalali}, timeLogsJalali: ${_this.timeLogsJalali}, currentKm: ${_this.currentKm}, nextKm: ${_this.nextKm}, serviceProviderId: ${_this.serviceProviderId}, reminderTypeId: ${_this.reminderTypeId}, reminderSubItems: ${_this.reminderSubItems}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, createdAtJalali: ${_this.createdAtJalali}, updatedAtJalali: ${_this.updatedAtJalali}, reminderType: ${_this.reminderType})';
}


}

/// @nodoc
abstract mixin class $ReminderModelCopyWith<$Res>  {
  factory $ReminderModelCopyWith(ReminderModel value, $Res Function(ReminderModel) _then) = _$ReminderModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(name: 'user_id', fromJson: _anyToString) String? userId,@JsonKey(fromJson: _anyToString) String title,@JsonKey(fromJson: _anyToString) String description,@JsonKey(name: 'remaining_text', fromJson: _anyToString) String remainingText,@JsonKey(fromJson: _anyToDouble) double progress,@JsonKey(name: 'time_reminder', fromJson: _anyToBool) bool isTimeReminder,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'color', fromJson: _parseColor, toJson: _colorToJson) Color progressColor,@JsonKey(name: 'kilometer_logs') List<KilometerLogModel>? kilometerLogs,@JsonKey(name: 'time_logs') List<TimeLogModel>? timeLogs,@JsonKey(name: 'kilometer_logs_jalali') List<KilometerLogModel>? kilometerLogsJalali,@JsonKey(name: 'time_logs_jalali') List<TimeLogModel>? timeLogsJalali,@JsonKey(name: 'current_km', fromJson: _anyToInt) int? currentKm,@JsonKey(name: 'next_km', fromJson: _anyToInt) int? nextKm,@JsonKey(name: 'service_provider_id', fromJson: _anyToString) String? serviceProviderId,@JsonKey(name: 'reminder_type_id', fromJson: _anyToString) String? reminderTypeId,@JsonKey(name: 'reminder_sub_items') List<String>? reminderSubItems,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,@JsonKey(name: 'created_at_jalali', fromJson: _anyToString) String? createdAtJalali,@JsonKey(name: 'updated_at_jalali', fromJson: _anyToString) String? updatedAtJalali,@JsonKey(name: 'reminder_type') ReminderTypeModel? reminderType
});


$ReminderTypeModelCopyWith<$Res>? get reminderType;

}
/// @nodoc
class _$ReminderModelCopyWithImpl<$Res>
    implements $ReminderModelCopyWith<$Res> {
  _$ReminderModelCopyWithImpl(this._self, this._then);

  final ReminderModel _self;
  final $Res Function(ReminderModel) _then;

/// Create a copy of ReminderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? title = null,Object? description = null,Object? remainingText = null,Object? progress = null,Object? isTimeReminder = null,Object? imageUrl = freezed,Object? progressColor = null,Object? kilometerLogs = freezed,Object? timeLogs = freezed,Object? kilometerLogsJalali = freezed,Object? timeLogsJalali = freezed,Object? currentKm = freezed,Object? nextKm = freezed,Object? serviceProviderId = freezed,Object? reminderTypeId = freezed,Object? reminderSubItems = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? createdAtJalali = freezed,Object? updatedAtJalali = freezed,Object? reminderType = freezed,}) {
  return _then(ReminderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,remainingText: null == remainingText ? _self.remainingText : remainingText // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,isTimeReminder: null == isTimeReminder ? _self.isTimeReminder : isTimeReminder // ignore: cast_nullable_to_non_nullable
as bool,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,progressColor: null == progressColor ? _self.progressColor : progressColor // ignore: cast_nullable_to_non_nullable
as Color,kilometerLogs: freezed == kilometerLogs ? _self.kilometerLogs : kilometerLogs // ignore: cast_nullable_to_non_nullable
as List<KilometerLogModel>?,timeLogs: freezed == timeLogs ? _self.timeLogs : timeLogs // ignore: cast_nullable_to_non_nullable
as List<TimeLogModel>?,kilometerLogsJalali: freezed == kilometerLogsJalali ? _self.kilometerLogsJalali : kilometerLogsJalali // ignore: cast_nullable_to_non_nullable
as List<KilometerLogModel>?,timeLogsJalali: freezed == timeLogsJalali ? _self.timeLogsJalali : timeLogsJalali // ignore: cast_nullable_to_non_nullable
as List<TimeLogModel>?,currentKm: freezed == currentKm ? _self.currentKm : currentKm // ignore: cast_nullable_to_non_nullable
as int?,nextKm: freezed == nextKm ? _self.nextKm : nextKm // ignore: cast_nullable_to_non_nullable
as int?,serviceProviderId: freezed == serviceProviderId ? _self.serviceProviderId : serviceProviderId // ignore: cast_nullable_to_non_nullable
as String?,reminderTypeId: freezed == reminderTypeId ? _self.reminderTypeId : reminderTypeId // ignore: cast_nullable_to_non_nullable
as String?,reminderSubItems: freezed == reminderSubItems ? _self.reminderSubItems : reminderSubItems // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAtJalali: freezed == createdAtJalali ? _self.createdAtJalali : createdAtJalali // ignore: cast_nullable_to_non_nullable
as String?,updatedAtJalali: freezed == updatedAtJalali ? _self.updatedAtJalali : updatedAtJalali // ignore: cast_nullable_to_non_nullable
as String?,reminderType: freezed == reminderType ? _self.reminderType : reminderType // ignore: cast_nullable_to_non_nullable
as ReminderTypeModel?,
  ));
}
/// Create a copy of ReminderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReminderTypeModelCopyWith<$Res>? get reminderType {
    if (_self.reminderType == null) {
    return null;
  }

  return $ReminderTypeModelCopyWith<$Res>(_self.reminderType!, (value) {
    return _then(_self.copyWith(reminderType: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReminderModel].
extension ReminderModelPatterns on ReminderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReminderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReminderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReminderModel value)  $default,){
final _that = this;
switch (_that) {
case _ReminderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReminderModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReminderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'user_id', fromJson: _anyToString)  String? userId, @JsonKey(fromJson: _anyToString)  String title, @JsonKey(fromJson: _anyToString)  String description, @JsonKey(name: 'remaining_text', fromJson: _anyToString)  String remainingText, @JsonKey(fromJson: _anyToDouble)  double progress, @JsonKey(name: 'time_reminder', fromJson: _anyToBool)  bool isTimeReminder, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'color', fromJson: _parseColor, toJson: _colorToJson)  Color progressColor, @JsonKey(name: 'kilometer_logs')  List<KilometerLogModel>? kilometerLogs, @JsonKey(name: 'time_logs')  List<TimeLogModel>? timeLogs, @JsonKey(name: 'kilometer_logs_jalali')  List<KilometerLogModel>? kilometerLogsJalali, @JsonKey(name: 'time_logs_jalali')  List<TimeLogModel>? timeLogsJalali, @JsonKey(name: 'current_km', fromJson: _anyToInt)  int? currentKm, @JsonKey(name: 'next_km', fromJson: _anyToInt)  int? nextKm, @JsonKey(name: 'service_provider_id', fromJson: _anyToString)  String? serviceProviderId, @JsonKey(name: 'reminder_type_id', fromJson: _anyToString)  String? reminderTypeId, @JsonKey(name: 'reminder_sub_items')  List<String>? reminderSubItems, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt, @JsonKey(name: 'created_at_jalali', fromJson: _anyToString)  String? createdAtJalali, @JsonKey(name: 'updated_at_jalali', fromJson: _anyToString)  String? updatedAtJalali, @JsonKey(name: 'reminder_type')  ReminderTypeModel? reminderType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReminderModel() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.description,_that.remainingText,_that.progress,_that.isTimeReminder,_that.imageUrl,_that.progressColor,_that.kilometerLogs,_that.timeLogs,_that.kilometerLogsJalali,_that.timeLogsJalali,_that.currentKm,_that.nextKm,_that.serviceProviderId,_that.reminderTypeId,_that.reminderSubItems,_that.createdAt,_that.updatedAt,_that.createdAtJalali,_that.updatedAtJalali,_that.reminderType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'user_id', fromJson: _anyToString)  String? userId, @JsonKey(fromJson: _anyToString)  String title, @JsonKey(fromJson: _anyToString)  String description, @JsonKey(name: 'remaining_text', fromJson: _anyToString)  String remainingText, @JsonKey(fromJson: _anyToDouble)  double progress, @JsonKey(name: 'time_reminder', fromJson: _anyToBool)  bool isTimeReminder, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'color', fromJson: _parseColor, toJson: _colorToJson)  Color progressColor, @JsonKey(name: 'kilometer_logs')  List<KilometerLogModel>? kilometerLogs, @JsonKey(name: 'time_logs')  List<TimeLogModel>? timeLogs, @JsonKey(name: 'kilometer_logs_jalali')  List<KilometerLogModel>? kilometerLogsJalali, @JsonKey(name: 'time_logs_jalali')  List<TimeLogModel>? timeLogsJalali, @JsonKey(name: 'current_km', fromJson: _anyToInt)  int? currentKm, @JsonKey(name: 'next_km', fromJson: _anyToInt)  int? nextKm, @JsonKey(name: 'service_provider_id', fromJson: _anyToString)  String? serviceProviderId, @JsonKey(name: 'reminder_type_id', fromJson: _anyToString)  String? reminderTypeId, @JsonKey(name: 'reminder_sub_items')  List<String>? reminderSubItems, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt, @JsonKey(name: 'created_at_jalali', fromJson: _anyToString)  String? createdAtJalali, @JsonKey(name: 'updated_at_jalali', fromJson: _anyToString)  String? updatedAtJalali, @JsonKey(name: 'reminder_type')  ReminderTypeModel? reminderType)  $default,) {final _that = this;
switch (_that) {
case _ReminderModel():
return $default(_that.id,_that.userId,_that.title,_that.description,_that.remainingText,_that.progress,_that.isTimeReminder,_that.imageUrl,_that.progressColor,_that.kilometerLogs,_that.timeLogs,_that.kilometerLogsJalali,_that.timeLogsJalali,_that.currentKm,_that.nextKm,_that.serviceProviderId,_that.reminderTypeId,_that.reminderSubItems,_that.createdAt,_that.updatedAt,_that.createdAtJalali,_that.updatedAtJalali,_that.reminderType);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'user_id', fromJson: _anyToString)  String? userId, @JsonKey(fromJson: _anyToString)  String title, @JsonKey(fromJson: _anyToString)  String description, @JsonKey(name: 'remaining_text', fromJson: _anyToString)  String remainingText, @JsonKey(fromJson: _anyToDouble)  double progress, @JsonKey(name: 'time_reminder', fromJson: _anyToBool)  bool isTimeReminder, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'color', fromJson: _parseColor, toJson: _colorToJson)  Color progressColor, @JsonKey(name: 'kilometer_logs')  List<KilometerLogModel>? kilometerLogs, @JsonKey(name: 'time_logs')  List<TimeLogModel>? timeLogs, @JsonKey(name: 'kilometer_logs_jalali')  List<KilometerLogModel>? kilometerLogsJalali, @JsonKey(name: 'time_logs_jalali')  List<TimeLogModel>? timeLogsJalali, @JsonKey(name: 'current_km', fromJson: _anyToInt)  int? currentKm, @JsonKey(name: 'next_km', fromJson: _anyToInt)  int? nextKm, @JsonKey(name: 'service_provider_id', fromJson: _anyToString)  String? serviceProviderId, @JsonKey(name: 'reminder_type_id', fromJson: _anyToString)  String? reminderTypeId, @JsonKey(name: 'reminder_sub_items')  List<String>? reminderSubItems, @JsonKey(name: 'created_at', fromJson: _anyToString)  String? createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString)  String? updatedAt, @JsonKey(name: 'created_at_jalali', fromJson: _anyToString)  String? createdAtJalali, @JsonKey(name: 'updated_at_jalali', fromJson: _anyToString)  String? updatedAtJalali, @JsonKey(name: 'reminder_type')  ReminderTypeModel? reminderType)?  $default,) {final _that = this;
switch (_that) {
case _ReminderModel() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.description,_that.remainingText,_that.progress,_that.isTimeReminder,_that.imageUrl,_that.progressColor,_that.kilometerLogs,_that.timeLogs,_that.kilometerLogsJalali,_that.timeLogsJalali,_that.currentKm,_that.nextKm,_that.serviceProviderId,_that.reminderTypeId,_that.reminderSubItems,_that.createdAt,_that.updatedAt,_that.createdAtJalali,_that.updatedAtJalali,_that.reminderType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReminderModel extends ReminderModel {
  const _ReminderModel({@JsonKey(fromJson: _anyToString) this.id = '', @JsonKey(name: 'user_id', fromJson: _anyToString) this.userId, @JsonKey(fromJson: _anyToString) this.title = '', @JsonKey(fromJson: _anyToString) this.description = '', @JsonKey(name: 'remaining_text', fromJson: _anyToString) this.remainingText = '', @JsonKey(fromJson: _anyToDouble) this.progress = 0.0, @JsonKey(name: 'time_reminder', fromJson: _anyToBool) this.isTimeReminder = false, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'color', fromJson: _parseColor, toJson: _colorToJson) this.progressColor = const Color(0xFF3F51B5), @JsonKey(name: 'kilometer_logs')  List<KilometerLogModel>? kilometerLogs, @JsonKey(name: 'time_logs')  List<TimeLogModel>? timeLogs, @JsonKey(name: 'kilometer_logs_jalali')  List<KilometerLogModel>? kilometerLogsJalali, @JsonKey(name: 'time_logs_jalali')  List<TimeLogModel>? timeLogsJalali, @JsonKey(name: 'current_km', fromJson: _anyToInt) this.currentKm, @JsonKey(name: 'next_km', fromJson: _anyToInt) this.nextKm, @JsonKey(name: 'service_provider_id', fromJson: _anyToString) this.serviceProviderId, @JsonKey(name: 'reminder_type_id', fromJson: _anyToString) this.reminderTypeId, @JsonKey(name: 'reminder_sub_items')  List<String>? reminderSubItems, @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt, @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt, @JsonKey(name: 'created_at_jalali', fromJson: _anyToString) this.createdAtJalali, @JsonKey(name: 'updated_at_jalali', fromJson: _anyToString) this.updatedAtJalali, @JsonKey(name: 'reminder_type') this.reminderType}): _kilometerLogs = kilometerLogs,_timeLogs = timeLogs,_kilometerLogsJalali = kilometerLogsJalali,_timeLogsJalali = timeLogsJalali,_reminderSubItems = reminderSubItems,super._();
  factory _ReminderModel.fromJson(Map<String, dynamic> json) => _$ReminderModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String id;
@override@JsonKey(name: 'user_id', fromJson: _anyToString) final  String? userId;
@override@JsonKey(fromJson: _anyToString) final  String title;
@override@JsonKey(fromJson: _anyToString) final  String description;
@override@JsonKey(name: 'remaining_text', fromJson: _anyToString) final  String remainingText;
@override@JsonKey(fromJson: _anyToDouble) final  double progress;
@override@JsonKey(name: 'time_reminder', fromJson: _anyToBool) final  bool isTimeReminder;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'color', fromJson: _parseColor, toJson: _colorToJson) final  Color progressColor;
 final  List<KilometerLogModel>? _kilometerLogs;
@override@JsonKey(name: 'kilometer_logs') List<KilometerLogModel>? get kilometerLogs {
  final value = _kilometerLogs;
  if (value == null) return null;
  if (_kilometerLogs is EqualUnmodifiableListView) return _kilometerLogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TimeLogModel>? _timeLogs;
@override@JsonKey(name: 'time_logs') List<TimeLogModel>? get timeLogs {
  final value = _timeLogs;
  if (value == null) return null;
  if (_timeLogs is EqualUnmodifiableListView) return _timeLogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<KilometerLogModel>? _kilometerLogsJalali;
@override@JsonKey(name: 'kilometer_logs_jalali') List<KilometerLogModel>? get kilometerLogsJalali {
  final value = _kilometerLogsJalali;
  if (value == null) return null;
  if (_kilometerLogsJalali is EqualUnmodifiableListView) return _kilometerLogsJalali;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TimeLogModel>? _timeLogsJalali;
@override@JsonKey(name: 'time_logs_jalali') List<TimeLogModel>? get timeLogsJalali {
  final value = _timeLogsJalali;
  if (value == null) return null;
  if (_timeLogsJalali is EqualUnmodifiableListView) return _timeLogsJalali;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'current_km', fromJson: _anyToInt) final  int? currentKm;
@override@JsonKey(name: 'next_km', fromJson: _anyToInt) final  int? nextKm;
@override@JsonKey(name: 'service_provider_id', fromJson: _anyToString) final  String? serviceProviderId;
@override@JsonKey(name: 'reminder_type_id', fromJson: _anyToString) final  String? reminderTypeId;
 final  List<String>? _reminderSubItems;
@override@JsonKey(name: 'reminder_sub_items') List<String>? get reminderSubItems {
  final value = _reminderSubItems;
  if (value == null) return null;
  if (_reminderSubItems is EqualUnmodifiableListView) return _reminderSubItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'created_at', fromJson: _anyToString) final  String? createdAt;
@override@JsonKey(name: 'updated_at', fromJson: _anyToString) final  String? updatedAt;
@override@JsonKey(name: 'created_at_jalali', fromJson: _anyToString) final  String? createdAtJalali;
@override@JsonKey(name: 'updated_at_jalali', fromJson: _anyToString) final  String? updatedAtJalali;
@override@JsonKey(name: 'reminder_type') final  ReminderTypeModel? reminderType;

/// Create a copy of ReminderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderModelCopyWith<_ReminderModel> get copyWith => __$ReminderModelCopyWithImpl<_ReminderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReminderModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReminderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.remainingText, remainingText) || other.remainingText == remainingText)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.isTimeReminder, isTimeReminder) || other.isTimeReminder == isTimeReminder)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.progressColor, progressColor) || other.progressColor == progressColor)&&const DeepCollectionEquality().equals(other.kilometerLogs, _kilometerLogs)&&const DeepCollectionEquality().equals(other.timeLogs, _timeLogs)&&const DeepCollectionEquality().equals(other.kilometerLogsJalali, _kilometerLogsJalali)&&const DeepCollectionEquality().equals(other.timeLogsJalali, _timeLogsJalali)&&(identical(other.currentKm, currentKm) || other.currentKm == currentKm)&&(identical(other.nextKm, nextKm) || other.nextKm == nextKm)&&(identical(other.serviceProviderId, serviceProviderId) || other.serviceProviderId == serviceProviderId)&&(identical(other.reminderTypeId, reminderTypeId) || other.reminderTypeId == reminderTypeId)&&const DeepCollectionEquality().equals(other.reminderSubItems, _reminderSubItems)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAtJalali, createdAtJalali) || other.createdAtJalali == createdAtJalali)&&(identical(other.updatedAtJalali, updatedAtJalali) || other.updatedAtJalali == updatedAtJalali)&&(identical(other.reminderType, reminderType) || other.reminderType == reminderType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,userId,title,description,remainingText,progress,isTimeReminder,imageUrl,progressColor,const DeepCollectionEquality().hash(_kilometerLogs),const DeepCollectionEquality().hash(_timeLogs),const DeepCollectionEquality().hash(_kilometerLogsJalali),const DeepCollectionEquality().hash(_timeLogsJalali),currentKm,nextKm,serviceProviderId,reminderTypeId,const DeepCollectionEquality().hash(_reminderSubItems),createdAt,updatedAt,createdAtJalali,updatedAtJalali,reminderType]);
}

@override
String toString() {
    return 'ReminderModel(id: $id, userId: $userId, title: $title, description: $description, remainingText: $remainingText, progress: $progress, isTimeReminder: $isTimeReminder, imageUrl: $imageUrl, progressColor: $progressColor, kilometerLogs: $kilometerLogs, timeLogs: $timeLogs, kilometerLogsJalali: $kilometerLogsJalali, timeLogsJalali: $timeLogsJalali, currentKm: $currentKm, nextKm: $nextKm, serviceProviderId: $serviceProviderId, reminderTypeId: $reminderTypeId, reminderSubItems: $reminderSubItems, createdAt: $createdAt, updatedAt: $updatedAt, createdAtJalali: $createdAtJalali, updatedAtJalali: $updatedAtJalali, reminderType: $reminderType)';
}


}

/// @nodoc
abstract mixin class _$ReminderModelCopyWith<$Res> implements $ReminderModelCopyWith<$Res> {
  factory _$ReminderModelCopyWith(_ReminderModel value, $Res Function(_ReminderModel) _then) = __$ReminderModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(name: 'user_id', fromJson: _anyToString) String? userId,@JsonKey(fromJson: _anyToString) String title,@JsonKey(fromJson: _anyToString) String description,@JsonKey(name: 'remaining_text', fromJson: _anyToString) String remainingText,@JsonKey(fromJson: _anyToDouble) double progress,@JsonKey(name: 'time_reminder', fromJson: _anyToBool) bool isTimeReminder,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'color', fromJson: _parseColor, toJson: _colorToJson) Color progressColor,@JsonKey(name: 'kilometer_logs') List<KilometerLogModel>? kilometerLogs,@JsonKey(name: 'time_logs') List<TimeLogModel>? timeLogs,@JsonKey(name: 'kilometer_logs_jalali') List<KilometerLogModel>? kilometerLogsJalali,@JsonKey(name: 'time_logs_jalali') List<TimeLogModel>? timeLogsJalali,@JsonKey(name: 'current_km', fromJson: _anyToInt) int? currentKm,@JsonKey(name: 'next_km', fromJson: _anyToInt) int? nextKm,@JsonKey(name: 'service_provider_id', fromJson: _anyToString) String? serviceProviderId,@JsonKey(name: 'reminder_type_id', fromJson: _anyToString) String? reminderTypeId,@JsonKey(name: 'reminder_sub_items') List<String>? reminderSubItems,@JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,@JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,@JsonKey(name: 'created_at_jalali', fromJson: _anyToString) String? createdAtJalali,@JsonKey(name: 'updated_at_jalali', fromJson: _anyToString) String? updatedAtJalali,@JsonKey(name: 'reminder_type') ReminderTypeModel? reminderType
});


@override $ReminderTypeModelCopyWith<$Res>? get reminderType;

}
/// @nodoc
class __$ReminderModelCopyWithImpl<$Res>
    implements _$ReminderModelCopyWith<$Res> {
  __$ReminderModelCopyWithImpl(this._self, this._then);

  final _ReminderModel _self;
  final $Res Function(_ReminderModel) _then;

/// Create a copy of ReminderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? title = null,Object? description = null,Object? remainingText = null,Object? progress = null,Object? isTimeReminder = null,Object? imageUrl = freezed,Object? progressColor = null,Object? kilometerLogs = freezed,Object? timeLogs = freezed,Object? kilometerLogsJalali = freezed,Object? timeLogsJalali = freezed,Object? currentKm = freezed,Object? nextKm = freezed,Object? serviceProviderId = freezed,Object? reminderTypeId = freezed,Object? reminderSubItems = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? createdAtJalali = freezed,Object? updatedAtJalali = freezed,Object? reminderType = freezed,}) {
  return _then(_ReminderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,remainingText: null == remainingText ? _self.remainingText : remainingText // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,isTimeReminder: null == isTimeReminder ? _self.isTimeReminder : isTimeReminder // ignore: cast_nullable_to_non_nullable
as bool,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,progressColor: null == progressColor ? _self.progressColor : progressColor // ignore: cast_nullable_to_non_nullable
as Color,kilometerLogs: freezed == kilometerLogs ? _self._kilometerLogs : kilometerLogs // ignore: cast_nullable_to_non_nullable
as List<KilometerLogModel>?,timeLogs: freezed == timeLogs ? _self._timeLogs : timeLogs // ignore: cast_nullable_to_non_nullable
as List<TimeLogModel>?,kilometerLogsJalali: freezed == kilometerLogsJalali ? _self._kilometerLogsJalali : kilometerLogsJalali // ignore: cast_nullable_to_non_nullable
as List<KilometerLogModel>?,timeLogsJalali: freezed == timeLogsJalali ? _self._timeLogsJalali : timeLogsJalali // ignore: cast_nullable_to_non_nullable
as List<TimeLogModel>?,currentKm: freezed == currentKm ? _self.currentKm : currentKm // ignore: cast_nullable_to_non_nullable
as int?,nextKm: freezed == nextKm ? _self.nextKm : nextKm // ignore: cast_nullable_to_non_nullable
as int?,serviceProviderId: freezed == serviceProviderId ? _self.serviceProviderId : serviceProviderId // ignore: cast_nullable_to_non_nullable
as String?,reminderTypeId: freezed == reminderTypeId ? _self.reminderTypeId : reminderTypeId // ignore: cast_nullable_to_non_nullable
as String?,reminderSubItems: freezed == reminderSubItems ? _self._reminderSubItems : reminderSubItems // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAtJalali: freezed == createdAtJalali ? _self.createdAtJalali : createdAtJalali // ignore: cast_nullable_to_non_nullable
as String?,updatedAtJalali: freezed == updatedAtJalali ? _self.updatedAtJalali : updatedAtJalali // ignore: cast_nullable_to_non_nullable
as String?,reminderType: freezed == reminderType ? _self.reminderType : reminderType // ignore: cast_nullable_to_non_nullable
as ReminderTypeModel?,
  ));
}

/// Create a copy of ReminderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReminderTypeModelCopyWith<$Res>? get reminderType {
    if (_self.reminderType == null) {
    return null;
  }

  return $ReminderTypeModelCopyWith<$Res>(_self.reminderType!, (value) {
    return _then(_self.copyWith(reminderType: value));
  });
}
}


/// @nodoc
mixin _$KilometerLogModel {

@JsonKey(fromJson: _anyToString) String get date; List<String> get items;@JsonKey(name: 'done_km', fromJson: _anyToInt) int get doneKm;@JsonKey(name: 'next_km', fromJson: _anyToInt) int get nextKm;
/// Create a copy of KilometerLogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KilometerLogModelCopyWith<KilometerLogModel> get copyWith => _$KilometerLogModelCopyWithImpl<KilometerLogModel>(this as KilometerLogModel, _$identity);

  /// Serializes this KilometerLogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as KilometerLogModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KilometerLogModel&&(identical(other.date, _this.date) || other.date == _this.date)&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.doneKm, _this.doneKm) || other.doneKm == _this.doneKm)&&(identical(other.nextKm, _this.nextKm) || other.nextKm == _this.nextKm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as KilometerLogModel;
  return Object.hash(runtimeType,_this.date,const DeepCollectionEquality().hash(_this.items),_this.doneKm,_this.nextKm);
}

@override
String toString() {
  final _this = this as KilometerLogModel;
  return 'KilometerLogModel(date: ${_this.date}, items: ${_this.items}, doneKm: ${_this.doneKm}, nextKm: ${_this.nextKm})';
}


}

/// @nodoc
abstract mixin class $KilometerLogModelCopyWith<$Res>  {
  factory $KilometerLogModelCopyWith(KilometerLogModel value, $Res Function(KilometerLogModel) _then) = _$KilometerLogModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String date, List<String> items,@JsonKey(name: 'done_km', fromJson: _anyToInt) int doneKm,@JsonKey(name: 'next_km', fromJson: _anyToInt) int nextKm
});




}
/// @nodoc
class _$KilometerLogModelCopyWithImpl<$Res>
    implements $KilometerLogModelCopyWith<$Res> {
  _$KilometerLogModelCopyWithImpl(this._self, this._then);

  final KilometerLogModel _self;
  final $Res Function(KilometerLogModel) _then;

/// Create a copy of KilometerLogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? items = null,Object? doneKm = null,Object? nextKm = null,}) {
  return _then(KilometerLogModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<String>,doneKm: null == doneKm ? _self.doneKm : doneKm // ignore: cast_nullable_to_non_nullable
as int,nextKm: null == nextKm ? _self.nextKm : nextKm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [KilometerLogModel].
extension KilometerLogModelPatterns on KilometerLogModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KilometerLogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KilometerLogModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KilometerLogModel value)  $default,){
final _that = this;
switch (_that) {
case _KilometerLogModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KilometerLogModel value)?  $default,){
final _that = this;
switch (_that) {
case _KilometerLogModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String date,  List<String> items, @JsonKey(name: 'done_km', fromJson: _anyToInt)  int doneKm, @JsonKey(name: 'next_km', fromJson: _anyToInt)  int nextKm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KilometerLogModel() when $default != null:
return $default(_that.date,_that.items,_that.doneKm,_that.nextKm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String date,  List<String> items, @JsonKey(name: 'done_km', fromJson: _anyToInt)  int doneKm, @JsonKey(name: 'next_km', fromJson: _anyToInt)  int nextKm)  $default,) {final _that = this;
switch (_that) {
case _KilometerLogModel():
return $default(_that.date,_that.items,_that.doneKm,_that.nextKm);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String date,  List<String> items, @JsonKey(name: 'done_km', fromJson: _anyToInt)  int doneKm, @JsonKey(name: 'next_km', fromJson: _anyToInt)  int nextKm)?  $default,) {final _that = this;
switch (_that) {
case _KilometerLogModel() when $default != null:
return $default(_that.date,_that.items,_that.doneKm,_that.nextKm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KilometerLogModel extends KilometerLogModel {
  const _KilometerLogModel({@JsonKey(fromJson: _anyToString) this.date = '',  List<String> items = const [], @JsonKey(name: 'done_km', fromJson: _anyToInt) this.doneKm = 0, @JsonKey(name: 'next_km', fromJson: _anyToInt) this.nextKm = 0}): _items = items,super._();
  factory _KilometerLogModel.fromJson(Map<String, dynamic> json) => _$KilometerLogModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String date;
 final  List<String> _items;
@override@JsonKey() List<String> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: 'done_km', fromJson: _anyToInt) final  int doneKm;
@override@JsonKey(name: 'next_km', fromJson: _anyToInt) final  int nextKm;

/// Create a copy of KilometerLogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KilometerLogModelCopyWith<_KilometerLogModel> get copyWith => __$KilometerLogModelCopyWithImpl<_KilometerLogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KilometerLogModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _KilometerLogModel&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.doneKm, doneKm) || other.doneKm == doneKm)&&(identical(other.nextKm, nextKm) || other.nextKm == nextKm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,date,const DeepCollectionEquality().hash(_items),doneKm,nextKm);
}

@override
String toString() {
    return 'KilometerLogModel(date: $date, items: $items, doneKm: $doneKm, nextKm: $nextKm)';
}


}

/// @nodoc
abstract mixin class _$KilometerLogModelCopyWith<$Res> implements $KilometerLogModelCopyWith<$Res> {
  factory _$KilometerLogModelCopyWith(_KilometerLogModel value, $Res Function(_KilometerLogModel) _then) = __$KilometerLogModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String date, List<String> items,@JsonKey(name: 'done_km', fromJson: _anyToInt) int doneKm,@JsonKey(name: 'next_km', fromJson: _anyToInt) int nextKm
});




}
/// @nodoc
class __$KilometerLogModelCopyWithImpl<$Res>
    implements _$KilometerLogModelCopyWith<$Res> {
  __$KilometerLogModelCopyWithImpl(this._self, this._then);

  final _KilometerLogModel _self;
  final $Res Function(_KilometerLogModel) _then;

/// Create a copy of KilometerLogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? items = null,Object? doneKm = null,Object? nextKm = null,}) {
  return _then(_KilometerLogModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<String>,doneKm: null == doneKm ? _self.doneKm : doneKm // ignore: cast_nullable_to_non_nullable
as int,nextKm: null == nextKm ? _self.nextKm : nextKm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TimeLogModel {

 List<String> get items;@JsonKey(name: 'done_date', fromJson: _anyToString) String get doneDate;@JsonKey(name: 'next_date', fromJson: _anyToString) String get nextDate;
/// Create a copy of TimeLogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeLogModelCopyWith<TimeLogModel> get copyWith => _$TimeLogModelCopyWithImpl<TimeLogModel>(this as TimeLogModel, _$identity);

  /// Serializes this TimeLogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TimeLogModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeLogModel&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.doneDate, _this.doneDate) || other.doneDate == _this.doneDate)&&(identical(other.nextDate, _this.nextDate) || other.nextDate == _this.nextDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TimeLogModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.items),_this.doneDate,_this.nextDate);
}

@override
String toString() {
  final _this = this as TimeLogModel;
  return 'TimeLogModel(items: ${_this.items}, doneDate: ${_this.doneDate}, nextDate: ${_this.nextDate})';
}


}

/// @nodoc
abstract mixin class $TimeLogModelCopyWith<$Res>  {
  factory $TimeLogModelCopyWith(TimeLogModel value, $Res Function(TimeLogModel) _then) = _$TimeLogModelCopyWithImpl;
@useResult
$Res call({
 List<String> items,@JsonKey(name: 'done_date', fromJson: _anyToString) String doneDate,@JsonKey(name: 'next_date', fromJson: _anyToString) String nextDate
});




}
/// @nodoc
class _$TimeLogModelCopyWithImpl<$Res>
    implements $TimeLogModelCopyWith<$Res> {
  _$TimeLogModelCopyWithImpl(this._self, this._then);

  final TimeLogModel _self;
  final $Res Function(TimeLogModel) _then;

/// Create a copy of TimeLogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? doneDate = null,Object? nextDate = null,}) {
  return _then(TimeLogModel(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<String>,doneDate: null == doneDate ? _self.doneDate : doneDate // ignore: cast_nullable_to_non_nullable
as String,nextDate: null == nextDate ? _self.nextDate : nextDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeLogModel].
extension TimeLogModelPatterns on TimeLogModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeLogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeLogModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeLogModel value)  $default,){
final _that = this;
switch (_that) {
case _TimeLogModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeLogModel value)?  $default,){
final _that = this;
switch (_that) {
case _TimeLogModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> items, @JsonKey(name: 'done_date', fromJson: _anyToString)  String doneDate, @JsonKey(name: 'next_date', fromJson: _anyToString)  String nextDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeLogModel() when $default != null:
return $default(_that.items,_that.doneDate,_that.nextDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> items, @JsonKey(name: 'done_date', fromJson: _anyToString)  String doneDate, @JsonKey(name: 'next_date', fromJson: _anyToString)  String nextDate)  $default,) {final _that = this;
switch (_that) {
case _TimeLogModel():
return $default(_that.items,_that.doneDate,_that.nextDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> items, @JsonKey(name: 'done_date', fromJson: _anyToString)  String doneDate, @JsonKey(name: 'next_date', fromJson: _anyToString)  String nextDate)?  $default,) {final _that = this;
switch (_that) {
case _TimeLogModel() when $default != null:
return $default(_that.items,_that.doneDate,_that.nextDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeLogModel extends TimeLogModel {
  const _TimeLogModel({ List<String> items = const [], @JsonKey(name: 'done_date', fromJson: _anyToString) this.doneDate = '', @JsonKey(name: 'next_date', fromJson: _anyToString) this.nextDate = ''}): _items = items,super._();
  factory _TimeLogModel.fromJson(Map<String, dynamic> json) => _$TimeLogModelFromJson(json);

 final  List<String> _items;
@override@JsonKey() List<String> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: 'done_date', fromJson: _anyToString) final  String doneDate;
@override@JsonKey(name: 'next_date', fromJson: _anyToString) final  String nextDate;

/// Create a copy of TimeLogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeLogModelCopyWith<_TimeLogModel> get copyWith => __$TimeLogModelCopyWithImpl<_TimeLogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeLogModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeLogModel&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.doneDate, doneDate) || other.doneDate == doneDate)&&(identical(other.nextDate, nextDate) || other.nextDate == nextDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),doneDate,nextDate);
}

@override
String toString() {
    return 'TimeLogModel(items: $items, doneDate: $doneDate, nextDate: $nextDate)';
}


}

/// @nodoc
abstract mixin class _$TimeLogModelCopyWith<$Res> implements $TimeLogModelCopyWith<$Res> {
  factory _$TimeLogModelCopyWith(_TimeLogModel value, $Res Function(_TimeLogModel) _then) = __$TimeLogModelCopyWithImpl;
@override @useResult
$Res call({
 List<String> items,@JsonKey(name: 'done_date', fromJson: _anyToString) String doneDate,@JsonKey(name: 'next_date', fromJson: _anyToString) String nextDate
});




}
/// @nodoc
class __$TimeLogModelCopyWithImpl<$Res>
    implements _$TimeLogModelCopyWith<$Res> {
  __$TimeLogModelCopyWithImpl(this._self, this._then);

  final _TimeLogModel _self;
  final $Res Function(_TimeLogModel) _then;

/// Create a copy of TimeLogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? doneDate = null,Object? nextDate = null,}) {
  return _then(_TimeLogModel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<String>,doneDate: null == doneDate ? _self.doneDate : doneDate // ignore: cast_nullable_to_non_nullable
as String,nextDate: null == nextDate ? _self.nextDate : nextDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ReminderListModel {

 List<ReminderModel> get items;@JsonKey(name: 'current_page') int get currentPage;@JsonKey(name: 'last_page') int get lastPage;@JsonKey(fromJson: _anyToInt) int get total;
/// Create a copy of ReminderListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderListModelCopyWith<ReminderListModel> get copyWith => _$ReminderListModelCopyWithImpl<ReminderListModel>(this as ReminderListModel, _$identity);

  /// Serializes this ReminderListModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReminderListModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderListModel&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&(identical(other.lastPage, _this.lastPage) || other.lastPage == _this.lastPage)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReminderListModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.items),_this.currentPage,_this.lastPage,_this.total);
}

@override
String toString() {
  final _this = this as ReminderListModel;
  return 'ReminderListModel(items: ${_this.items}, currentPage: ${_this.currentPage}, lastPage: ${_this.lastPage}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $ReminderListModelCopyWith<$Res>  {
  factory $ReminderListModelCopyWith(ReminderListModel value, $Res Function(ReminderListModel) _then) = _$ReminderListModelCopyWithImpl;
@useResult
$Res call({
 List<ReminderModel> items,@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'last_page') int lastPage,@JsonKey(fromJson: _anyToInt) int total
});




}
/// @nodoc
class _$ReminderListModelCopyWithImpl<$Res>
    implements $ReminderListModelCopyWith<$Res> {
  _$ReminderListModelCopyWithImpl(this._self, this._then);

  final ReminderListModel _self;
  final $Res Function(ReminderListModel) _then;

/// Create a copy of ReminderListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? currentPage = null,Object? lastPage = null,Object? total = null,}) {
  return _then(ReminderListModel(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ReminderModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReminderListModel].
extension ReminderListModelPatterns on ReminderListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReminderListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReminderListModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReminderListModel value)  $default,){
final _that = this;
switch (_that) {
case _ReminderListModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReminderListModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReminderListModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ReminderModel> items, @JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(fromJson: _anyToInt)  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReminderListModel() when $default != null:
return $default(_that.items,_that.currentPage,_that.lastPage,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ReminderModel> items, @JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(fromJson: _anyToInt)  int total)  $default,) {final _that = this;
switch (_that) {
case _ReminderListModel():
return $default(_that.items,_that.currentPage,_that.lastPage,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ReminderModel> items, @JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(fromJson: _anyToInt)  int total)?  $default,) {final _that = this;
switch (_that) {
case _ReminderListModel() when $default != null:
return $default(_that.items,_that.currentPage,_that.lastPage,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReminderListModel extends ReminderListModel {
  const _ReminderListModel({ List<ReminderModel> items = const [], @JsonKey(name: 'current_page') this.currentPage = 1, @JsonKey(name: 'last_page') this.lastPage = 1, @JsonKey(fromJson: _anyToInt) this.total = 0}): _items = items,super._();
  factory _ReminderListModel.fromJson(Map<String, dynamic> json) => _$ReminderListModelFromJson(json);

 final  List<ReminderModel> _items;
@override@JsonKey() List<ReminderModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: 'current_page') final  int currentPage;
@override@JsonKey(name: 'last_page') final  int lastPage;
@override@JsonKey(fromJson: _anyToInt) final  int total;

/// Create a copy of ReminderListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderListModelCopyWith<_ReminderListModel> get copyWith => __$ReminderListModelCopyWithImpl<_ReminderListModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReminderListModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReminderListModel&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),currentPage,lastPage,total);
}

@override
String toString() {
    return 'ReminderListModel(items: $items, currentPage: $currentPage, lastPage: $lastPage, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ReminderListModelCopyWith<$Res> implements $ReminderListModelCopyWith<$Res> {
  factory _$ReminderListModelCopyWith(_ReminderListModel value, $Res Function(_ReminderListModel) _then) = __$ReminderListModelCopyWithImpl;
@override @useResult
$Res call({
 List<ReminderModel> items,@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'last_page') int lastPage,@JsonKey(fromJson: _anyToInt) int total
});




}
/// @nodoc
class __$ReminderListModelCopyWithImpl<$Res>
    implements _$ReminderListModelCopyWith<$Res> {
  __$ReminderListModelCopyWithImpl(this._self, this._then);

  final _ReminderListModel _self;
  final $Res Function(_ReminderListModel) _then;

/// Create a copy of ReminderListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? currentPage = null,Object? lastPage = null,Object? total = null,}) {
  return _then(_ReminderListModel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ReminderModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
