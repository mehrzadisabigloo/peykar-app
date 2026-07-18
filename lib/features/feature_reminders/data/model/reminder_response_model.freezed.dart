// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReminderModel _$ReminderModelFromJson(Map<String, dynamic> json) {
  return _ReminderModel.fromJson(json);
}

/// @nodoc
mixin _$ReminderModel {
  @JsonKey(fromJson: _anyToString)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', fromJson: _anyToString)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String get title => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_text', fromJson: _anyToString)
  String get remainingText => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToDouble)
  double get progress => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_reminder', fromJson: _anyToBool)
  bool get isTimeReminder => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'color', fromJson: _parseColor, toJson: _colorToJson)
  Color get progressColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'kilometer_logs')
  List<KilometerLogModel>? get kilometerLogs =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'time_logs')
  List<TimeLogModel>? get timeLogs => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_km', fromJson: _anyToInt)
  int? get currentKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_km', fromJson: _anyToInt)
  int? get nextKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_provider_id', fromJson: _anyToString)
  String? get serviceProviderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ReminderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderModelCopyWith<ReminderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderModelCopyWith<$Res> {
  factory $ReminderModelCopyWith(
    ReminderModel value,
    $Res Function(ReminderModel) then,
  ) = _$ReminderModelCopyWithImpl<$Res, ReminderModel>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String id,
    @JsonKey(name: 'user_id', fromJson: _anyToString) String? userId,
    @JsonKey(fromJson: _anyToString) String title,
    @JsonKey(fromJson: _anyToString) String description,
    @JsonKey(name: 'remaining_text', fromJson: _anyToString)
    String remainingText,
    @JsonKey(fromJson: _anyToDouble) double progress,
    @JsonKey(name: 'time_reminder', fromJson: _anyToBool) bool isTimeReminder,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'color', fromJson: _parseColor, toJson: _colorToJson)
    Color progressColor,
    @JsonKey(name: 'kilometer_logs') List<KilometerLogModel>? kilometerLogs,
    @JsonKey(name: 'time_logs') List<TimeLogModel>? timeLogs,
    @JsonKey(name: 'current_km', fromJson: _anyToInt) int? currentKm,
    @JsonKey(name: 'next_km', fromJson: _anyToInt) int? nextKm,
    @JsonKey(name: 'service_provider_id', fromJson: _anyToString)
    String? serviceProviderId,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
  });
}

/// @nodoc
class _$ReminderModelCopyWithImpl<$Res, $Val extends ReminderModel>
    implements $ReminderModelCopyWith<$Res> {
  _$ReminderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? title = null,
    Object? description = null,
    Object? remainingText = null,
    Object? progress = null,
    Object? isTimeReminder = null,
    Object? imageUrl = freezed,
    Object? progressColor = null,
    Object? kilometerLogs = freezed,
    Object? timeLogs = freezed,
    Object? currentKm = freezed,
    Object? nextKm = freezed,
    Object? serviceProviderId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            remainingText: null == remainingText
                ? _value.remainingText
                : remainingText // ignore: cast_nullable_to_non_nullable
                      as String,
            progress: null == progress
                ? _value.progress
                : progress // ignore: cast_nullable_to_non_nullable
                      as double,
            isTimeReminder: null == isTimeReminder
                ? _value.isTimeReminder
                : isTimeReminder // ignore: cast_nullable_to_non_nullable
                      as bool,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            progressColor: null == progressColor
                ? _value.progressColor
                : progressColor // ignore: cast_nullable_to_non_nullable
                      as Color,
            kilometerLogs: freezed == kilometerLogs
                ? _value.kilometerLogs
                : kilometerLogs // ignore: cast_nullable_to_non_nullable
                      as List<KilometerLogModel>?,
            timeLogs: freezed == timeLogs
                ? _value.timeLogs
                : timeLogs // ignore: cast_nullable_to_non_nullable
                      as List<TimeLogModel>?,
            currentKm: freezed == currentKm
                ? _value.currentKm
                : currentKm // ignore: cast_nullable_to_non_nullable
                      as int?,
            nextKm: freezed == nextKm
                ? _value.nextKm
                : nextKm // ignore: cast_nullable_to_non_nullable
                      as int?,
            serviceProviderId: freezed == serviceProviderId
                ? _value.serviceProviderId
                : serviceProviderId // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReminderModelImplCopyWith<$Res>
    implements $ReminderModelCopyWith<$Res> {
  factory _$$ReminderModelImplCopyWith(
    _$ReminderModelImpl value,
    $Res Function(_$ReminderModelImpl) then,
  ) = __$$ReminderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String id,
    @JsonKey(name: 'user_id', fromJson: _anyToString) String? userId,
    @JsonKey(fromJson: _anyToString) String title,
    @JsonKey(fromJson: _anyToString) String description,
    @JsonKey(name: 'remaining_text', fromJson: _anyToString)
    String remainingText,
    @JsonKey(fromJson: _anyToDouble) double progress,
    @JsonKey(name: 'time_reminder', fromJson: _anyToBool) bool isTimeReminder,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'color', fromJson: _parseColor, toJson: _colorToJson)
    Color progressColor,
    @JsonKey(name: 'kilometer_logs') List<KilometerLogModel>? kilometerLogs,
    @JsonKey(name: 'time_logs') List<TimeLogModel>? timeLogs,
    @JsonKey(name: 'current_km', fromJson: _anyToInt) int? currentKm,
    @JsonKey(name: 'next_km', fromJson: _anyToInt) int? nextKm,
    @JsonKey(name: 'service_provider_id', fromJson: _anyToString)
    String? serviceProviderId,
    @JsonKey(name: 'created_at', fromJson: _anyToString) String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) String? updatedAt,
  });
}

