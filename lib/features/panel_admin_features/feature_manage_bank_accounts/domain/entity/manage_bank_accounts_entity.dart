class BankEntity {
  final int? id;
  final String? name;
  final String? logo;

  const BankEntity({
    this.id,
    this.name,
    this.logo,
  });
}

class BankAccountEntity {
  final String? id;
  final int? bankId;
  final String? fullName;
  final String? cardNumber;
  final String? accountNumber;
  final String? shebaNumber;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  const BankAccountEntity({
    this.id,
    this.bankId,
    this.fullName,
    this.cardNumber,
    this.accountNumber,
    this.shebaNumber,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  bool get isActive => status?.toLowerCase() == 'active';
}

class BankFilterParams {
  final int countItem;
  final bool isPaginate;
  final String? name;

  const BankFilterParams({
    this.countItem = 100,
    this.isPaginate = false,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'count_item': countItem,
      'is_paginate': isPaginate,
    };
    if (name != null) map['name'] = name;
    return map;
  }
}

class BankAccountFilterParams {
  final int countItem;
  final bool isPaginate;
  final bool isMyAccounts;
  final int? bankId;
  final String? fullName;
  final int page;

  const BankAccountFilterParams({
    this.countItem = 10,
    this.isPaginate = false,
    this.isMyAccounts = true,
    this.bankId,
    this.fullName,
    this.page = 1,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'count_item': countItem,
      'is_paginate': isPaginate,
      'is_my_accounts': isMyAccounts,
      'page': page,
    };
    if (bankId != null) map['bank_id'] = bankId;
    if (fullName != null) map['full_name'] = fullName;
    return map;
  }
}
