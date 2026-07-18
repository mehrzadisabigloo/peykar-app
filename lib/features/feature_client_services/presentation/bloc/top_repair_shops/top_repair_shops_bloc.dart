import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/bloc/base/base_bloc.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../feature_home/domain/entity/user_entity.dart';
import '../../../domain/repository/client_services_repository.dart';

part 'top_repair_shops_event.dart';
part 'top_repair_shops_state.dart';

class TopRepairShopsBloc extends BaseBloc<TopRepairShopsEvent, TopRepairShopsState> {
  final ClientServicesRepository clientServicesRepository;
  int _currentPage = 1;
  static const int _pageSize = 10;

  TopRepairShopsBloc(this.clientServicesRepository) : super(const TopRepairShopsInitial()) {
    on<FetchTopRepairShopsEvent>(_onFetchTopRepairShops);
    on<LoadMoreTopRepairShopsEvent>(_onLoadMoreTopRepairShops);
  }

  Future<void> _onFetchTopRepairShops(FetchTopRepairShopsEvent event, Emitter<TopRepairShopsState> emit) async {
    if (event.isRefresh) {
      _currentPage = 1;
    }
    
    emit(const TopRepairShopsLoading());
    
    final dataState = await clientServicesRepository.fetchTopRepairShops(
      page: _currentPage,
      countItem: _pageSize,
    );

    if (dataState is DataSuccess) {
      final shops = dataState.data ?? [];
      emit(TopRepairShopsLoaded(
        shops: shops,
        hasReachedMax: shops.length < _pageSize,
      ));
    } else {
      emit(TopRepairShopsError(dataState.error ?? "خطا در دریافت لیست تعمیرگاه‌های برتر"));
    }
  }

  Future<void> _onLoadMoreTopRepairShops(LoadMoreTopRepairShopsEvent event, Emitter<TopRepairShopsState> emit) async {
    final currentState = state;
    if (currentState is TopRepairShopsLoaded && !currentState.hasReachedMax && !currentState.isLoadingMore) {
      emit(currentState.copyWith(isLoadingMore: true));
      
      _currentPage++;
      final dataState = await clientServicesRepository.fetchTopRepairShops(
        page: _currentPage,
        countItem: _pageSize,
      );

      if (dataState is DataSuccess) {
        final newShops = dataState.data ?? [];
        emit(currentState.copyWith(
          shops: List.of(currentState.shops)..addAll(newShops),
          hasReachedMax: newShops.length < _pageSize,
          isLoadingMore: false,
        ));
      } else {
        emit(currentState.copyWith(isLoadingMore: false));
      }
    }
  }
}
