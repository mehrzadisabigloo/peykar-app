import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/bloc/base/base_bloc.dart';
import '../../domain/entity/manage_service_entity.dart';
import '../../domain/repository/manage_service_repository.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/bloc/widget_infinite_list/widget_infinite_list_bloc.dart';

part 'manage_service_event.dart';
part 'manage_service_state.dart';

class ManageServiceBloc extends BaseBloc<ManageServiceEvent, ManageServiceState> {
  final ManageServiceRepository _repository;
  final WidgetInfiniteListBloc listBloc;
  final int _countItem = 10;

  ManageServiceBloc(this._repository, this.listBloc) : super(const ManageServiceInitial()) {
    on<FetchManageServices>(_onFetchManageServices);
    on<LoadMoreManageServices>(_onLoadMoreManageServices);
    on<ChangeServiceStatus>(_onChangeServiceStatus);
    on<DeleteService>(_onDeleteService);
  }

  Future<void> _onFetchManageServices(FetchManageServices event, Emitter<ManageServiceState> emit) async {
    emit(ManageServiceLoading(
      services: event.isRefresh ? [] : state.services,
      page: event.isRefresh ? 1 : state.page,
      hasMore: event.isRefresh ? true : state.hasMore,
    ));

    final result = await _repository.listServices(
      isPaginate: true,
      countItem: _countItem,
      title: event.title,
      repairmanId: event.repairmanId,
    );

    if (result is DataSuccess) {
      final services = result.data ?? [];
      emit(ManageServiceLoaded(
        services: services,
        page: 1,
        hasMore: services.length >= _countItem,
      ));
    } else {
      emit(ManageServiceFailed(result.error ?? 'خطا در بارگذاری اطلاعات'));
    }
  }

  Future<void> _onLoadMoreManageServices(LoadMoreManageServices event, Emitter<ManageServiceState> emit) async {
    if (!state.hasMore || state is ManageServiceLoading) return;

    emit(ManageServiceLoaded(
      services: state.services,
      page: state.page,
      hasMore: state.hasMore,
    ));

    final nextPage = state.page + 1;
    
    final result = await _repository.listServices(
      isPaginate: true,
      countItem: _countItem * nextPage,
    );
    
    listBloc.add(WidgetInfiniteListBlocEventHideBottomLoading());

    if (result is DataSuccess) {
      final services = result.data ?? [];
      emit(ManageServiceLoaded(
        services: services,
        page: nextPage,
        hasMore: services.length >= (_countItem * nextPage),
      ));
    } else {
      emit(ManageServiceLoaded(
        services: state.services,
        page: state.page,
        hasMore: state.hasMore,
        errorMessage: result.error,
      ));
    }
  }

  Future<void> _onChangeServiceStatus(ChangeServiceStatus event, Emitter<ManageServiceState> emit) async {
    emit(ManageServiceLoaded(
      services: state.services,
      page: state.page,
      hasMore: state.hasMore,
      processingId: event.serviceId,
      isDeleting: false,
    ));

    final result = await _repository.changeStatus(
      serviceId: event.serviceId,
      status: event.status,
    );

    if (result is DataSuccess) {
      final updatedServices = state.services.map((s) {
        if (s.id == event.serviceId) {
          return ManageServiceEntity(
            id: s.id,
            title: s.title,
            description: s.description,
            images: s.images,
            keywords: s.keywords,
            priceMin: s.priceMin,
            priceMax: s.priceMax,
            status: event.status,
            createdAt: s.createdAt,
            updatedAt: DateTime.now(),
            occupation: s.occupation,
          );
        }
        return s;
      }).toList();

      emit(ManageServiceLoaded(
        services: updatedServices,
        page: state.page,
        hasMore: state.hasMore,
        successMessage: 'وضعیت سرویس با موفقیت تغییر کرد',
      ));
    } else {
      emit(ManageServiceLoaded(
        services: state.services,
        page: state.page,
        hasMore: state.hasMore,
        errorMessage: result.error ?? 'خطا در تغییر وضعیت',
      ));
    }
  }

  Future<void> _onDeleteService(DeleteService event, Emitter<ManageServiceState> emit) async {
    emit(ManageServiceLoaded(
      services: state.services,
      page: state.page,
      hasMore: state.hasMore,
      processingId: event.serviceId,
      isDeleting: true,
    ));

    final result = await _repository.deleteService(event.serviceId);

    if (result is DataSuccess) {
      final updatedServices = state.services.where((s) => s.id != event.serviceId).toList();
      emit(ManageServiceLoaded(
        services: updatedServices,
        page: state.page,
        hasMore: state.hasMore,
        successMessage: 'سرویس با موفقیت حذف شد',
      ));
    } else {
      emit(ManageServiceLoaded(
        services: state.services,
        page: state.page,
        hasMore: state.hasMore,
        errorMessage: result.error ?? 'خطا در حذف سرویس',
      ));
    }
  }
}
