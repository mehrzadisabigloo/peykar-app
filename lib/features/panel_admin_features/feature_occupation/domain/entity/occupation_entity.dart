import 'package:equatable/equatable.dart';

class OccupationEntity extends Equatable {
  final String? id;
  final String? title;
  final String? status;
  final int? sortOrder;
  final String? createdAt;
  final String? updatedAt;

  const OccupationEntity({
    this.id,
    this.title,
    this.status,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
  });

  bool get isActive => status?.toLowerCase() == 'active';

  @override
  List<Object?> get props => [id, title, status, sortOrder, createdAt, updatedAt];
}

class OccupationFilterParams {
  final String? title;
  final bool isPaginate;
  final int countItem;
  final int page;

  const OccupationFilterParams({
    this.title,
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
    if (title != null && title!.isNotEmpty) {
      map['title'] = title;
    }
    return map;
  }
}