/// @nodoc
class __$$ReminderModelImplCopyWithImpl<$Res>
    extends _$ReminderModelCopyWithImpl<$Res, _$ReminderModelImpl>
    implements _$$ReminderModelImplCopyWith<$Res> {
  __$$ReminderModelImplCopyWithImpl(
    _$ReminderModelImpl _value,
    $Res Function(_$ReminderModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? title = null,
    Object? description = null,
    Object? remainingText = null,
    Object? progress = null,
    Object? isTimeReminder = null,
    Object? imageUrl = freezed,
    Object? progressColor = null,
    Object? kilometerLogs = freezed,
    Object? timeLogs = freezed,
    Object? currentKm = freezed,
    Object? nextKm = freezed,
    Object? serviceProviderId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ReminderModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        remainingText: null == remainingText
            ? _value.remainingText
            : remainingText // ignore: cast_nullable_to_non_nullable
                  as String,
        progress: null == progress
            ? _value.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as double,
        isTimeReminder: null == isTimeReminder
            ? _value.isTimeReminder
            : isTimeReminder // ignore: cast_nullable_to_non_nullable
                  as bool,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        progressColor: null == progressColor
            ? _value.progressColor
            : progressColor // ignore: cast_nullable_to_non_nullable
                  as Color,
        kilometerLogs: freezed == kilometerLogs
            ? _value._kilometerLogs
            : kilometerLogs // ignore: cast_nullable_to_non_nullable
                  as List<KilometerLogModel>?,
        timeLogs: freezed == timeLogs
            ? _value._timeLogs
            : timeLogs // ignore: cast_nullable_to_non_nullable
                  as List<TimeLogModel>?,
        currentKm: freezed == currentKm
            ? _value.currentKm
            : currentKm // ignore: cast_nullable_to_non_nullable
                  as int?,
        nextKm: freezed == nextKm
            ? _value.nextKm
            : nextKm // ignore: cast_nullable_to_non_nullable
                  as int?,
        serviceProviderId: freezed == serviceProviderId
            ? _value.serviceProviderId
            : serviceProviderId // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReminderModelImpl extends _ReminderModel {
  const _$ReminderModelImpl({
    @JsonKey(fromJson: _anyToString) this.id = '',
    @JsonKey(name: 'user_id', fromJson: _anyToString) this.userId,
    @JsonKey(fromJson: _anyToString) this.title = '',
    @JsonKey(fromJson: _anyToString) this.description = '',
    @JsonKey(name: 'remaining_text', fromJson: _anyToString)
    this.remainingText = '',
    @JsonKey(fromJson: _anyToDouble) this.progress = 0.0,
    @JsonKey(name: 'time_reminder', fromJson: _anyToBool)
    this.isTimeReminder = false,
    @JsonKey(name: 'image_url') this.imageUrl,
    @JsonKey(name: 'color', fromJson: _parseColor, toJson: _colorToJson)
    this.progressColor = const Color(0xFF3F51B5),
    @JsonKey(name: 'kilometer_logs')
    final List<KilometerLogModel>? kilometerLogs,
    @JsonKey(name: 'time_logs') final List<TimeLogModel>? timeLogs,
    @JsonKey(name: 'current_km', fromJson: _anyToInt) this.currentKm,
    @JsonKey(name: 'next_km', fromJson: _anyToInt) this.nextKm,
    @JsonKey(name: 'service_provider_id', fromJson: _anyToString)
    this.serviceProviderId,
    @JsonKey(name: 'created_at', fromJson: _anyToString) this.createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString) this.updatedAt,
  }) : _kilometerLogs = kilometerLogs,
       _timeLogs = timeLogs,
       super._();

  factory _$ReminderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _anyToString)
  final String id;
  @override
  @JsonKey(name: 'user_id', fromJson: _anyToString)
  final String? userId;
  @override
  @JsonKey(fromJson: _anyToString)
  final String title;
  @override
  @JsonKey(fromJson: _anyToString)
  final String description;
  @override
  @JsonKey(name: 'remaining_text', fromJson: _anyToString)
  final String remainingText;
  @override
  @JsonKey(fromJson: _anyToDouble)
  final double progress;
  @override
  @JsonKey(name: 'time_reminder', fromJson: _anyToBool)
  final bool isTimeReminder;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'color', fromJson: _parseColor, toJson: _colorToJson)
  final Color progressColor;
  final List<KilometerLogModel>? _kilometerLogs;
  @override
  @JsonKey(name: 'kilometer_logs')
  List<KilometerLogModel>? get kilometerLogs {
    final value = _kilometerLogs;
    if (value == null) return null;
    if (_kilometerLogs is EqualUnmodifiableListView) return _kilometerLogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TimeLogModel>? _timeLogs;
  @override
  @JsonKey(name: 'time_logs')
  List<TimeLogModel>? get timeLogs {
    final value = _timeLogs;
    if (value == null) return null;
    if (_timeLogs is EqualUnmodifiableListView) return _timeLogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'current_km', fromJson: _anyToInt)
  final int? currentKm;
  @override
  @JsonKey(name: 'next_km', fromJson: _anyToInt)
  final int? nextKm;
  @override
  @JsonKey(name: 'service_provider_id', fromJson: _anyToString)
  final String? serviceProviderId;
  @override
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  final String? updatedAt;

  @override
  String toString() {
    return 'ReminderModel(id: $id, userId: $userId, title: $title, description: $description, remainingText: $remainingText, progress: $progress, isTimeReminder: $isTimeReminder, imageUrl: $imageUrl, progressColor: $progressColor, kilometerLogs: $kilometerLogs, timeLogs: $timeLogs, currentKm: $currentKm, nextKm: $nextKm, serviceProviderId: $serviceProviderId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.remainingText, remainingText) ||
                other.remainingText == remainingText) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.isTimeReminder, isTimeReminder) ||
                other.isTimeReminder == isTimeReminder) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.progressColor, progressColor) ||
                other.progressColor == progressColor) &&
            const DeepCollectionEquality().equals(
              other._kilometerLogs,
              _kilometerLogs,
            ) &&
            const DeepCollectionEquality().equals(other._timeLogs, _timeLogs) &&
            (identical(other.currentKm, currentKm) ||
                other.currentKm == currentKm) &&
            (identical(other.nextKm, nextKm) || other.nextKm == nextKm) &&
            (identical(other.serviceProviderId, serviceProviderId) ||
                other.serviceProviderId == serviceProviderId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    title,
    description,
    remainingText,
    progress,
    isTimeReminder,
    imageUrl,
    progressColor,
    const DeepCollectionEquality().hash(_kilometerLogs),
    const DeepCollectionEquality().hash(_timeLogs),
    currentKm,
    nextKm,
    serviceProviderId,
    createdAt,
    updatedAt,
  );

  /// Create a copy of ReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderModelImplCopyWith<_$ReminderModelImpl> get copyWith =>
      __$$ReminderModelImplCopyWithImpl<_$ReminderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderModelImplToJson(this);
  }
}

