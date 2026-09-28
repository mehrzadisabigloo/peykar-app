import '../../../../feature_home/domain/entity/user_entity.dart';

class ManageRatingEntity {
  final String id;
  final String userId;
  final String repairmanId;
  final String description;
  final int score;
  final String status;
  final String createdAt;
  final String? createdAtJalali;
  final UserEntity? user;

  const ManageRatingEntity({
    required this.id,
    required this.userId,
    required this.repairmanId,
    required this.description,
    required this.score,
    required this.status,
    required this.createdAt,
    this.createdAtJalali,
    this.user,
  });

  bool get isActive => status.toLowerCase() == 'active';
}

class ManageRatingListEntity {
  final List<ManageRatingEntity> ratings;
  final int currentPage;
  final int lastPage;
  final int total;

  const ManageRatingListEntity({
    required this.ratings,
    this.currentPage = 1,
    this.lastPage = 1,
    this.total = 0,
  });

  bool get hasMore => currentPage < lastPage;
}
