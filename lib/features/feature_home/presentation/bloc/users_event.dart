part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object?> get props => [];
}

class FetchUsers extends UsersEvent {
  final UsersFilterParams params;
  const FetchUsers(this.params);

  @override
  List<Object?> get props => [params];
}

class LoadMoreUsers extends UsersEvent {
  const LoadMoreUsers();
}

class ClearUsersFilters extends UsersEvent {
  const ClearUsersFilters();
}
