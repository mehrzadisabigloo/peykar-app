import '../../../../core/resources/consts.dart';
import '../../domain/entity/shop_basket_entity.dart';

class ShopBasketModel extends ShopBasketEntity {
  ShopBasketModel({
    required super.shopGroups,
    required super.totalPrice,
  });

  factory ShopBasketModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> itemsList = json['items'] ?? [];
    
    // 1. Map all items
    final List<BasketItem> allItems = itemsList.map((item) {
      final product = item['product'] ?? {};
      
      String firstImageUrl = '';
      if (product['images'] is List && (product['images'] as List).isNotEmpty) {
        final imageId = product['images'][0].toString();
        if (imageId.isNotEmpty) {
          firstImageUrl = '${Consts.baseFileUrl}$imageId';
        }
      }

      return BasketItem(
        id: item['id']?.toString() ?? '',
        productId: item['product_id']?.toString() ?? product['id']?.toString() ?? '',
        title: product['title'] ?? 'بدون نام',
        imageUrl: firstImageUrl,
        price: (item['final_price'] ?? 0).toDouble(),
        quantity: (item['quantity'] ?? 0).toInt(),
        isAvailable: (product['status'] == 'Active'),
      );
    }).toList();

    // 2. Group items by Shop (Repairman or Admin)
    final Map<String, List<BasketItem>> groupedItems = {};
    final Map<String, String> shopNames = {};
    
    for (var i = 0; i < itemsList.length; i++) {
      final itemJson = itemsList[i];
      final product = itemJson['product'] ?? {};
      final ownerType = product['owner_type'] ?? 'repairman';
      
      String shopId = '';
      String shopName = '';

      if (ownerType == 'admin') {
        final admin = product['admin'] ?? {};
        shopId = admin['id']?.toString() ?? 'admin_shop';
        final firstName = admin['first_name'] ?? '';
        final lastName = admin['last_name'] ?? '';
        shopName = (firstName.isNotEmpty || lastName.isNotEmpty) ? '$firstName $lastName' : 'فروشگاه مرکزی';
      } else {
        final repairman = product['repairman'] ?? {};
        shopId = repairman['id']?.toString() ?? 'default_shop';
        final firstName = repairman['first_name'] ?? '';
        final lastName = repairman['last_name'] ?? '';
        final brand = repairman['brand'];
        
        shopName = (brand != null && brand.toString().isNotEmpty) 
            ? brand.toString() 
            : (firstName.isNotEmpty || lastName.isNotEmpty) 
              ? '$firstName $lastName' 
              : 'فروشگاه زینو';
      }

      if (!groupedItems.containsKey(shopId)) {
        groupedItems[shopId] = [];
        shopNames[shopId] = shopName;
      }
      groupedItems[shopId]!.add(allItems[i]);
    }

    // 3. Create BasketShopGroup list
    final List<BasketShopGroup> groups = groupedItems.entries.map((entry) {
      final items = entry.value;
      final repairmanId = entry.key;
      final groupTotal = items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
      return BasketShopGroup(
        repairmanId: repairmanId,
        shopName: shopNames[repairmanId] ?? 'فروشگاه',
        items: items,
        groupTotalPrice: groupTotal,
      );
    }).toList();

    // 4. Calculate total cart price
    final double overallTotal = groups.fold(0.0, (sum, group) => sum + group.groupTotalPrice);

    return ShopBasketModel(
      shopGroups: groups,
      totalPrice: overallTotal,
    );
  }
}
