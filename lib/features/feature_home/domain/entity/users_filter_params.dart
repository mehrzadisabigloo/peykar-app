class UsersFilterParams {
  final bool isPaginate;
  final int countItem;
  final int page;
  final String? firstName;
  final String? lastName;
  final String? mobile;
  final String? role;
  final String filter;

  const UsersFilterParams({
    this.isPaginate = true,
    this.countItem = 10,
    this.page = 1,
    this.firstName,
    this.lastName,
    this.mobile,
    this.role,
    this.filter = 'latest',
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
    bool clearFirstName = false,
    bool clearLastName = false,
    bool clearMobile = false,
    bool clearRole = false,
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
    );
  }
}
