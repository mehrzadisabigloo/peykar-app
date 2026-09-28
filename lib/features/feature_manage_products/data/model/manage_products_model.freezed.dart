// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_products_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryModel {

@JsonKey(name: 'id', fromJson: _anyToString) String get id;@JsonKey(name: 'title', fromJson: _anyToString) String get title;@JsonKey(name: 'slug', fromJson: _anyToString) String? get slug;@JsonKey(name: 'description', fromJson: _anyToString) String? get description;@JsonKey(name: 'cover', fromJson: _anyToString) String? get cover;@JsonKey(name: 'parent_id', fromJson: _anyToString) String? get parentId;@JsonKey(name: 'is_leaf', fromJson: _anyToBool) bool get isLeaf;@JsonKey(name: 'is_featured', fromJson: _anyToBool) bool get isFeatured;@JsonKey(name: 'sort_order', fromJson: _anyToInt) int get sortOrder; List<CategoryModel> get parents; List<CategoryModel> get children;
/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<CategoryModel> get copyWith => _$CategoryModelCopyWithImpl<CategoryModel>(this as CategoryModel, _$identity);

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CategoryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.cover, _this.cover) || other.cover == _this.cover)&&(identical(other.parentId, _this.parentId) || other.parentId == _this.parentId)&&(identical(other.isLeaf, _this.isLeaf) || other.isLeaf == _this.isLeaf)&&(identical(other.isFeatured, _this.isFeatured) || other.isFeatured == _this.isFeatured)&&(identical(other.sortOrder, _this.sortOrder) || other.sortOrder == _this.sortOrder)&&const DeepCollectionEquality().equals(other.parents, _this.parents)&&const DeepCollectionEquality().equals(other.children, _this.children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CategoryModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.slug,_this.description,_this.cover,_this.parentId,_this.isLeaf,_this.isFeatured,_this.sortOrder,const DeepCollectionEquality().hash(_this.parents),const DeepCollectionEquality().hash(_this.children));
}

@override
String toString() {
  final _this = this as CategoryModel;
  return 'CategoryModel(id: ${_this.id}, title: ${_this.title}, slug: ${_this.slug}, description: ${_this.description}, cover: ${_this.cover}, parentId: ${_this.parentId}, isLeaf: ${_this.isLeaf}, isFeatured: ${_this.isFeatured}, sortOrder: ${_this.sortOrder}, parents: ${_this.parents}, children: ${_this.children})';
}


}

/// @nodoc
abstract mixin class $CategoryModelCopyWith<$Res>  {
  factory $CategoryModelCopyWith(CategoryModel value, $Res Function(CategoryModel) _then) = _$CategoryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', fromJson: _anyToString) String id,@JsonKey(name: 'title', fromJson: _anyToString) String title,@JsonKey(name: 'slug', fromJson: _anyToString) String? slug,@JsonKey(name: 'description', fromJson: _anyToString) String? description,@JsonKey(name: 'cover', fromJson: _anyToString) String? cover,@JsonKey(name: 'parent_id', fromJson: _anyToString) String? parentId,@JsonKey(name: 'is_leaf', fromJson: _anyToBool) bool isLeaf,@JsonKey(name: 'is_featured', fromJson: _anyToBool) bool isFeatured,@JsonKey(name: 'sort_order', fromJson: _anyToInt) int sortOrder, List<CategoryModel> parents, List<CategoryModel> children
});




}
/// @nodoc
class _$CategoryModelCopyWithImpl<$Res>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._self, this._then);

  final CategoryModel _self;
  final $Res Function(CategoryModel) _then;

