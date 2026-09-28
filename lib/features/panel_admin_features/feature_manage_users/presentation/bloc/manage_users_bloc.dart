import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/bloc/base/base_bloc.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../feature_home/domain/entity/user_entity.dart';
import '../../../../feature_home/domain/entity/users_filter_params.dart';
import '../../domain/repository/manage_users_repository.dart';

part 'manage_users_event.dart';
part 'manage_users_state.dart';

class ManageUsersBloc extends BaseBloc<ManageUsersEvent, ManageUsersState> {
  final ManageUsersRepository repository;

  ManageUsersBloc(this.repository) : super(const ManageUsersInitial()) {
    on<FetchManageUsers>(_onFetchUsers);
    on<LoadMoreManageUsers>(_onLoadMoreUsers);
    on<ChangeRepairmanStatus>(_onChangeRepairmanStatus);
    on<AddUserEvent>(_onAddUser);
    on<ClearManageUsersFilters>(_onClearFilters);
  }

  UsersFilterParams _currentFilters = const UsersFilterParams();
  List<UserEntity> _users = [];

  Future<void> _onFetchUsers(FetchManageUsers event, Emitter<ManageUsersState> emit) async {
    _currentFilters = event.params.copyWith(page: 1);
    _users = [];

    emit(ManageUsersLoading(filters: _currentFilters));
    final result = await repository.fetchUsers(_currentFilters);

    if (result is DataSuccess && result.data != null) {
      _users = result.data!.users;
      emit(ManageUsersLoaded(
        users: _users,
        filters: _currentFilters,
        hasMore: result.data!.hasMore,
        total: result.data!.total,
      ));
    } else {
      emit(ManageUsersFailed(result.error ?? 'خطا در دریافت لیست کاربران', filters: _currentFilters));
    }
  }

  Future<void> _onLoadMoreUsers(LoadMoreManageUsers event, Emitter<ManageUsersState> emit) async {
    final currentState = state;
    if (currentState is! ManageUsersLoaded || !currentState.hasMore) return;

    emit(ManageUsersLoadingMore(
      users: _users,
      filters: _currentFilters,
      hasMore: currentState.hasMore,
      total: currentState.total,
    ));

    _currentFilters = _currentFilters.copyWith(page: _currentFilters.page + 1);
    final result = await repository.fetchUsers(_currentFilters);

    if (result is DataSuccess && result.data != null) {
      _users = [..._users, ...result.data!.users];
      emit(ManageUsersLoaded(
        users: _users,
        filters: _currentFilters,
        hasMore: result.data!.hasMore,
        total: result.data!.total,
      ));
    } else {
      _currentFilters = _currentFilters.copyWith(page: _currentFilters.page - 1);
      emit(ManageUsersLoaded(
        users: _users,
        filters: _currentFilters,
        hasMore: currentState.hasMore,
        total: currentState.total,
        errorMessage: result.error,
      ));
    }
  }

  Future<void> _onChangeRepairmanStatus(ChangeRepairmanStatus event, Emitter<ManageUsersState> emit) async {
    final currentState = state;
    if (currentState is! ManageUsersLoaded) return;

    emit(currentState.copyWith(processingId: event.id, clearMessages: true));

    final result = await repository.changeRepairmanStatus(event.id);

    if (result is DataSuccess) {
      // Find the user and update status locally for immediate feedback
      final index = _users.indexWhere((u) => u.id == event.id);
      if (index != -1) {
        final user = _users[index];
        final newStatus = user.status == 'active' ? 'deactive' : 'active';
        _users[index] = UserEntity(
          id: user.id,
          firstName: user.firstName,
          lastName: user.lastName,
          mobile: user.mobile,
          role: user.role,
          status: newStatus,
          brand: user.brand,
        );
      }
      
      emit(ManageUsersLoaded(
        users: List.from(_users),
        filters: _currentFilters,
        hasMore: currentState.hasMore,
        total: currentState.total,
        successMessage: result.data,
      ));
    } else {
      emit(currentState.copyWith(
        errorMessage: result.error,
        clearProcessingId: true,
      ));
    }
  }

  Future<void> _onAddUser(AddUserEvent event, Emitter<ManageUsersState> emit) async {
    final currentState = state;
    
    if (currentState is ManageUsersLoaded) {
      emit(currentState.copyWith(isActionLoading: true, clearMessages: true));
    } else if (currentState is ManageUsersFailed) {
      emit(currentState.copyWith(isActionLoading: true));
    } else if (currentState is ManageUsersLoading) {
      emit(currentState.copyWith(isActionLoading: true));
    } else {
      // Just emit a generic loading state with isActionLoading
      emit(ManageUsersLoading(filters: currentState.filters, isActionLoading: true));
    }

    final result = await repository.addUser(event.userData);
    final nextState = state;

    if (result is DataSuccess) {
      if (nextState is ManageUsersLoaded) {
        emit(nextState.copyWith(isActionLoading: false, successMessage: result.data));
        add(FetchManageUsers(_currentFilters)); // Refresh the list
      } else {
        emit(ManageUsersLoaded(users: _users, filters: _currentFilters, successMessage: result.data, isActionLoading: false));
      }
    } else {
      if (nextState is ManageUsersLoaded) {
        emit(nextState.copyWith(isActionLoading: false, errorMessage: result.error));
      } else if (nextState is ManageUsersFailed) {
        emit(nextState.copyWith(isActionLoading: false, message: result.error ?? 'خطا در افزودن کاربر'));
      } else {
        emit(ManageUsersFailed(result.error ?? 'خطا در افزودن کاربر', filters: _currentFilters, isActionLoading: false));
      }
    }
  }

  void _onClearFilters(ClearManageUsersFilters event, Emitter<ManageUsersState> emit) {
    add(const FetchManageUsers(UsersFilterParams()));
  }
}