abstract class _ReminderModel extends ReminderModel {
  const factory _ReminderModel({
    @JsonKey(fromJson: _anyToString) final String id,
    @JsonKey(name: 'user_id', fromJson: _anyToString) final String? userId,
    @JsonKey(fromJson: _anyToString) final String title,
    @JsonKey(fromJson: _anyToString) final String description,
    @JsonKey(name: 'remaining_text', fromJson: _anyToString)
    final String remainingText,
    @JsonKey(fromJson: _anyToDouble) final double progress,
    @JsonKey(name: 'time_reminder', fromJson: _anyToBool)
    final bool isTimeReminder,
    @JsonKey(name: 'image_url') final String? imageUrl,
    @JsonKey(name: 'color', fromJson: _parseColor, toJson: _colorToJson)
    final Color progressColor,
    @JsonKey(name: 'kilometer_logs')
    final List<KilometerLogModel>? kilometerLogs,
    @JsonKey(name: 'time_logs') final List<TimeLogModel>? timeLogs,
    @JsonKey(name: 'current_km', fromJson: _anyToInt) final int? currentKm,
    @JsonKey(name: 'next_km', fromJson: _anyToInt) final int? nextKm,
    @JsonKey(name: 'service_provider_id', fromJson: _anyToString)
    final String? serviceProviderId,
    @JsonKey(name: 'created_at', fromJson: _anyToString)
    final String? createdAt,
    @JsonKey(name: 'updated_at', fromJson: _anyToString)
    final String? updatedAt,
  }) = _$ReminderModelImpl;
  const _ReminderModel._() : super._();