/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? slug = freezed,Object? description = freezed,Object? cover = freezed,Object? parentId = freezed,Object? isLeaf = null,Object? isFeatured = null,Object? sortOrder = null,Object? parents = null,Object? children = null,}) {
  return _then(CategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,isLeaf: null == isLeaf ? _self.isLeaf : isLeaf // ignore: cast_nullable_to_non_nullable
as bool,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,parents: null == parents ? _self.parents : parents // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryModel].
extension CategoryModelPatterns on CategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _CategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: _anyToString)  String id, @JsonKey(name: 'title', fromJson: _anyToString)  String title, @JsonKey(name: 'slug', fromJson: _anyToString)  String? slug, @JsonKey(name: 'description', fromJson: _anyToString)  String? description, @JsonKey(name: 'cover', fromJson: _anyToString)  String? cover, @JsonKey(name: 'parent_id', fromJson: _anyToString)  String? parentId, @JsonKey(name: 'is_leaf', fromJson: _anyToBool)  bool isLeaf, @JsonKey(name: 'is_featured', fromJson: _anyToBool)  bool isFeatured, @JsonKey(name: 'sort_order', fromJson: _anyToInt)  int sortOrder,  List<CategoryModel> parents,  List<CategoryModel> children)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
return $default(_that.id,_that.title,_that.slug,_that.description,_that.cover,_that.parentId,_that.isLeaf,_that.isFeatured,_that.sortOrder,_that.parents,_that.children);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', fromJson: _anyToString)  String id, @JsonKey(name: 'title', fromJson: _anyToString)  String title, @JsonKey(name: 'slug', fromJson: _anyToString)  String? slug, @JsonKey(name: 'description', fromJson: _anyToString)  String? description, @JsonKey(name: 'cover', fromJson: _anyToString)  String? cover, @JsonKey(name: 'parent_id', fromJson: _anyToString)  String? parentId, @JsonKey(name: 'is_leaf', fromJson: _anyToBool)  bool isLeaf, @JsonKey(name: 'is_featured', fromJson: _anyToBool)  bool isFeatured, @JsonKey(name: 'sort_order', fromJson: _anyToInt)  int sortOrder,  List<CategoryModel> parents,  List<CategoryModel> children)  $default,) {final _that = this;
switch (_that) {
case _CategoryModel():
return $default(_that.id,_that.title,_that.slug,_that.description,_that.cover,_that.parentId,_that.isLeaf,_that.isFeatured,_that.sortOrder,_that.parents,_that.children);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', fromJson: _anyToString)  String id, @JsonKey(name: 'title', fromJson: _anyToString)  String title, @JsonKey(name: 'slug', fromJson: _anyToString)  String? slug, @JsonKey(name: 'description', fromJson: _anyToString)  String? description, @JsonKey(name: 'cover', fromJson: _anyToString)  String? cover, @JsonKey(name: 'parent_id', fromJson: _anyToString)  String? parentId, @JsonKey(name: 'is_leaf', fromJson: _anyToBool)  bool isLeaf, @JsonKey(name: 'is_featured', fromJson: _anyToBool)  bool isFeatured, @JsonKey(name: 'sort_order', fromJson: _anyToInt)  int sortOrder,  List<CategoryModel> parents,  List<CategoryModel> children)?  $default,) {final _that = this;
switch (_that) {
case _CategoryModel() when $default != null:
return $default(_that.id,_that.title,_that.slug,_that.description,_that.cover,_that.parentId,_that.isLeaf,_that.isFeatured,_that.sortOrder,_that.parents,_that.children);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryModel extends CategoryModel {
  const _CategoryModel({@JsonKey(name: 'id', fromJson: _anyToString) required this.id, @JsonKey(name: 'title', fromJson: _anyToString) required this.title, @JsonKey(name: 'slug', fromJson: _anyToString) this.slug, @JsonKey(name: 'description', fromJson: _anyToString) this.description, @JsonKey(name: 'cover', fromJson: _anyToString) this.cover, @JsonKey(name: 'parent_id', fromJson: _anyToString) this.parentId, @JsonKey(name: 'is_leaf', fromJson: _anyToBool) this.isLeaf = false, @JsonKey(name: 'is_featured', fromJson: _anyToBool) this.isFeatured = false, @JsonKey(name: 'sort_order', fromJson: _anyToInt) this.sortOrder = 0,  List<CategoryModel> parents = const [],  List<CategoryModel> children = const []}): _parents = parents,_children = children,super._();
  factory _CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

@override@JsonKey(name: 'id', fromJson: _anyToString) final  String id;
@override@JsonKey(name: 'title', fromJson: _anyToString) final  String title;
@override@JsonKey(name: 'slug', fromJson: _anyToString) final  String? slug;
@override@JsonKey(name: 'description', fromJson: _anyToString) final  String? description;
@override@JsonKey(name: 'cover', fromJson: _anyToString) final  String? cover;
@override@JsonKey(name: 'parent_id', fromJson: _anyToString) final  String? parentId;
@override@JsonKey(name: 'is_leaf', fromJson: _anyToBool) final  bool isLeaf;
@override@JsonKey(name: 'is_featured', fromJson: _anyToBool) final  bool isFeatured;
@override@JsonKey(name: 'sort_order', fromJson: _anyToInt) final  int sortOrder;
 final  List<CategoryModel> _parents;
@override@JsonKey() List<CategoryModel> get parents {
  if (_parents is EqualUnmodifiableListView) return _parents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parents);
}

 final  List<CategoryModel> _children;
@override@JsonKey() List<CategoryModel> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}


/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryModelCopyWith<_CategoryModel> get copyWith => __$CategoryModelCopyWithImpl<_CategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.isLeaf, isLeaf) || other.isLeaf == isLeaf)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other.parents, _parents)&&const DeepCollectionEquality().equals(other.children, _children));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,slug,description,cover,parentId,isLeaf,isFeatured,sortOrder,const DeepCollectionEquality().hash(_parents),const DeepCollectionEquality().hash(_children));
}

