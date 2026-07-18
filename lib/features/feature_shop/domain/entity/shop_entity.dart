class ShopEntity {
  final List<ShopProduct> products;

  ShopEntity({required this.products});
}

class ShopProduct {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final bool isAvailable;
  final String category;

  ShopProduct({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.isAvailable,
    required this.category,
  });
}
