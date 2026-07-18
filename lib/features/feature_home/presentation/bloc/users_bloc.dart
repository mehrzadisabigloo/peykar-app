import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../../../core/resources/data_state.dart';
import '../../data/repository/home_repository_impl.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/entity/users_filter_params.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends BaseBloc<UsersEvent, UsersState> {
  final HomeRepositoryImpl homeRepository;

  UsersBloc(this.homeRepository) : super(const UsersInitial()) {
    on<FetchUsers>(_onFetchUsers);
    on<LoadMoreUsers>(_onLoadMoreUsers);
    on<ClearUsersFilters>(_onClearFilters);
  }

  UsersFilterParams _currentFilters = const UsersFilterParams();
  List<UserEntity> _users = [];

  Future<void> _onFetchUsers(FetchUsers event, Emitter<UsersState> emit) async {
    _currentFilters = event.params.copyWith(page: 1);
    _users = [];

    emit(UsersLoading(_currentFilters));
    final result = await homeRepository.fetchActiveUsers(_currentFilters);

    if (result is DataSuccess && result.data != null) {
      _users = result.data!.users;
      emit(UsersLoaded(
        users: _users,
        filters: _currentFilters,
        hasMore: result.data!.hasMore,
        total: result.data!.total,
      ));
    } else {
      emit(UsersFailed(result.error ?? 'خطا در دریافت لیست کاربران', _currentFilters));
    }
  }

  Future<void> _onLoadMoreUsers(LoadMoreUsers event, Emitter<UsersState> emit) async {
    final currentState = state;
    if (currentState is! UsersLoaded || !currentState.hasMore) return;

    emit(UsersLoadingMore(
      users: _users,
      filters: _currentFilters,
      hasMore: currentState.hasMore,
      total: currentState.total,
    ));

    _currentFilters = _currentFilters.copyWith(page: _currentFilters.page + 1);
    final result = await homeRepository.fetchActiveUsers(_currentFilters);

    if (result is DataSuccess && result.data != null) {
      _users = [..._users, ...result.data!.users];
      emit(UsersLoaded(
        users: _users,
        filters: _currentFilters,
        hasMore: result.data!.hasMore,
        total: result.data!.total,
      ));
    } else {
      _currentFilters = _currentFilters.copyWith(page: _currentFilters.page - 1);
      emit(UsersLoaded(
        users: _users,
        filters: _currentFilters,
        hasMore: currentState.hasMore,
        total: currentState.total,
        errorMessage: result.error,
      ));
    }
  }

  void _onClearFilters(ClearUsersFilters event, Emitter<UsersState> emit) {
    add(const FetchUsers(UsersFilterParams()));
  }
}