@override
String toString() {
    return 'CategoryModel(id: $id, title: $title, slug: $slug, description: $description, cover: $cover, parentId: $parentId, isLeaf: $isLeaf, isFeatured: $isFeatured, sortOrder: $sortOrder, parents: $parents, children: $children)';
}


}

/// @nodoc
abstract mixin class _$CategoryModelCopyWith<$Res> implements $CategoryModelCopyWith<$Res> {
  factory _$CategoryModelCopyWith(_CategoryModel value, $Res Function(_CategoryModel) _then) = __$CategoryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', fromJson: _anyToString) String id,@JsonKey(name: 'title', fromJson: _anyToString) String title,@JsonKey(name: 'slug', fromJson: _anyToString) String? slug,@JsonKey(name: 'description', fromJson: _anyToString) String? description,@JsonKey(name: 'cover', fromJson: _anyToString) String? cover,@JsonKey(name: 'parent_id', fromJson: _anyToString) String? parentId,@JsonKey(name: 'is_leaf', fromJson: _anyToBool) bool isLeaf,@JsonKey(name: 'is_featured', fromJson: _anyToBool) bool isFeatured,@JsonKey(name: 'sort_order', fromJson: _anyToInt) int sortOrder, List<CategoryModel> parents, List<CategoryModel> children
});




}
/// @nodoc
class __$CategoryModelCopyWithImpl<$Res>
    implements _$CategoryModelCopyWith<$Res> {
  __$CategoryModelCopyWithImpl(this._self, this._then);

  final _CategoryModel _self;
  final $Res Function(_CategoryModel) _then;

/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? slug = freezed,Object? description = freezed,Object? cover = freezed,Object? parentId = freezed,Object? isLeaf = null,Object? isFeatured = null,Object? sortOrder = null,Object? parents = null,Object? children = null,}) {
  return _then(_CategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,isLeaf: null == isLeaf ? _self.isLeaf : isLeaf // ignore: cast_nullable_to_non_nullable
as bool,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,parents: null == parents ? _self._parents : parents // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,
  ));
}


}


