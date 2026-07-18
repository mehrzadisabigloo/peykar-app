// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_products_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ManageProductsModel _$ManageProductsModelFromJson(Map<String, dynamic> json) {
  return _ManageProductsModel.fromJson(json);
}

/// @nodoc
mixin _$ManageProductsModel {
  @JsonKey(fromJson: _anyToString)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'repairman_id', fromJson: _anyToString)
  String get repairmanId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String get title => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String get description => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _imagesFromJson)
  List<String> get images => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _keywordsFromJson)
  List<String> get keywords => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToDouble)
  double get price => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToInt)
  int get stock => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt)
  int get maxPurchaseQuantity => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _anyToString)
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'final_price', fromJson: _anyToDouble)
  double get finalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_discount', fromJson: _anyToBool)
  bool get hasDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_amount', fromJson: _anyToDouble)
  double get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)
  int get discountPercentage => throw _privateConstructorUsedError;
  RepairmanModel? get repairman => throw _privateConstructorUsedError;

  /// Serializes this ManageProductsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ManageProductsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ManageProductsModelCopyWith<ManageProductsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageProductsModelCopyWith<$Res> {
  factory $ManageProductsModelCopyWith(
    ManageProductsModel value,
    $Res Function(ManageProductsModel) then,
  ) = _$ManageProductsModelCopyWithImpl<$Res, ManageProductsModel>;
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String id,
    @JsonKey(name: 'repairman_id', fromJson: _anyToString) String repairmanId,
    @JsonKey(fromJson: _anyToString) String title,
    @JsonKey(fromJson: _anyToString) String description,
    @JsonKey(fromJson: _imagesFromJson) List<String> images,
    @JsonKey(fromJson: _keywordsFromJson) List<String> keywords,
    @JsonKey(fromJson: _anyToDouble) double price,
    @JsonKey(fromJson: _anyToInt) int stock,
    @JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt)
    int maxPurchaseQuantity,
    @JsonKey(fromJson: _anyToString) String status,
    @JsonKey(name: 'final_price', fromJson: _anyToDouble) double finalPrice,
    @JsonKey(name: 'has_discount', fromJson: _anyToBool) bool hasDiscount,
    @JsonKey(name: 'discount_amount', fromJson: _anyToDouble)
    double discountAmount,
    @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)
    int discountPercentage,
    RepairmanModel? repairman,
  });

  $RepairmanModelCopyWith<$Res>? get repairman;
}

/// @nodoc
class _$ManageProductsModelCopyWithImpl<$Res, $Val extends ManageProductsModel>
    implements $ManageProductsModelCopyWith<$Res> {
  _$ManageProductsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ManageProductsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repairmanId = null,
    Object? title = null,
    Object? description = null,
    Object? images = null,
    Object? keywords = null,
    Object? price = null,
    Object? stock = null,
    Object? maxPurchaseQuantity = null,
    Object? status = null,
    Object? finalPrice = null,
    Object? hasDiscount = null,
    Object? discountAmount = null,
    Object? discountPercentage = null,
    Object? repairman = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            repairmanId: null == repairmanId
                ? _value.repairmanId
                : repairmanId // ignore: cast_nullable_to_non_nullable
                      as String,
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
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            stock: null == stock
                ? _value.stock
                : stock // ignore: cast_nullable_to_non_nullable
                      as int,
            maxPurchaseQuantity: null == maxPurchaseQuantity
                ? _value.maxPurchaseQuantity
                : maxPurchaseQuantity // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            finalPrice: null == finalPrice
                ? _value.finalPrice
                : finalPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            hasDiscount: null == hasDiscount
                ? _value.hasDiscount
                : hasDiscount // ignore: cast_nullable_to_non_nullable
                      as bool,
            discountAmount: null == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            discountPercentage: null == discountPercentage
                ? _value.discountPercentage
                : discountPercentage // ignore: cast_nullable_to_non_nullable
                      as int,
            repairman: freezed == repairman
                ? _value.repairman
                : repairman // ignore: cast_nullable_to_non_nullable
                      as RepairmanModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of ManageProductsModel
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
abstract class _$$ManageProductsModelImplCopyWith<$Res>
    implements $ManageProductsModelCopyWith<$Res> {
  factory _$$ManageProductsModelImplCopyWith(
    _$ManageProductsModelImpl value,
    $Res Function(_$ManageProductsModelImpl) then,
  ) = __$$ManageProductsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(fromJson: _anyToString) String id,
    @JsonKey(name: 'repairman_id', fromJson: _anyToString) String repairmanId,
    @JsonKey(fromJson: _anyToString) String title,
    @JsonKey(fromJson: _anyToString) String description,
    @JsonKey(fromJson: _imagesFromJson) List<String> images,
    @JsonKey(fromJson: _keywordsFromJson) List<String> keywords,
    @JsonKey(fromJson: _anyToDouble) double price,
    @JsonKey(fromJson: _anyToInt) int stock,
    @JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt)
    int maxPurchaseQuantity,
    @JsonKey(fromJson: _anyToString) String status,
    @JsonKey(name: 'final_price', fromJson: _anyToDouble) double finalPrice,
    @JsonKey(name: 'has_discount', fromJson: _anyToBool) bool hasDiscount,
    @JsonKey(name: 'discount_amount', fromJson: _anyToDouble)
    double discountAmount,
    @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)
    int discountPercentage,
    RepairmanModel? repairman,
  });

  @override
  $RepairmanModelCopyWith<$Res>? get repairman;
}