  factory _ReminderModel.fromJson(Map<String, dynamic> json) =
      _$ReminderModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _anyToString)
  String get id;
  @override
  @JsonKey(name: 'user_id', fromJson: _anyToString)
  String? get userId;
  @override
  @JsonKey(fromJson: _anyToString)
  String get title;
  @override
  @JsonKey(fromJson: _anyToString)
  String get description;
  @override
  @JsonKey(name: 'remaining_text', fromJson: _anyToString)
  String get remainingText;
  @override
  @JsonKey(fromJson: _anyToDouble)
  double get progress;
  @override
  @JsonKey(name: 'time_reminder', fromJson: _anyToBool)
  bool get isTimeReminder;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'color', fromJson: _parseColor, toJson: _colorToJson)
  Color get progressColor;
  @override
  @JsonKey(name: 'kilometer_logs')
  List<KilometerLogModel>? get kilometerLogs;
  @override
  @JsonKey(name: 'time_logs')
  List<TimeLogModel>? get timeLogs;
  @override
  @JsonKey(name: 'current_km', fromJson: _anyToInt)
  int? get currentKm;
  @override
  @JsonKey(name: 'next_km', fromJson: _anyToInt)
  int? get nextKm;
  @override
  @JsonKey(name: 'service_provider_id', fromJson: _anyToString)
  String? get serviceProviderId;
  @override
  @JsonKey(name: 'created_at', fromJson: _anyToString)
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: _anyToString)
  String? get updatedAt;

  /// Create a copy of ReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderModelImplCopyWith<_$ReminderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KilometerLogModel _$KilometerLogModelFromJson(Map<String, dynamic> json) {
  return _KilometerLogModel.fromJson(json);
}

/// @nodoc
mixin _$KilometerLogModel {
  @JsonKey(fromJson: _anyToString)
  String get date => throw _privateConstructorUsedError;
  List<String> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'done_km', fromJson: _anyToInt)
  int get doneKm => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_km', fromJson: _anyToInt)
  int get nextKm => throw _privateConstructorUsedError;

  /// Serializes this KilometerLogModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KilometerLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KilometerLogModelCopyWith<KilometerLogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KilometerLogModelCopyWith<$Res> {
  factory $KilometerLogModelCopyWith(
    KilometerLogModel value,
    $Res Function(KilometerLogModel) then,
  ) = _$KilometerLogModelCopyWithImpl<$Res, KilometerLogModel>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String date,
    List<String> items,
    @JsonKey(name: 'done_km', fromJson: _anyToInt) int doneKm,
    @JsonKey(name: 'next_km', fromJson: _anyToInt) int nextKm,
  });
}

