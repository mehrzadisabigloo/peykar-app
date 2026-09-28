part of 'manage_users_bloc.dart';

abstract class ManageUsersState extends Equatable {
  final UsersFilterParams filters;
  final bool isActionLoading;
  const ManageUsersState({required this.filters, this.isActionLoading = false});

  @override
  List<Object?> get props => [filters, isActionLoading];
}

class ManageUsersInitial extends ManageUsersState {
  const ManageUsersInitial() : super(filters: const UsersFilterParams());

  ManageUsersInitial copyWith({
    UsersFilterParams? filters,
    bool? isActionLoading,
  }) {
    return const ManageUsersInitial(); // Initial usually doesn't need to be copied with values, but I'll make it consistent
  }
}

class ManageUsersLoading extends ManageUsersState {
  const ManageUsersLoading({required super.filters, super.isActionLoading});

  ManageUsersLoading copyWith({
    UsersFilterParams? filters,
    bool? isActionLoading,
  }) {
    return ManageUsersLoading(
      filters: filters ?? this.filters,
      isActionLoading: isActionLoading ?? this.isActionLoading,
    );
  }
}

class ManageUsersLoaded extends ManageUsersState {
  final List<UserEntity> users;
  final bool hasMore;
  final int total;
  final String? processingId;
  final String? successMessage;
  final String? errorMessage;

  const ManageUsersLoaded({
    required this.users,
    required super.filters,
    this.hasMore = false,
    this.total = 0,
    this.processingId,
    this.successMessage,
    this.errorMessage,
    super.isActionLoading,
  });

  ManageUsersLoaded copyWith({
    List<UserEntity>? users,
    UsersFilterParams? filters,
    bool? hasMore,
    int? total,
    String? processingId,
    String? successMessage,
    String? errorMessage,
    bool? isActionLoading,
    bool clearProcessingId = false,
    bool clearMessages = false,
  }) {
    return ManageUsersLoaded(
      users: users ?? this.users,
      filters: filters ?? this.filters,
      hasMore: hasMore ?? this.hasMore,
      total: total ?? this.total,
      processingId: processingId ?? (clearProcessingId ? null : this.processingId),
      successMessage: successMessage ?? (clearMessages ? null : this.successMessage),
      errorMessage: errorMessage ?? (clearMessages ? null : this.errorMessage),
      isActionLoading: isActionLoading ?? this.isActionLoading,
    );
  }

  @override
  List<Object?> get props => [users, filters, hasMore, total, processingId, successMessage, errorMessage, isActionLoading];
}

class ManageUsersLoadingMore extends ManageUsersLoaded {
  const ManageUsersLoadingMore({
    required super.users,
    required super.filters,
    super.hasMore,
    super.total,
  });
}

class ManageUsersFailed extends ManageUsersState {
  final String message;
  const ManageUsersFailed(this.message, {required super.filters, super.isActionLoading});

  @override
  List<Object?> get props => [message, filters, isActionLoading];

  ManageUsersFailed copyWith({
    String? message,
    UsersFilterParams? filters,
    bool? isActionLoading,
  }) {
    return ManageUsersFailed(
      message ?? this.message,
      filters: filters ?? this.filters,
      isActionLoading: isActionLoading ?? this.isActionLoading,
    );
  }
}