/// @nodoc
class __$$ManageProductsModelImplCopyWithImpl<$Res>
    extends _$ManageProductsModelCopyWithImpl<$Res, _$ManageProductsModelImpl>
    implements _$$ManageProductsModelImplCopyWith<$Res> {
  __$$ManageProductsModelImplCopyWithImpl(
    _$ManageProductsModelImpl _value,
    $Res Function(_$ManageProductsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ManageProductsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repairmanId = null,
    Object? title = null,
    Object? description = null,
    Object? images = null,
    Object? keywords = null,
    Object? price = null,
    Object? stock = null,
    Object? maxPurchaseQuantity = null,
    Object? status = null,
    Object? finalPrice = null,
    Object? hasDiscount = null,
    Object? discountAmount = null,
    Object? discountPercentage = null,
    Object? repairman = freezed,
  }) {
    return _then(
      _$ManageProductsModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        repairmanId: null == repairmanId
            ? _value.repairmanId
            : repairmanId // ignore: cast_nullable_to_non_nullable
                  as String,
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
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        stock: null == stock
            ? _value.stock
            : stock // ignore: cast_nullable_to_non_nullable
                  as int,
        maxPurchaseQuantity: null == maxPurchaseQuantity
            ? _value.maxPurchaseQuantity
            : maxPurchaseQuantity // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        finalPrice: null == finalPrice
            ? _value.finalPrice
            : finalPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        hasDiscount: null == hasDiscount
            ? _value.hasDiscount
            : hasDiscount // ignore: cast_nullable_to_non_nullable
                  as bool,
        discountAmount: null == discountAmount
            ? _value.discountAmount
            : discountAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        discountPercentage: null == discountPercentage
            ? _value.discountPercentage
            : discountPercentage // ignore: cast_nullable_to_non_nullable
                  as int,
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
class _$ManageProductsModelImpl extends _ManageProductsModel {
  const _$ManageProductsModelImpl({
    @JsonKey(fromJson: _anyToString) this.id = '',
    @JsonKey(name: 'repairman_id', fromJson: _anyToString)
    this.repairmanId = '',
    @JsonKey(fromJson: _anyToString) this.title = '',
    @JsonKey(fromJson: _anyToString) this.description = '',
    @JsonKey(fromJson: _imagesFromJson) final List<String> images = const [],
    @JsonKey(fromJson: _keywordsFromJson)
    final List<String> keywords = const [],
    @JsonKey(fromJson: _anyToDouble) this.price = 0.0,
    @JsonKey(fromJson: _anyToInt) this.stock = 0,
    @JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt)
    this.maxPurchaseQuantity = 0,
    @JsonKey(fromJson: _anyToString) this.status = '',
    @JsonKey(name: 'final_price', fromJson: _anyToDouble) this.finalPrice = 0.0,
    @JsonKey(name: 'has_discount', fromJson: _anyToBool)
    this.hasDiscount = false,
    @JsonKey(name: 'discount_amount', fromJson: _anyToDouble)
    this.discountAmount = 0.0,
    @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)
    this.discountPercentage = 0,
    this.repairman,
  }) : _images = images,
       _keywords = keywords,
       super._();

  factory _$ManageProductsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ManageProductsModelImplFromJson(json);

  @override
  @JsonKey(fromJson: _anyToString)
  final String id;
  @override
  @JsonKey(name: 'repairman_id', fromJson: _anyToString)
  final String repairmanId;
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
  @JsonKey(fromJson: _anyToDouble)
  final double price;
  @override
  @JsonKey(fromJson: _anyToInt)
  final int stock;
  @override
  @JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt)
  final int maxPurchaseQuantity;
  @override
  @JsonKey(fromJson: _anyToString)
  final String status;
  @override
  @JsonKey(name: 'final_price', fromJson: _anyToDouble)
  final double finalPrice;
  @override
  @JsonKey(name: 'has_discount', fromJson: _anyToBool)
  final bool hasDiscount;
  @override
  @JsonKey(name: 'discount_amount', fromJson: _anyToDouble)
  final double discountAmount;
  @override
  @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)
  final int discountPercentage;
  @override
  final RepairmanModel? repairman;

  @override
  String toString() {
    return 'ManageProductsModel(id: $id, repairmanId: $repairmanId, title: $title, description: $description, images: $images, keywords: $keywords, price: $price, stock: $stock, maxPurchaseQuantity: $maxPurchaseQuantity, status: $status, finalPrice: $finalPrice, hasDiscount: $hasDiscount, discountAmount: $discountAmount, discountPercentage: $discountPercentage, repairman: $repairman)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManageProductsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repairmanId, repairmanId) ||
                other.repairmanId == repairmanId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.maxPurchaseQuantity, maxPurchaseQuantity) ||
                other.maxPurchaseQuantity == maxPurchaseQuantity) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.hasDiscount, hasDiscount) ||
                other.hasDiscount == hasDiscount) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.discountPercentage, discountPercentage) ||
                other.discountPercentage == discountPercentage) &&
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
    price,
    stock,
    maxPurchaseQuantity,
    status,
    finalPrice,
    hasDiscount,
    discountAmount,
    discountPercentage,
    repairman,
  );

  /// Create a copy of ManageProductsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManageProductsModelImplCopyWith<_$ManageProductsModelImpl> get copyWith =>
      __$$ManageProductsModelImplCopyWithImpl<_$ManageProductsModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ManageProductsModelImplToJson(this);
  }
}

