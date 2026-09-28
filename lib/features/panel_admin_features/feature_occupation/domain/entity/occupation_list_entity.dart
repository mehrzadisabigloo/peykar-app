import 'occupation_entity.dart';

class OccupationListEntity {
  final List<OccupationEntity> occupations;
  final int currentPage;
  final int lastPage;
  final int total;

  const OccupationListEntity({
    required this.occupations,
    this.currentPage = 1,
    this.lastPage = 1,
    this.total = 0,
  });

  bool get hasMore => currentPage < lastPage;
}
