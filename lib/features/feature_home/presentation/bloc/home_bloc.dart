import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../../../core/resources/data_state.dart';
import '../../../panel_admin_features/feature_occupation/domain/repository/occupation_repository.dart';
import '../../../panel_admin_features/feature_occupation/domain/entity/occupation_entity.dart';
import '../../../panel_admin_features/feature_occupation/domain/entity/occupation_list_entity.dart';
import '../../../../core/bloc/widget_infinite_list/widget_infinite_list_bloc.dart';
import '../../../panel_admin_features/feature_banner/domain/repository/banner_repository.dart';
import '../../../panel_admin_features/feature_banner/domain/entity/banner_entity.dart';
import '../../../panel_admin_features/feature_banner/domain/entity/banner_list_entity.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  final OccupationRepository occupationRepository;
  final BannerRepository bannerRepository;
  final WidgetInfiniteListBloc listBloc;

  HomeBloc(this.occupationRepository, this.bannerRepository, this.listBloc) : super(HomeInitial()) {
    on<FetchHomeDataEvent>(_onFetchHomeData);
    on<LoadMoreHomeDataEvent>(_onLoadMoreHomeData);
  }

  OccupationFilterParams _currentParams = const OccupationFilterParams(isPaginate: true, countItem: 10, page: 1);
  List<OccupationEntity> _occupations = [];
  List<BannerEntity> _banners = [];

  Future<void> _onFetchHomeData(FetchHomeDataEvent event, Emitter<HomeState> emit) async {
    _currentParams = const OccupationFilterParams(isPaginate: true, countItem: 10, page: 1);
    _occupations = [];
    _banners = [];
    
    emit(HomeLoading());

    String place = 'customer';
    if (event.role == 'repairman' || event.role == 'service_provider') {
      place = 'service_provider';
    }
    
    // Parallel fetch
    final responses = await Future.wait([
      occupationRepository.fetchActiveOccupations(_currentParams),
      bannerRepository.fetchActiveBanners(BannerFilterParams(place: place, isPaginate: false)),
    ]);

    final occupationState = responses[0] as DataState<OccupationListEntity>;
    final bannerState = responses[1] as DataState<BannerListEntity>;

    if (bannerState is DataSuccess) {
      _banners = bannerState.data!.banners;
    }

    if (occupationState is DataSuccess) {
      final listEntity = occupationState.data!;
      _occupations = listEntity.occupations;
      emit(HomeLoaded(
        occupations: _occupations,
        banners: _banners,
        hasMore: listEntity.hasMore,
        total: listEntity.total,
        page: listEntity.currentPage,
      ));
    } else {
      emit(HomeError(occupationState.error ?? "خطا در دریافت اطلاعات صفحه اصلی"));
    }
  }

  Future<void> _onLoadMoreHomeData(LoadMoreHomeDataEvent event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is! HomeLoaded || !currentState.hasMore) return;

    emit(HomeLoadingMore(
      occupations: _occupations,
      banners: _banners,
      hasMore: currentState.hasMore,
      total: currentState.total,
      page: currentState.page,
    ));

    _currentParams = OccupationFilterParams(
      isPaginate: true,
      countItem: _currentParams.countItem,
      page: _currentParams.page + 1,
    );

    final dataState = await occupationRepository.fetchActiveOccupations(_currentParams);
    listBloc.add(WidgetInfiniteListBlocEventHideBottomLoading());

    if (dataState is DataSuccess) {
      final listEntity = dataState.data as OccupationListEntity;
      _occupations = [..._occupations, ...listEntity.occupations];
      emit(HomeLoaded(
        occupations: _occupations,
        banners: _banners,
        hasMore: listEntity.hasMore,
        total: listEntity.total,
        page: listEntity.currentPage,
      ));
    } else {
      _currentParams = OccupationFilterParams(
        isPaginate: true,
        countItem: _currentParams.countItem,
        page: _currentParams.page - 1,
      );
      emit(HomeLoaded(
        occupations: _occupations,
        banners: _banners,
        hasMore: currentState.hasMore,
        total: currentState.total,
        page: currentState.page,
        errorMessage: dataState.error,
      ));
    }
  }
}
