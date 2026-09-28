part of 'manage_users_bloc.dart';

abstract class ManageUsersEvent extends Equatable {
  const ManageUsersEvent();

  @override
  List<Object?> get props => [];
}

class FetchManageUsers extends ManageUsersEvent {
  final UsersFilterParams params;
  const FetchManageUsers(this.params);

  @override
  List<Object?> get props => [params];
}

class LoadMoreManageUsers extends ManageUsersEvent {
  const LoadMoreManageUsers();
}

class ChangeRepairmanStatus extends ManageUsersEvent {
  final String id;
  const ChangeRepairmanStatus(this.id);

  @override
  List<Object?> get props => [id];
}

class AddUserEvent extends ManageUsersEvent {
  final Map<String, dynamic> userData;
  const AddUserEvent(this.userData);

  @override
  List<Object?> get props => [userData];
}

class ClearManageUsersFilters extends ManageUsersEvent {
  const ClearManageUsersFilters();
}
