// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_services_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ManageServicesModel _$ManageServicesModelFromJson(Map<String, dynamic> json) {
  return _ManageServicesModel.fromJson(json);
}

/// @nodoc
mixin _$ManageServicesModel {
  @JsonKey(fromJson: _anyToString)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'repairman_id', fromJson: _anyToString)
  String? get repairmanId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String get title => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String get description => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _imagesFromJson)
  List<String> get images => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _keywordsFromJson)
  List<String> get keywords => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_min', fromJson: _anyToDouble)
  double get priceMin => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_max', fromJson: _anyToDouble)
  double get priceMax => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String get status => throw _privateConstructorUsedError;
  RepairmanModel? get repairman => throw _privateConstructorUsedError;

  /// Serializes this ManageServicesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ManageServicesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManageServicesModelCopyWith<ManageServicesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageServicesModelCopyWith<$Res> {
  factory $ManageServicesModelCopyWith(
    ManageServicesModel value,
    $Res Function(ManageServicesModel) then,
  ) = _$ManageServicesModelCopyWithImpl<$Res, ManageServicesModel>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String id,
    @JsonKey(name: 'repairman_id', fromJson: _anyToString) String? repairmanId,
    @JsonKey(fromJson: _anyToString) String title,
    @JsonKey(fromJson: _anyToString) String description,
    @JsonKey(fromJson: _imagesFromJson) List<String> images,
    @JsonKey(fromJson: _keywordsFromJson) List<String> keywords,
    @JsonKey(name: 'price_min', fromJson: _anyToDouble) double priceMin,
    @JsonKey(name: 'price_max', fromJson: _anyToDouble) double priceMax,
    @JsonKey(fromJson: _anyToString) String status,
    RepairmanModel? repairman,
  });

  $RepairmanModelCopyWith<$Res>? get repairman;
}