/// @nodoc
mixin _$ManageProductsModel {

@JsonKey(fromJson: _anyToString) String get id;@JsonKey(name: 'repairman_id', fromJson: _anyToString) String get repairmanId;@JsonKey(fromJson: _anyToString) String get title;@JsonKey(fromJson: _anyToString) String get description;@JsonKey(fromJson: _imagesFromJson) List<String> get images;@JsonKey(fromJson: _keywordsFromJson) List<String> get keywords;@JsonKey(fromJson: _anyToDouble) double get price;@JsonKey(fromJson: _anyToInt) int get stock;@JsonKey(name: 'min_purchase_quantity', fromJson: _anyToInt) int get minPurchaseQuantity;@JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt) int get maxPurchaseQuantity;@JsonKey(fromJson: _anyToString) String get status;@JsonKey(name: 'final_price', fromJson: _anyToDouble) double get finalPrice;@JsonKey(name: 'has_discount', fromJson: _anyToBool) bool get hasDiscount;@JsonKey(name: 'discount_amount', fromJson: _anyToDouble) double get discountAmount;@JsonKey(name: 'discount_percentage', fromJson: _anyToInt) int get discountPercentage; RepairmanModel? get repairman; RepairmanModel? get admin;@JsonKey(name: 'owner_type', fromJson: _anyToString) String? get ownerType;@JsonKey(name: 'category_id', fromJson: _anyToString) String? get categoryId; CategoryModel? get category;
/// Create a copy of ManageProductsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManageProductsModelCopyWith<ManageProductsModel> get copyWith => _$ManageProductsModelCopyWithImpl<ManageProductsModel>(this as ManageProductsModel, _$identity);

  /// Serializes this ManageProductsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ManageProductsModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageProductsModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.repairmanId, _this.repairmanId) || other.repairmanId == _this.repairmanId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&const DeepCollectionEquality().equals(other.images, _this.images)&&const DeepCollectionEquality().equals(other.keywords, _this.keywords)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.stock, _this.stock) || other.stock == _this.stock)&&(identical(other.minPurchaseQuantity, _this.minPurchaseQuantity) || other.minPurchaseQuantity == _this.minPurchaseQuantity)&&(identical(other.maxPurchaseQuantity, _this.maxPurchaseQuantity) || other.maxPurchaseQuantity == _this.maxPurchaseQuantity)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.finalPrice, _this.finalPrice) || other.finalPrice == _this.finalPrice)&&(identical(other.hasDiscount, _this.hasDiscount) || other.hasDiscount == _this.hasDiscount)&&(identical(other.discountAmount, _this.discountAmount) || other.discountAmount == _this.discountAmount)&&(identical(other.discountPercentage, _this.discountPercentage) || other.discountPercentage == _this.discountPercentage)&&(identical(other.repairman, _this.repairman) || other.repairman == _this.repairman)&&(identical(other.admin, _this.admin) || other.admin == _this.admin)&&(identical(other.ownerType, _this.ownerType) || other.ownerType == _this.ownerType)&&(identical(other.categoryId, _this.categoryId) || other.categoryId == _this.categoryId)&&(identical(other.category, _this.category) || other.category == _this.category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ManageProductsModel;
  return Object.hashAll([runtimeType,_this.id,_this.repairmanId,_this.title,_this.description,const DeepCollectionEquality().hash(_this.images),const DeepCollectionEquality().hash(_this.keywords),_this.price,_this.stock,_this.minPurchaseQuantity,_this.maxPurchaseQuantity,_this.status,_this.finalPrice,_this.hasDiscount,_this.discountAmount,_this.discountPercentage,_this.repairman,_this.admin,_this.ownerType,_this.categoryId,_this.category]);
}

@override
String toString() {
  final _this = this as ManageProductsModel;
  return 'ManageProductsModel(id: ${_this.id}, repairmanId: ${_this.repairmanId}, title: ${_this.title}, description: ${_this.description}, images: ${_this.images}, keywords: ${_this.keywords}, price: ${_this.price}, stock: ${_this.stock}, minPurchaseQuantity: ${_this.minPurchaseQuantity}, maxPurchaseQuantity: ${_this.maxPurchaseQuantity}, status: ${_this.status}, finalPrice: ${_this.finalPrice}, hasDiscount: ${_this.hasDiscount}, discountAmount: ${_this.discountAmount}, discountPercentage: ${_this.discountPercentage}, repairman: ${_this.repairman}, admin: ${_this.admin}, ownerType: ${_this.ownerType}, categoryId: ${_this.categoryId}, category: ${_this.category})';
}


}

/// @nodoc
abstract mixin class $ManageProductsModelCopyWith<$Res>  {
  factory $ManageProductsModelCopyWith(ManageProductsModel value, $Res Function(ManageProductsModel) _then) = _$ManageProductsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(name: 'repairman_id', fromJson: _anyToString) String repairmanId,@JsonKey(fromJson: _anyToString) String title,@JsonKey(fromJson: _anyToString) String description,@JsonKey(fromJson: _imagesFromJson) List<String> images,@JsonKey(fromJson: _keywordsFromJson) List<String> keywords,@JsonKey(fromJson: _anyToDouble) double price,@JsonKey(fromJson: _anyToInt) int stock,@JsonKey(name: 'min_purchase_quantity', fromJson: _anyToInt) int minPurchaseQuantity,@JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt) int maxPurchaseQuantity,@JsonKey(fromJson: _anyToString) String status,@JsonKey(name: 'final_price', fromJson: _anyToDouble) double finalPrice,@JsonKey(name: 'has_discount', fromJson: _anyToBool) bool hasDiscount,@JsonKey(name: 'discount_amount', fromJson: _anyToDouble) double discountAmount,@JsonKey(name: 'discount_percentage', fromJson: _anyToInt) int discountPercentage, RepairmanModel? repairman, RepairmanModel? admin,@JsonKey(name: 'owner_type', fromJson: _anyToString) String? ownerType,@JsonKey(name: 'category_id', fromJson: _anyToString) String? categoryId, CategoryModel? category
});


