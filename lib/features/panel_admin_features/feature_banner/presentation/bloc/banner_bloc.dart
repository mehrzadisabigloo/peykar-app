import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/bloc/base/base_bloc.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/bloc/widget_infinite_list/widget_infinite_list_bloc.dart';
import '../../domain/entity/banner_entity.dart';
import '../../domain/repository/banner_repository.dart';
import 'banner_event.dart';
import 'banner_state.dart';

class BannerBloc extends BaseBloc<BannerEvent, BannerState> {
  final BannerRepository _repository;
  final WidgetInfiniteListBloc listBloc;
  final int _countItem = 10;

  BannerBloc(this._repository, this.listBloc) : super(const BannerInitial()) {
    on<FetchBannersEvent>(_onFetchBanners);
    on<LoadMoreBannersEvent>(_onLoadMoreBanners);
    on<AddBannerEvent>(_onAddBanner);
    on<EditBannerEvent>(_onEditBanner);
    on<DeleteBannerEvent>(_onDeleteBanner);
    on<ChangeBannerStatusEvent>(_onChangeStatus);
  }

  Future<void> _onFetchBanners(FetchBannersEvent event, Emitter<BannerState> emit) async {
    emit(BannerLoading(
      banners: event.isRefresh ? [] : state.banners,
      page: event.isRefresh ? 1 : state.page,
      hasMore: event.isRefresh ? true : state.hasMore,
      place: event.place,
    ));

    final params = BannerFilterParams(
      place: event.place,
      isPaginate: true,
      countItem: _countItem,
      page: 1,
    );

    final dataState = await _repository.fetchBanners(params);

    if (dataState is DataSuccess) {
      final bannerList = dataState.data!;
      emit(BannerLoaded(
        banners: bannerList.banners,
        page: 1,
        hasMore: bannerList.hasMore,
        place: event.place,
      ));
    } else {
      emit(BannerFailed(dataState.error ?? "خطا در دریافت بنرها"));
    }
  }

  Future<void> _onLoadMoreBanners(LoadMoreBannersEvent event, Emitter<BannerState> emit) async {
    if (!state.hasMore || state is BannerLoading) return;

    emit(state.copyWith(clearMessages: true));

    final nextPage = state.page + 1;
    final place = event.place ?? state.place;

    final params = BannerFilterParams(
      place: place,
      isPaginate: true,
      countItem: _countItem,
      page: nextPage,
    );

    final dataState = await _repository.fetchBanners(params);
    
    listBloc.add(WidgetInfiniteListBlocEventHideBottomLoading());

    if (dataState is DataSuccess) {
      final bannerList = dataState.data!;
      emit(BannerLoaded(
        banners: [...state.banners, ...bannerList.banners],
        page: nextPage,
        hasMore: bannerList.hasMore,
        place: place,
      ));
    } else {
      emit(state.copyWith(
        errorMessage: dataState.error ?? "خطا در بارگذاری بیشتر",
        clearMessages: false, // We want to show the error
      ));
    }
  }

  Future<void> _onAddBanner(AddBannerEvent event, Emitter<BannerState> emit) async {
    emit(state.copyWith(
      processingId: 'adding',
      clearMessages: true,
    ));

    final dataState = await _repository.addBanner(event.params);
    if (dataState is DataSuccess) {
      add(const FetchBannersEvent(isRefresh: true));
      emit(state.copyWith(
        successMessage: "بنر با موفقیت اضافه شد",
        clearProcessingId: true,
      ));
    } else {
      emit(state.copyWith(
        errorMessage: dataState.error ?? "خطا در افزودن بنر",
        clearProcessingId: true,
      ));
    }
  }

  Future<void> _onEditBanner(EditBannerEvent event, Emitter<BannerState> emit) async {
    emit(state.copyWith(
      processingId: event.id,
      clearMessages: true,
    ));

    final dataState = await _repository.editBanner(event.id, event.params);
    if (dataState is DataSuccess) {
      add(const FetchBannersEvent(isRefresh: true));
      emit(state.copyWith(
        successMessage: "بنر با موفقیت ویرایش شد",
        clearProcessingId: true,
      ));
    } else {
      emit(state.copyWith(
        errorMessage: dataState.error ?? "خطا در ویرایش بنر",
        clearProcessingId: true,
      ));
    }
  }

  Future<void> _onDeleteBanner(DeleteBannerEvent event, Emitter<BannerState> emit) async {
    emit(state.copyWith(
      processingId: event.id,
      isDeleting: true,
      clearMessages: true,
    ));

    final dataState = await _repository.deleteBanner(event.id);
    if (dataState is DataSuccess) {
      final updatedBanners = state.banners.where((b) => b.id != event.id).toList();
      emit(BannerLoaded(
        banners: updatedBanners,
        page: state.page,
        hasMore: state.hasMore,
        successMessage: "بنر با موفقیت حذف شد",
        place: state.place,
      ));
    } else {
      emit(state.copyWith(
        errorMessage: dataState.error ?? "خطا در حذف بنر",
        clearProcessingId: true,
      ));
    }
  }

  Future<void> _onChangeStatus(ChangeBannerStatusEvent event, Emitter<BannerState> emit) async {
    emit(state.copyWith(
      processingId: event.id,
      clearMessages: true,
    ));

    final dataState = await _repository.changeStatus(event.id);
    if (dataState is DataSuccess) {
      final updatedBanners = state.banners.map((b) {
        if (b.id == event.id) {
          return dataState.data!;
        }
        return b;
      }).toList();

      emit(BannerLoaded(
        banners: updatedBanners,
        page: state.page,
        hasMore: state.hasMore,
        successMessage: "وضعیت بنر با موفقیت تغییر یافت",
        place: state.place,
      ));
    } else {
      emit(state.copyWith(
        errorMessage: dataState.error ?? "خطا در تغییر وضعیت",
        clearProcessingId: true,
      ));
    }
  }
}
