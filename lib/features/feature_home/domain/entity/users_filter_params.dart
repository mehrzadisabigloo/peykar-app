class UsersFilterParams {
  final bool isPaginate;
  final int countItem;
  final int page;
  final String? firstName;
  final String? lastName;
  final String? mobile;
  final String? role;
  final String filter;
  final double? distanceKm;
  final bool? sortByRating;
  final String? occupationId;

  const UsersFilterParams({
    this.isPaginate = true,
    this.countItem = 10,
    this.page = 1,
    this.firstName,
    this.lastName,
    this.mobile,
    this.role,
    this.filter = 'latest',
    this.distanceKm,
    this.sortByRating,
    this.occupationId,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'is_paginate': isPaginate,
      'count_item': countItem,
      'page': page,
      'filter': filter,
    };

    if (firstName != null && firstName!.isNotEmpty) {
      map['first_name'] = firstName;
    }
    if (lastName != null && lastName!.isNotEmpty) {
      map['last_name'] = lastName;
    }
    if (mobile != null && mobile!.isNotEmpty) {
      map['mobile'] = mobile;
    }
    if (role != null && role!.isNotEmpty) {
      map['role'] = role;
    }
    if (distanceKm != null) {
      map['distance_km'] = distanceKm;
    }
    if (sortByRating != null) {
      map['sort_by_rating'] = sortByRating;
    }
    if (occupationId != null && occupationId!.isNotEmpty) {
      map['occupation_id'] = occupationId;
    }

    return map;
  }

  UsersFilterParams copyWith({
    bool? isPaginate,
    int? countItem,
    int? page,
    String? firstName,
    String? lastName,
    String? mobile,
    String? role,
    String? filter,
    double? distanceKm,
    bool? sortByRating,
    String? occupationId,
    bool clearFirstName = false,
    bool clearLastName = false,
    bool clearMobile = false,
    bool clearRole = false,
    bool clearDistanceKm = false,
    bool clearSortByRating = false,
    bool clearOccupationId = false,
  }) {
    return UsersFilterParams(
      isPaginate: isPaginate ?? this.isPaginate,
      countItem: countItem ?? this.countItem,
      page: page ?? this.page,
      firstName: clearFirstName ? null : (firstName ?? this.firstName),
      lastName: clearLastName ? null : (lastName ?? this.lastName),
      mobile: clearMobile ? null : (mobile ?? this.mobile),
      role: clearRole ? null : (role ?? this.role),
      filter: filter ?? this.filter,
      // distanceKm: clearDistanceKm ? null : (distanceKm ?? this.distanceKm),
      sortByRating: clearSortByRating ? null : (sortByRating ?? this.sortByRating),
      occupationId: clearOccupationId ? null : (occupationId ?? this.occupationId),
    );
  }
}