$RepairmanModelCopyWith<$Res>? get repairman;$RepairmanModelCopyWith<$Res>? get admin;$CategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class _$ManageProductsModelCopyWithImpl<$Res>
    implements $ManageProductsModelCopyWith<$Res> {
  _$ManageProductsModelCopyWithImpl(this._self, this._then);

  final ManageProductsModel _self;
  final $Res Function(ManageProductsModel) _then;

/// Create a copy of ManageProductsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? repairmanId = null,Object? title = null,Object? description = null,Object? images = null,Object? keywords = null,Object? price = null,Object? stock = null,Object? minPurchaseQuantity = null,Object? maxPurchaseQuantity = null,Object? status = null,Object? finalPrice = null,Object? hasDiscount = null,Object? discountAmount = null,Object? discountPercentage = null,Object? repairman = freezed,Object? admin = freezed,Object? ownerType = freezed,Object? categoryId = freezed,Object? category = freezed,}) {
  return _then(ManageProductsModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,repairmanId: null == repairmanId ? _self.repairmanId : repairmanId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,keywords: null == keywords ? _self.keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,minPurchaseQuantity: null == minPurchaseQuantity ? _self.minPurchaseQuantity : minPurchaseQuantity // ignore: cast_nullable_to_non_nullable
as int,maxPurchaseQuantity: null == maxPurchaseQuantity ? _self.maxPurchaseQuantity : maxPurchaseQuantity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,finalPrice: null == finalPrice ? _self.finalPrice : finalPrice // ignore: cast_nullable_to_non_nullable
as double,hasDiscount: null == hasDiscount ? _self.hasDiscount : hasDiscount // ignore: cast_nullable_to_non_nullable
as bool,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,discountPercentage: null == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as int,repairman: freezed == repairman ? _self.repairman : repairman // ignore: cast_nullable_to_non_nullable
as RepairmanModel?,admin: freezed == admin ? _self.admin : admin // ignore: cast_nullable_to_non_nullable
as RepairmanModel?,ownerType: freezed == ownerType ? _self.ownerType : ownerType // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,
  ));
}
/// Create a copy of ManageProductsModel
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
}/// Create a copy of ManageProductsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RepairmanModelCopyWith<$Res>? get admin {
    if (_self.admin == null) {
    return null;
  }

  return $RepairmanModelCopyWith<$Res>(_self.admin!, (value) {
    return _then(_self.copyWith(admin: value));
  });
}/// Create a copy of ManageProductsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [ManageProductsModel].
extension ManageProductsModelPatterns on ManageProductsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManageProductsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManageProductsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManageProductsModel value)  $default,){
final _that = this;
switch (_that) {
case _ManageProductsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManageProductsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ManageProductsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'repairman_id', fromJson: _anyToString)  String repairmanId, @JsonKey(fromJson: _anyToString)  String title, @JsonKey(fromJson: _anyToString)  String description, @JsonKey(fromJson: _imagesFromJson)  List<String> images, @JsonKey(fromJson: _keywordsFromJson)  List<String> keywords, @JsonKey(fromJson: _anyToDouble)  double price, @JsonKey(fromJson: _anyToInt)  int stock, @JsonKey(name: 'min_purchase_quantity', fromJson: _anyToInt)  int minPurchaseQuantity, @JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt)  int maxPurchaseQuantity, @JsonKey(fromJson: _anyToString)  String status, @JsonKey(name: 'final_price', fromJson: _anyToDouble)  double finalPrice, @JsonKey(name: 'has_discount', fromJson: _anyToBool)  bool hasDiscount, @JsonKey(name: 'discount_amount', fromJson: _anyToDouble)  double discountAmount, @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)  int discountPercentage,  RepairmanModel? repairman,  RepairmanModel? admin, @JsonKey(name: 'owner_type', fromJson: _anyToString)  String? ownerType, @JsonKey(name: 'category_id', fromJson: _anyToString)  String? categoryId,  CategoryModel? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManageProductsModel() when $default != null:
return $default(_that.id,_that.repairmanId,_that.title,_that.description,_that.images,_that.keywords,_that.price,_that.stock,_that.minPurchaseQuantity,_that.maxPurchaseQuantity,_that.status,_that.finalPrice,_that.hasDiscount,_that.discountAmount,_that.discountPercentage,_that.repairman,_that.admin,_that.ownerType,_that.categoryId,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'repairman_id', fromJson: _anyToString)  String repairmanId, @JsonKey(fromJson: _anyToString)  String title, @JsonKey(fromJson: _anyToString)  String description, @JsonKey(fromJson: _imagesFromJson)  List<String> images, @JsonKey(fromJson: _keywordsFromJson)  List<String> keywords, @JsonKey(fromJson: _anyToDouble)  double price, @JsonKey(fromJson: _anyToInt)  int stock, @JsonKey(name: 'min_purchase_quantity', fromJson: _anyToInt)  int minPurchaseQuantity, @JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt)  int maxPurchaseQuantity, @JsonKey(fromJson: _anyToString)  String status, @JsonKey(name: 'final_price', fromJson: _anyToDouble)  double finalPrice, @JsonKey(name: 'has_discount', fromJson: _anyToBool)  bool hasDiscount, @JsonKey(name: 'discount_amount', fromJson: _anyToDouble)  double discountAmount, @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)  int discountPercentage,  RepairmanModel? repairman,  RepairmanModel? admin, @JsonKey(name: 'owner_type', fromJson: _anyToString)  String? ownerType, @JsonKey(name: 'category_id', fromJson: _anyToString)  String? categoryId,  CategoryModel? category)  $default,) {final _that = this;
switch (_that) {
case _ManageProductsModel():
return $default(_that.id,_that.repairmanId,_that.title,_that.description,_that.images,_that.keywords,_that.price,_that.stock,_that.minPurchaseQuantity,_that.maxPurchaseQuantity,_that.status,_that.finalPrice,_that.hasDiscount,_that.discountAmount,_that.discountPercentage,_that.repairman,_that.admin,_that.ownerType,_that.categoryId,_that.category);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _anyToString)  String id, @JsonKey(name: 'repairman_id', fromJson: _anyToString)  String repairmanId, @JsonKey(fromJson: _anyToString)  String title, @JsonKey(fromJson: _anyToString)  String description, @JsonKey(fromJson: _imagesFromJson)  List<String> images, @JsonKey(fromJson: _keywordsFromJson)  List<String> keywords, @JsonKey(fromJson: _anyToDouble)  double price, @JsonKey(fromJson: _anyToInt)  int stock, @JsonKey(name: 'min_purchase_quantity', fromJson: _anyToInt)  int minPurchaseQuantity, @JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt)  int maxPurchaseQuantity, @JsonKey(fromJson: _anyToString)  String status, @JsonKey(name: 'final_price', fromJson: _anyToDouble)  double finalPrice, @JsonKey(name: 'has_discount', fromJson: _anyToBool)  bool hasDiscount, @JsonKey(name: 'discount_amount', fromJson: _anyToDouble)  double discountAmount, @JsonKey(name: 'discount_percentage', fromJson: _anyToInt)  int discountPercentage,  RepairmanModel? repairman,  RepairmanModel? admin, @JsonKey(name: 'owner_type', fromJson: _anyToString)  String? ownerType, @JsonKey(name: 'category_id', fromJson: _anyToString)  String? categoryId,  CategoryModel? category)?  $default,) {final _that = this;
switch (_that) {
case _ManageProductsModel() when $default != null:
return $default(_that.id,_that.repairmanId,_that.title,_that.description,_that.images,_that.keywords,_that.price,_that.stock,_that.minPurchaseQuantity,_that.maxPurchaseQuantity,_that.status,_that.finalPrice,_that.hasDiscount,_that.discountAmount,_that.discountPercentage,_that.repairman,_that.admin,_that.ownerType,_that.categoryId,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManageProductsModel extends ManageProductsModel {
  const _ManageProductsModel({@JsonKey(fromJson: _anyToString) this.id = '', @JsonKey(name: 'repairman_id', fromJson: _anyToString) this.repairmanId = '', @JsonKey(fromJson: _anyToString) this.title = '', @JsonKey(fromJson: _anyToString) this.description = '', @JsonKey(fromJson: _imagesFromJson)  List<String> images = const [], @JsonKey(fromJson: _keywordsFromJson)  List<String> keywords = const [], @JsonKey(fromJson: _anyToDouble) this.price = 0.0, @JsonKey(fromJson: _anyToInt) this.stock = 0, @JsonKey(name: 'min_purchase_quantity', fromJson: _anyToInt) this.minPurchaseQuantity = 0, @JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt) this.maxPurchaseQuantity = 0, @JsonKey(fromJson: _anyToString) this.status = '', @JsonKey(name: 'final_price', fromJson: _anyToDouble) this.finalPrice = 0.0, @JsonKey(name: 'has_discount', fromJson: _anyToBool) this.hasDiscount = false, @JsonKey(name: 'discount_amount', fromJson: _anyToDouble) this.discountAmount = 0.0, @JsonKey(name: 'discount_percentage', fromJson: _anyToInt) this.discountPercentage = 0, this.repairman, this.admin, @JsonKey(name: 'owner_type', fromJson: _anyToString) this.ownerType, @JsonKey(name: 'category_id', fromJson: _anyToString) this.categoryId, this.category}): _images = images,_keywords = keywords,super._();
  factory _ManageProductsModel.fromJson(Map<String, dynamic> json) => _$ManageProductsModelFromJson(json);

@override@JsonKey(fromJson: _anyToString) final  String id;
@override@JsonKey(name: 'repairman_id', fromJson: _anyToString) final  String repairmanId;
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

@override@JsonKey(fromJson: _anyToDouble) final  double price;
@override@JsonKey(fromJson: _anyToInt) final  int stock;
@override@JsonKey(name: 'min_purchase_quantity', fromJson: _anyToInt) final  int minPurchaseQuantity;
@override@JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt) final  int maxPurchaseQuantity;
@override@JsonKey(fromJson: _anyToString) final  String status;
@override@JsonKey(name: 'final_price', fromJson: _anyToDouble) final  double finalPrice;
@override@JsonKey(name: 'has_discount', fromJson: _anyToBool) final  bool hasDiscount;
@override@JsonKey(name: 'discount_amount', fromJson: _anyToDouble) final  double discountAmount;
@override@JsonKey(name: 'discount_percentage', fromJson: _anyToInt) final  int discountPercentage;
@override final  RepairmanModel? repairman;
@override final  RepairmanModel? admin;
@override@JsonKey(name: 'owner_type', fromJson: _anyToString) final  String? ownerType;
@override@JsonKey(name: 'category_id', fromJson: _anyToString) final  String? categoryId;
@override final  CategoryModel? category;

/// Create a copy of ManageProductsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManageProductsModelCopyWith<_ManageProductsModel> get copyWith => __$ManageProductsModelCopyWithImpl<_ManageProductsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManageProductsModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManageProductsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.repairmanId, repairmanId) || other.repairmanId == repairmanId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.images, _images)&&const DeepCollectionEquality().equals(other.keywords, _keywords)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.minPurchaseQuantity, minPurchaseQuantity) || other.minPurchaseQuantity == minPurchaseQuantity)&&(identical(other.maxPurchaseQuantity, maxPurchaseQuantity) || other.maxPurchaseQuantity == maxPurchaseQuantity)&&(identical(other.status, status) || other.status == status)&&(identical(other.finalPrice, finalPrice) || other.finalPrice == finalPrice)&&(identical(other.hasDiscount, hasDiscount) || other.hasDiscount == hasDiscount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage)&&(identical(other.repairman, repairman) || other.repairman == repairman)&&(identical(other.admin, admin) || other.admin == admin)&&(identical(other.ownerType, ownerType) || other.ownerType == ownerType)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,repairmanId,title,description,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_keywords),price,stock,minPurchaseQuantity,maxPurchaseQuantity,status,finalPrice,hasDiscount,discountAmount,discountPercentage,repairman,admin,ownerType,categoryId,category]);
}

@override
String toString() {
    return 'ManageProductsModel(id: $id, repairmanId: $repairmanId, title: $title, description: $description, images: $images, keywords: $keywords, price: $price, stock: $stock, minPurchaseQuantity: $minPurchaseQuantity, maxPurchaseQuantity: $maxPurchaseQuantity, status: $status, finalPrice: $finalPrice, hasDiscount: $hasDiscount, discountAmount: $discountAmount, discountPercentage: $discountPercentage, repairman: $repairman, admin: $admin, ownerType: $ownerType, categoryId: $categoryId, category: $category)';
}


}

