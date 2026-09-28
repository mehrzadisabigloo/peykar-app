class AdminProductFilterParams {
  final bool isPaginate;
  final int countItem;
  final int page;
  final String? title;
  final String? categoryId;
  final double? priceFrom;
  final double? priceTo;
  final int? stockFrom;
  final int? stockTo;

  const AdminProductFilterParams({
    this.isPaginate = true,
    this.countItem = 10,
    this.page = 1,
    this.title,
    this.categoryId,
    this.priceFrom,
    this.priceTo,
    this.stockFrom,
    this.stockTo,
  });

  Map<String, dynamic> toJson() {
    return {
      'is_paginate': isPaginate,
      'count_item': countItem,
      'page': page,
      if (title != null && title!.isNotEmpty) 'title': title,
      if (categoryId != null && categoryId!.isNotEmpty) 'category_id': categoryId,
      if (priceFrom != null) 'price_from': priceFrom,
      if (priceTo != null) 'price_to': priceTo,
      if (stockFrom != null) 'stock_from': stockFrom,
      if (stockTo != null) 'stock_to': stockTo,
    };
  }

  AdminProductFilterParams copyWith({
    bool? isPaginate,
    int? countItem,
    int? page,
    String? title,
    String? categoryId,
    double? priceFrom,
    double? priceTo,
    int? stockFrom,
    int? stockTo,
  }) {
    return AdminProductFilterParams(
      isPaginate: isPaginate ?? this.isPaginate,
      countItem: countItem ?? this.countItem,
      page: page ?? this.page,
      title: title ?? this.title,
      categoryId: categoryId ?? this.categoryId,
      priceFrom: priceFrom ?? this.priceFrom,
      priceTo: priceTo ?? this.priceTo,
      stockFrom: stockFrom ?? this.stockFrom,
      stockTo: stockTo ?? this.stockTo,
    );
  }
}