abstract class _ManageProductsModel extends ManageProductsModel {
  const factory _ManageProductsModel({
    @JsonKey(fromJson: _anyToString) final String id,
    @JsonKey(name: 'repairman_id', fromJson: _anyToString)
    final String repairmanId,
    @JsonKey(fromJson: _anyToString) final String title,
    @JsonKey(fromJson: _anyToString) final String description,
    @JsonKey(fromJson: _imagesFromJson) final List<String> images,
    @JsonKey(fromJson: _keywordsFromJson) final List<String> keywords,
    @JsonKey(fromJson: _anyToDouble) final double price,
    @JsonKey(fromJson: _anyToInt) final int stock,
    @JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt)
    final int maxPurchaseQuantity,
    @JsonKey(fromJson: _anyToString) final String status,
    @JsonKey(name: 'final_price', fromJson: _anyToDouble)
    final double finalPrice,
    @JsonKey(name: 'has_discount', fromJson: _anyToBool) final bool hasDiscount,
    @JsonKey(name: 'discount_amount', fromJson: _anyToDouble)
    final double discountAmount,
    @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)
    final int discountPercentage,
    final RepairmanModel? repairman,
  }) = _$ManageProductsModelImpl;
  const _ManageProductsModel._() : super._();

  factory _ManageProductsModel.fromJson(Map<String, dynamic> json) =
      _$ManageProductsModelImpl.fromJson;

  @override
  @JsonKey(fromJson: _anyToString)
  String get id;
  @override
  @JsonKey(name: 'repairman_id', fromJson: _anyToString)
  String get repairmanId;
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
  @JsonKey(fromJson: _anyToDouble)
  double get price;
  @override
  @JsonKey(fromJson: _anyToInt)
  int get stock;
  @override
  @JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt)
  int get maxPurchaseQuantity;
  @override
  @JsonKey(fromJson: _anyToString)
  String get status;
  @override
  @JsonKey(name: 'final_price', fromJson: _anyToDouble)
  double get finalPrice;
  @override
  @JsonKey(name: 'has_discount', fromJson: _anyToBool)
  bool get hasDiscount;
  @override
  @JsonKey(name: 'discount_amount', fromJson: _anyToDouble)
  double get discountAmount;
  @override
  @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)
  int get discountPercentage;
  @override
  RepairmanModel? get repairman;

  /// Create a copy of ManageProductsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManageProductsModelImplCopyWith<_$ManageProductsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
