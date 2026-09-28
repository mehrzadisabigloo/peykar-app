import 'banner_entity.dart';

class BannerListEntity {
  final List<BannerEntity> banners;
  final int currentPage;
  final int lastPage;
  final int total;

  const BannerListEntity({
    required this.banners,
    this.currentPage = 1,
    this.lastPage = 1,
    this.total = 0,
  });

  bool get hasMore => currentPage < lastPage;
}
