import '../../../../features/feature_home/domain/entity/user_entity.dart';

class ClientServicesEntity {
  final List<ServiceCategory> categories;
  final List<UserEntity> topRepairShops;

  ClientServicesEntity({
    required this.categories,
    required this.topRepairShops,
  });
}

class ServiceCategory {
  final String id;
  final String title;
  final String iconPath;

  ServiceCategory({
    required this.id,
    required this.title,
    required this.iconPath,
  });
}