/// @nodoc
class _$ManageServicesModelCopyWithImpl<$Res, $Val extends ManageServicesModel>
    implements $ManageServicesModelCopyWith<$Res> {
  _$ManageServicesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManageServicesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repairmanId = freezed,
    Object? title = null,
    Object? description = null,
    Object? images = null,
    Object? keywords = null,
    Object? priceMin = null,
    Object? priceMax = null,
    Object? status = null,
    Object? repairman = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            repairmanId: freezed == repairmanId
                ? _value.repairmanId
                : repairmanId // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            images: null == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            keywords: null == keywords
                ? _value.keywords
                : keywords // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            priceMin: null == priceMin
                ? _value.priceMin
                : priceMin // ignore: cast_nullable_to_non_nullable
                      as double,
            priceMax: null == priceMax
                ? _value.priceMax
                : priceMax // ignore: cast_nullable_to_non_nullable
                      as double,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            repairman: freezed == repairman
                ? _value.repairman
                : repairman // ignore: cast_nullable_to_non_nullable
                      as RepairmanModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of ManageServicesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepairmanModelCopyWith<$Res>? get repairman {
    if (_value.repairman == null) {
      return null;
    }

    return $RepairmanModelCopyWith<$Res>(_value.repairman!, (value) {
      return _then(_value.copyWith(repairman: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ManageServicesModelImplCopyWith<$Res>
    implements $ManageServicesModelCopyWith<$Res> {
  factory _$$ManageServicesModelImplCopyWith(
    _$ManageServicesModelImpl value,
    $Res Function(_$ManageServicesModelImpl) then,
  ) = __$$ManageServicesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String id,
    @JsonKey(name: 'repairman_id', fromJson: _anyToString) String? repairmanId,
    @JsonKey(fromJson: _anyToString) String title,
    @JsonKey(fromJson: _anyToString) String description,
    @JsonKey(fromJson: _imagesFromJson) List<String> images,
    @JsonKey(fromJson: _keywordsFromJson) List<String> keywords,
    @JsonKey(name: 'price_min', fromJson: _anyToDouble) double priceMin,
    @JsonKey(name: 'price_max', fromJson: _anyToDouble) double priceMax,
    @JsonKey(fromJson: _anyToString) String status,
    RepairmanModel? repairman,
  });

  @override
  $RepairmanModelCopyWith<$Res>? get repairman;
}

/// @nodoc
class __$$ManageServicesModelImplCopyWithImpl<$Res>
    extends _$ManageServicesModelCopyWithImpl<$Res, _$ManageServicesModelImpl>
    implements _$$ManageServicesModelImplCopyWith<$Res> {
  __$$ManageServicesModelImplCopyWithImpl(
    _$ManageServicesModelImpl _value,
    $Res Function(_$ManageServicesModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ManageServicesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repairmanId = freezed,
    Object? title = null,
    Object? description = null,
    Object? images = null,
    Object? keywords = null,
    Object? priceMin = null,
    Object? priceMax = null,
    Object? status = null,
    Object? repairman = freezed,
  }) {
    return _then(
      _$ManageServicesModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        repairmanId: freezed == repairmanId
            ? _value.repairmanId
            : repairmanId // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        images: null == images
            ? _value._images
            : images // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        keywords: null == keywords
            ? _value._keywords
            : keywords // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        priceMin: null == priceMin
            ? _value.priceMin
            : priceMin // ignore: cast_nullable_to_non_nullable
                  as double,
        priceMax: null == priceMax
            ? _value.priceMax
            : priceMax // ignore: cast_nullable_to_non_nullable
                  as double,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        repairman: freezed == repairman
            ? _value.repairman
            : repairman // ignore: cast_nullable_to_non_nullable
                  as RepairmanModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ManageServicesModelImpl extends _ManageServicesModel {
  const _$ManageServicesModelImpl({
    @JsonKey(fromJson: _anyToString) this.id = '',
    @JsonKey(name: 'repairman_id', fromJson: _anyToString) this.repairmanId,
    @JsonKey(fromJson: _anyToString) this.title = '',
    @JsonKey(fromJson: _anyToString) this.description = '',
    @JsonKey(fromJson: _imagesFromJson) final List<String> images = const [],
    @JsonKey(fromJson: _keywordsFromJson)
    final List<String> keywords = const [],
    @JsonKey(name: 'price_min', fromJson: _anyToDouble) this.priceMin = 0.0,
    @JsonKey(name: 'price_max', fromJson: _anyToDouble) this.priceMax = 0.0,
    @JsonKey(fromJson: _anyToString) this.status = '',
    this.repairman,
  }) : _images = images,
       _keywords = keywords,
       super._();

  factory _$ManageServicesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManageServicesModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _anyToString)
  final String id;
  @override
  @JsonKey(name: 'repairman_id', fromJson: _anyToString)
  final String? repairmanId;
  @override
  @JsonKey(fromJson: _anyToString)
  final String title;
  @override
  @JsonKey(fromJson: _anyToString)
  final String description;
  final List<String> _images;
  @override
  @JsonKey(fromJson: _imagesFromJson)
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<String> _keywords;
  @override
  @JsonKey(fromJson: _keywordsFromJson)
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  @override
  @JsonKey(name: 'price_min', fromJson: _anyToDouble)
  final double priceMin;
  @override
  @JsonKey(name: 'price_max', fromJson: _anyToDouble)
  final double priceMax;
  @override
  @JsonKey(fromJson: _anyToString)
  final String status;
  @override
  final RepairmanModel? repairman;

  @override
  String toString() {
    return 'ManageServicesModel(id: $id, repairmanId: $repairmanId, title: $title, description: $description, images: $images, keywords: $keywords, priceMin: $priceMin, priceMax: $priceMax, status: $status, repairman: $repairman)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManageServicesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repairmanId, repairmanId) ||
                other.repairmanId == repairmanId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords) &&
            (identical(other.priceMin, priceMin) ||
                other.priceMin == priceMin) &&
            (identical(other.priceMax, priceMax) ||
                other.priceMax == priceMax) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.repairman, repairman) ||
                other.repairman == repairman));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    repairmanId,
    title,
    description,
    const DeepCollectionEquality().hash(_images),
    const DeepCollectionEquality().hash(_keywords),
    priceMin,
    priceMax,
    status,
    repairman,
  );

  /// Create a copy of ManageServicesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManageServicesModelImplCopyWith<_$ManageServicesModelImpl> get copyWith =>
      __$$ManageServicesModelImplCopyWithImpl<_$ManageServicesModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ManageServicesModelImplToJson(this);
  }
}

abstract class _ManageServicesModel extends ManageServicesModel {
  const factory _ManageServicesModel({
    @JsonKey(fromJson: _anyToString) final String id,
    @JsonKey(name: 'repairman_id', fromJson: _anyToString)
    final String? repairmanId,
    @JsonKey(fromJson: _anyToString) final String title,
    @JsonKey(fromJson: _anyToString) final String description,
    @JsonKey(fromJson: _imagesFromJson) final List<String> images,
    @JsonKey(fromJson: _keywordsFromJson) final List<String> keywords,
    @JsonKey(name: 'price_min', fromJson: _anyToDouble) final double priceMin,
    @JsonKey(name: 'price_max', fromJson: _anyToDouble) final double priceMax,
    @JsonKey(fromJson: _anyToString) final String status,
    final RepairmanModel? repairman,
  }) = _$ManageServicesModelImpl;
  const _ManageServicesModel._() : super._();

  factory _ManageServicesModel.fromJson(Map<String, dynamic> json) =
      _$ManageServicesModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _anyToString)
  String get id;
  @override
  @JsonKey(name: 'repairman_id', fromJson: _anyToString)
  String? get repairmanId;
  @override
  @JsonKey(fromJson: _anyToString)
  String get title;
  @override
  @JsonKey(fromJson: _anyToString)
  String get description;
  @override
  @JsonKey(fromJson: _imagesFromJson)
  List<String> get images;
  @override
  @JsonKey(fromJson: _keywordsFromJson)
  List<String> get keywords;
  @override
  @JsonKey(name: 'price_min', fromJson: _anyToDouble)
  double get priceMin;
  @override
  @JsonKey(name: 'price_max', fromJson: _anyToDouble)
  double get priceMax;
  @override
  @JsonKey(fromJson: _anyToString)
  String get status;
  @override
  RepairmanModel? get repairman;

  /// Create a copy of ManageServicesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManageServicesModelImplCopyWith<_$ManageServicesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