/// @nodoc
abstract mixin class _$ManageProductsModelCopyWith<$Res> implements $ManageProductsModelCopyWith<$Res> {
  factory _$ManageProductsModelCopyWith(_ManageProductsModel value, $Res Function(_ManageProductsModel) _then) = __$ManageProductsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _anyToString) String id,@JsonKey(name: 'repairman_id', fromJson: _anyToString) String repairmanId,@JsonKey(fromJson: _anyToString) String title,@JsonKey(fromJson: _anyToString) String description,@JsonKey(fromJson: _imagesFromJson) List<String> images,@JsonKey(fromJson: _keywordsFromJson) List<String> keywords,@JsonKey(fromJson: _anyToDouble) double price,@JsonKey(fromJson: _anyToInt) int stock,@JsonKey(name: 'min_purchase_quantity', fromJson: _anyToInt) int minPurchaseQuantity,@JsonKey(name: 'max_purchase_quantity', fromJson: _anyToInt) int maxPurchaseQuantity,@JsonKey(fromJson: _anyToString) String status,@JsonKey(name: 'final_price', fromJson: _anyToDouble) double finalPrice,@JsonKey(name: 'has_discount', fromJson: _anyToBool) bool hasDiscount,@JsonKey(name: 'discount_amount', fromJson: _anyToDouble) double discountAmount,@JsonKey(name: 'discount_percentage', fromJson: _anyToInt) int discountPercentage, RepairmanModel? repairman, RepairmanModel? admin,@JsonKey(name: 'owner_type', fromJson: _anyToString) String? ownerType,@JsonKey(name: 'category_id', fromJson: _anyToString) String? categoryId, CategoryModel? category
});


