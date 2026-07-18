class ShopBasketEntity {
  final List<BasketShopGroup> shopGroups;
  final double totalPrice;

  ShopBasketEntity({
    required this.shopGroups,
    required this.totalPrice,
  });
}

class BasketShopGroup {
  final String shopName;
  final List<BasketItem> items;
  final double groupTotalPrice;

  BasketShopGroup({
    required this.shopName,
    required this.items,
    required this.groupTotalPrice,
  });
}

class BasketItem {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final int quantity;
  final bool isAvailable;

  BasketItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.isAvailable,
  });
}