/// @nodoc
class _$KilometerLogModelCopyWithImpl<$Res, $Val extends KilometerLogModel>
    implements $KilometerLogModelCopyWith<$Res> {
  _$KilometerLogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KilometerLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? items = null,
    Object? doneKm = null,
    Object? nextKm = null,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            doneKm: null == doneKm
                ? _value.doneKm
                : doneKm // ignore: cast_nullable_to_non_nullable
                      as int,
            nextKm: null == nextKm
                ? _value.nextKm
                : nextKm // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$KilometerLogModelImplCopyWith<$Res>
    implements $KilometerLogModelCopyWith<$Res> {
  factory _$$KilometerLogModelImplCopyWith(
    _$KilometerLogModelImpl value,
    $Res Function(_$KilometerLogModelImpl) then,
  ) = __$$KilometerLogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String date,
    List<String> items,
    @JsonKey(name: 'done_km', fromJson: _anyToInt) int doneKm,
    @JsonKey(name: 'next_km', fromJson: _anyToInt) int nextKm,
  });
}

/// @nodoc
class __$$KilometerLogModelImplCopyWithImpl<$Res>
    extends _$KilometerLogModelCopyWithImpl<$Res, _$KilometerLogModelImpl>
    implements _$$KilometerLogModelImplCopyWith<$Res> {
  __$$KilometerLogModelImplCopyWithImpl(
    _$KilometerLogModelImpl _value,
    $Res Function(_$KilometerLogModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KilometerLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? items = null,
    Object? doneKm = null,
    Object? nextKm = null,
  }) {
    return _then(
      _$KilometerLogModelImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        doneKm: null == doneKm
            ? _value.doneKm
            : doneKm // ignore: cast_nullable_to_non_nullable
                  as int,
        nextKm: null == nextKm
            ? _value.nextKm
            : nextKm // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$KilometerLogModelImpl extends _KilometerLogModel {
  const _$KilometerLogModelImpl({
    @JsonKey(fromJson: _anyToString) this.date = '',
    final List<String> items = const [],
    @JsonKey(name: 'done_km', fromJson: _anyToInt) this.doneKm = 0,
    @JsonKey(name: 'next_km', fromJson: _anyToInt) this.nextKm = 0,
  }) : _items = items,
       super._();

  factory _$KilometerLogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KilometerLogModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _anyToString)
  final String date;
  final List<String> _items;
  @override
  @JsonKey()
  List<String> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'done_km', fromJson: _anyToInt)
  final int doneKm;
  @override
  @JsonKey(name: 'next_km', fromJson: _anyToInt)
  final int nextKm;

  @override
  String toString() {
    return 'KilometerLogModel(date: $date, items: $items, doneKm: $doneKm, nextKm: $nextKm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KilometerLogModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.doneKm, doneKm) || other.doneKm == doneKm) &&
            (identical(other.nextKm, nextKm) || other.nextKm == nextKm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    const DeepCollectionEquality().hash(_items),
    doneKm,
    nextKm,
  );

  /// Create a copy of KilometerLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KilometerLogModelImplCopyWith<_$KilometerLogModelImpl> get copyWith =>
      __$$KilometerLogModelImplCopyWithImpl<_$KilometerLogModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$KilometerLogModelImplToJson(this);
  }
}

abstract class _KilometerLogModel extends KilometerLogModel {
  const factory _KilometerLogModel({
    @JsonKey(fromJson: _anyToString) final String date,
    final List<String> items,
    @JsonKey(name: 'done_km', fromJson: _anyToInt) final int doneKm,
    @JsonKey(name: 'next_km', fromJson: _anyToInt) final int nextKm,
  }) = _$KilometerLogModelImpl;
  const _KilometerLogModel._() : super._();

