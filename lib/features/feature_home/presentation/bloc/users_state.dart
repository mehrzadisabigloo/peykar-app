part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object?> get props => [];
}

class UsersInitial extends UsersState {
  const UsersInitial();
}

class UsersLoading extends UsersState {
  final UsersFilterParams filters;
  const UsersLoading(this.filters);

  @override
  List<Object?> get props => [filters];
}

class UsersLoadingMore extends UsersState {
  final List<UserEntity> users;
  final UsersFilterParams filters;
  final bool hasMore;
  final int total;

  const UsersLoadingMore({
    required this.users,
    required this.filters,
    required this.hasMore,
    required this.total,
  });

  @override
  List<Object?> get props => [users, filters, hasMore, total];
}

class UsersLoaded extends UsersState {
  final List<UserEntity> users;
  final UsersFilterParams filters;
  final bool hasMore;
  final int total;
  final String? errorMessage;

  const UsersLoaded({
    required this.users,
    required this.filters,
    required this.hasMore,
    required this.total,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [users, filters, hasMore, total, errorMessage];
}

class UsersFailed extends UsersState {
  final String message;
  final UsersFilterParams filters;

  const UsersFailed(this.message, this.filters);

  @override
  List<Object?> get props => [message, filters];
}
