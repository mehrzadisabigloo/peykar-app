import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../domain/repository/dashboard_repository.dart';
import '../../../../core/resources/data_state.dart';
import '../../../panel_admin_features/feature_banner/domain/repository/banner_repository.dart';
import '../../../panel_admin_features/feature_banner/domain/entity/banner_entity.dart';
import '../../../panel_admin_features/feature_banner/domain/entity/banner_list_entity.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends BaseBloc<DashboardEvent, DashboardState> {
  final DashboardRepository dashboardRepository;
  final BannerRepository bannerRepository;

  DashboardBloc(this.dashboardRepository, this.bannerRepository) : super(const DashboardInitial()) {
    on<FetchDashboardDataEvent>(_onFetchDashboardData);
  }

  Future<void> _onFetchDashboardData(FetchDashboardDataEvent event, Emitter<DashboardState> emit) async {
    emit(const DashboardLoading());
    
    // Parallel fetch
    final responses = await Future.wait([
      dashboardRepository.fetchDashboardData(),
      bannerRepository.fetchActiveBanners(const BannerFilterParams(place: 'service_provider', isPaginate: false)),
    ]);

    final dashboardResult = responses[0] as DataState;
    final bannerResult = responses[1] as DataState<BannerListEntity>;

    if (dashboardResult is DataSuccess) {
      List<BannerEntity> banners = [];
      if (bannerResult is DataSuccess) {
        banners = bannerResult.data!.banners;
      }
      emit(DashboardLoaded(banners: banners));
    } else {
      emit(DashboardError(dashboardResult.error ?? "خطا در دریافت اطلاعات"));
    }
  }
}
