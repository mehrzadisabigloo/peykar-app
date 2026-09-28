import 'reminders_entity.dart';

class RemindersListEntity {
  final List<RemindersEntity> reminders;
  final int currentPage;
  final int lastPage;
  final int total;

  const RemindersListEntity({
    required this.reminders,
    this.currentPage = 1,
    this.lastPage = 1,
    this.total = 0,
  });

  bool get hasMore => currentPage < lastPage;
}