@override $RepairmanModelCopyWith<$Res>? get repairman;@override $RepairmanModelCopyWith<$Res>? get admin;@override $CategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class __$ManageProductsModelCopyWithImpl<$Res>
    implements _$ManageProductsModelCopyWith<$Res> {
  __$ManageProductsModelCopyWithImpl(this._self, this._then);

  final _ManageProductsModel _self;
  final $Res Function(_ManageProductsModel) _then;

/// Create a copy of ManageProductsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? repairmanId = null,Object? title = null,Object? description = null,Object? images = null,Object? keywords = null,Object? price = null,Object? stock = null,Object? minPurchaseQuantity = null,Object? maxPurchaseQuantity = null,Object? status = null,Object? finalPrice = null,Object? hasDiscount = null,Object? discountAmount = null,Object? discountPercentage = null,Object? repairman = freezed,Object? admin = freezed,Object? ownerType = freezed,Object? categoryId = freezed,Object? category = freezed,}) {
  return _then(_ManageProductsModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,repairmanId: null == repairmanId ? _self.repairmanId : repairmanId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,keywords: null == keywords ? _self._keywords : keywords // ignore: cast_nullable_to_non_nullable
as List<String>,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,minPurchaseQuantity: null == minPurchaseQuantity ? _self.minPurchaseQuantity : minPurchaseQuantity // ignore: cast_nullable_to_non_nullable
as int,maxPurchaseQuantity: null == maxPurchaseQuantity ? _self.maxPurchaseQuantity : maxPurchaseQuantity // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,finalPrice: null == finalPrice ? _self.finalPrice : finalPrice // ignore: cast_nullable_to_non_nullable
as double,hasDiscount: null == hasDiscount ? _self.hasDiscount : hasDiscount // ignore: cast_nullable_to_non_nullable
as bool,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,discountPercentage: null == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as int,repairman: freezed == repairman ? _self.repairman : repairman // ignore: cast_nullable_to_non_nullable
as RepairmanModel?,admin: freezed == admin ? _self.admin : admin // ignore: cast_nullable_to_non_nullable
as RepairmanModel?,ownerType: freezed == ownerType ? _self.ownerType : ownerType // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,
  ));
}

/// Create a copy of ManageProductsModel
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
}/// Create a copy of ManageProductsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RepairmanModelCopyWith<$Res>? get admin {
    if (_self.admin == null) {
    return null;
  }

  return $RepairmanModelCopyWith<$Res>(_self.admin!, (value) {
    return _then(_self.copyWith(admin: value));
  });
}/// Create a copy of ManageProductsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