  factory _KilometerLogModel.fromJson(Map<String, dynamic> json) =
      _$KilometerLogModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _anyToString)
  String get date;
  @override
  List<String> get items;
  @override
  @JsonKey(name: 'done_km', fromJson: _anyToInt)
  int get doneKm;
  @override
  @JsonKey(name: 'next_km', fromJson: _anyToInt)
  int get nextKm;

  /// Create a copy of KilometerLogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KilometerLogModelImplCopyWith<_$KilometerLogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeLogModel _$TimeLogModelFromJson(Map<String, dynamic> json) {
  return _TimeLogModel.fromJson(json);
}

/// @nodoc
mixin _$TimeLogModel {
  List<String> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'done_date', fromJson: _anyToString)
  String get doneDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_date', fromJson: _anyToString)
  String get nextDate => throw _privateConstructorUsedError;

  /// Serializes this TimeLogModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeLogModelCopyWith<TimeLogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeLogModelCopyWith<$Res> {
  factory $TimeLogModelCopyWith(
    TimeLogModel value,
    $Res Function(TimeLogModel) then,
  ) = _$TimeLogModelCopyWithImpl<$Res, TimeLogModel>;
  @useResult
  $Res call({
    List<String> items,
    @JsonKey(name: 'done_date', fromJson: _anyToString) String doneDate,
    @JsonKey(name: 'next_date', fromJson: _anyToString) String nextDate,
  });
}

/// @nodoc
class _$TimeLogModelCopyWithImpl<$Res, $Val extends TimeLogModel>
    implements $TimeLogModelCopyWith<$Res> {
  _$TimeLogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? doneDate = null,
    Object? nextDate = null,
  }) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            doneDate: null == doneDate
                ? _value.doneDate
                : doneDate // ignore: cast_nullable_to_non_nullable
                      as String,
            nextDate: null == nextDate
                ? _value.nextDate
                : nextDate // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TimeLogModelImplCopyWith<$Res>
    implements $TimeLogModelCopyWith<$Res> {
  factory _$$TimeLogModelImplCopyWith(
    _$TimeLogModelImpl value,
    $Res Function(_$TimeLogModelImpl) then,
  ) = __$$TimeLogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> items,
    @JsonKey(name: 'done_date', fromJson: _anyToString) String doneDate,
    @JsonKey(name: 'next_date', fromJson: _anyToString) String nextDate,
  });
}

/// @nodoc
class __$$TimeLogModelImplCopyWithImpl<$Res>
    extends _$TimeLogModelCopyWithImpl<$Res, _$TimeLogModelImpl>
    implements _$$TimeLogModelImplCopyWith<$Res> {
  __$$TimeLogModelImplCopyWithImpl(
    _$TimeLogModelImpl _value,
    $Res Function(_$TimeLogModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TimeLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? doneDate = null,
    Object? nextDate = null,
  }) {
    return _then(
      _$TimeLogModelImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        doneDate: null == doneDate
            ? _value.doneDate
            : doneDate // ignore: cast_nullable_to_non_nullable
                  as String,
        nextDate: null == nextDate
            ? _value.nextDate
            : nextDate // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeLogModelImpl extends _TimeLogModel {
  const _$TimeLogModelImpl({
    final List<String> items = const [],
    @JsonKey(name: 'done_date', fromJson: _anyToString) this.doneDate = '',
    @JsonKey(name: 'next_date', fromJson: _anyToString) this.nextDate = '',
  }) : _items = items,
       super._();

  factory _$TimeLogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeLogModelImplFromJson(json);

  final List<String> _items;
  @override
  @JsonKey()
  List<String> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'done_date', fromJson: _anyToString)
  final String doneDate;
  @override
  @JsonKey(name: 'next_date', fromJson: _anyToString)
  final String nextDate;

  @override
  String toString() {
    return 'TimeLogModel(items: $items, doneDate: $doneDate, nextDate: $nextDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeLogModelImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.doneDate, doneDate) ||
                other.doneDate == doneDate) &&
            (identical(other.nextDate, nextDate) ||
                other.nextDate == nextDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    doneDate,
    nextDate,
  );

  /// Create a copy of TimeLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeLogModelImplCopyWith<_$TimeLogModelImpl> get copyWith =>
      __$$TimeLogModelImplCopyWithImpl<_$TimeLogModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeLogModelImplToJson(this);
  }
}

