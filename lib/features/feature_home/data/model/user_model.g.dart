// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: _anyToString(json['id']),
  firstName: _anyToString(json['first_name']),
  lastName: _anyToString(json['last_name']),
  mobile: _anyToString(json['mobile']),
  role: _roleFromJson(json['role']),
  status: _anyToString(json['status']),
  brand: _anyToString(json['brand']),
  ostan: _anyToString(json['ostan']),
  shahrestan: _anyToString(json['shahrestan']),
  address: _anyToString(json['address']),
  profileImageId: _anyToString(json['profile_image_id']),
  ratingAverage: _toDouble(json['rating_average']),
  ratingsCount: _toInt(json['ratings_count']),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'mobile': instance.mobile,
      'role': instance.role,
      'status': instance.status,
      'brand': instance.brand,
      'ostan': instance.ostan,
      'shahrestan': instance.shahrestan,
      'address': instance.address,
      'profile_image_id': instance.profileImageId,
      'rating_average': instance.ratingAverage,
      'ratings_count': instance.ratingsCount,
    };
