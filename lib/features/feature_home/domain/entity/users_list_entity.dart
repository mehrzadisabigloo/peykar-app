import 'user_entity.dart';

class UsersListEntity {
  final List<UserEntity> users;
  final int currentPage;
  final int lastPage;
  final int total;

  const UsersListEntity({
    required this.users,
    this.currentPage = 1,
    this.lastPage = 1,
    this.total = 0,
  });

  bool get hasMore => currentPage < lastPage;
}