abstract class _TimeLogModel extends TimeLogModel {
  const factory _TimeLogModel({
    final List<String> items,
    @JsonKey(name: 'done_date', fromJson: _anyToString) final String doneDate,
    @JsonKey(name: 'next_date', fromJson: _anyToString) final String nextDate,
  }) = _$TimeLogModelImpl;
  const _TimeLogModel._() : super._();

  factory _TimeLogModel.fromJson(Map<String, dynamic> json) =
      _$TimeLogModelImpl.fromJson;

  @override
  List<String> get items;
  @override
  @JsonKey(name: 'done_date', fromJson: _anyToString)
  String get doneDate;
  @override
  @JsonKey(name: 'next_date', fromJson: _anyToString)
  String get nextDate;

  /// Create a copy of TimeLogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeLogModelImplCopyWith<_$TimeLogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReminderListModel _$ReminderListModelFromJson(Map<String, dynamic> json) {
  return _ReminderListModel.fromJson(json);
}

/// @nodoc
mixin _$ReminderListModel {
  List<ReminderModel> get items => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToInt)
  int? get total => throw _privateConstructorUsedError;

  /// Serializes this ReminderListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReminderListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderListModelCopyWith<ReminderListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderListModelCopyWith<$Res> {
  factory $ReminderListModelCopyWith(
    ReminderListModel value,
    $Res Function(ReminderListModel) then,
  ) = _$ReminderListModelCopyWithImpl<$Res, ReminderListModel>;
  @useResult
  $Res call({
    List<ReminderModel> items,
    @JsonKey(fromJson: _anyToInt) int? total,
  });
}

/// @nodoc
class _$ReminderListModelCopyWithImpl<$Res, $Val extends ReminderListModel>
    implements $ReminderListModelCopyWith<$Res> {
  _$ReminderListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReminderListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null, Object? total = freezed}) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<ReminderModel>,
            total: freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReminderListModelImplCopyWith<$Res>
    implements $ReminderListModelCopyWith<$Res> {
  factory _$$ReminderListModelImplCopyWith(
    _$ReminderListModelImpl value,
    $Res Function(_$ReminderListModelImpl) then,
  ) = __$$ReminderListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<ReminderModel> items,
    @JsonKey(fromJson: _anyToInt) int? total,
  });
}

/// @nodoc
class __$$ReminderListModelImplCopyWithImpl<$Res>
    extends _$ReminderListModelCopyWithImpl<$Res, _$ReminderListModelImpl>
    implements _$$ReminderListModelImplCopyWith<$Res> {
  __$$ReminderListModelImplCopyWithImpl(
    _$ReminderListModelImpl _value,
    $Res Function(_$ReminderListModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReminderListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null, Object? total = freezed}) {
    return _then(
      _$ReminderListModelImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<ReminderModel>,
        total: freezed == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReminderListModelImpl extends _ReminderListModel {
  const _$ReminderListModelImpl({
    final List<ReminderModel> items = const [],
    @JsonKey(fromJson: _anyToInt) this.total,
  }) : _items = items,
       super._();

  factory _$ReminderListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderListModelImplFromJson(json);

  final List<ReminderModel> _items;
  @override
  @JsonKey()
  List<ReminderModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(fromJson: _anyToInt)
  final int? total;

  @override
  String toString() {
    return 'ReminderListModel(items: $items, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderListModelImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    total,
  );

  /// Create a copy of ReminderListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderListModelImplCopyWith<_$ReminderListModelImpl> get copyWith =>
      __$$ReminderListModelImplCopyWithImpl<_$ReminderListModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderListModelImplToJson(this);
  }
}

abstract class _ReminderListModel extends ReminderListModel {
  const factory _ReminderListModel({
    final List<ReminderModel> items,
    @JsonKey(fromJson: _anyToInt) final int? total,
  }) = _$ReminderListModelImpl;
  const _ReminderListModel._() : super._();

  factory _ReminderListModel.fromJson(Map<String, dynamic> json) =
      _$ReminderListModelImpl.fromJson;

  @override
  List<ReminderModel> get items;
  @override
  @JsonKey(fromJson: _anyToInt)
  int? get total;

  /// Create a copy of ReminderListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderListModelImplCopyWith<_$ReminderListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
