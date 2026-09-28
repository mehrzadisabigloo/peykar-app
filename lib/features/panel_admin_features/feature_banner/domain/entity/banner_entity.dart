import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final String? id;
  final String? place;
  final Map<String, dynamic>? images;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  const BannerEntity({
    this.id,
    this.place,
    this.images,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  bool get isActive => status?.toLowerCase() == 'active';

  String get activityType {
    if (images == null || images!.isEmpty) return 'info';
    return images!.keys.first;
  }

  String? get activityId {
    if (images == null || images!.isEmpty) return null;
    final value = images![activityType];
    if (value is Map && value.containsKey('id')) {
      return value['id']?.toString();
    }
    return null;
  }

  String get firstImageId {
    if (images == null || images!.isEmpty) return '';
    final value = images![activityType];
    if (value is String) return value;
    if (value is Map && value.containsKey('image')) {
      return value['image']?.toString() ?? '';
    }
    return '';
  }

  @override
  List<Object?> get props => [id, place, images, status, createdAt, updatedAt];
}

class BannerFilterParams {
  final String? place;
  final bool isPaginate;
  final int countItem;
  final int page;

  const BannerFilterParams({
    this.place,
    this.isPaginate = true,
    this.countItem = 10,
    this.page = 1,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'is_paginate': isPaginate,
      'count_item': countItem,
      'page': page,
    };
    if (place != null && place!.isNotEmpty) {
      map['place'] = place;
    }
    return map;
  }
}
