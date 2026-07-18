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
        title: product['title'] ?? 'بدون نام',
        imageUrl: firstImageUrl,
        price: (item['final_price'] ?? 0).toDouble(),
        quantity: (item['quantity'] ?? 0).toInt(),
        isAvailable: (product['status'] == 'Active'),
      );
    }).toList();

    // 2. Group items by Repairman (Shop)
    final Map<String, List<BasketItem>> groupedItems = {};
    final Map<String, String> shopNames = {};
    
    for (var i = 0; i < itemsList.length; i++) {
      final itemJson = itemsList[i];
      final product = itemJson['product'] ?? {};
      final repairman = product['repairman'] ?? {};
      final repairmanId = repairman['id']?.toString() ?? 'default_shop';
      
      final firstName = repairman['first_name'] ?? '';
      final lastName = repairman['last_name'] ?? '';
      final brand = repairman['brand'];
      
      final shopName = (brand != null && brand.toString().isNotEmpty) 
          ? brand.toString() 
          : (firstName.isNotEmpty || lastName.isNotEmpty) 
            ? '$firstName $lastName' 
            : 'فروشگاه زینو';

      if (!groupedItems.containsKey(repairmanId)) {
        groupedItems[repairmanId] = [];
        shopNames[repairmanId] = shopName;
      }
      groupedItems[repairmanId]!.add(allItems[i]);
    }

    // 3. Create BasketShopGroup list
    final List<BasketShopGroup> groups = groupedItems.entries.map((entry) {
      final items = entry.value;
      final groupTotal = items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
      return BasketShopGroup(
        shopName: shopNames[entry.key] ?? 'فروشگاه',
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
