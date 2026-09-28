import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/bloc/base/base_bloc.dart';
import '../../../../../../core/bloc/widget_infinite_list/widget_infinite_list_bloc.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../domain/entity/manage_rating_entity.dart';
import '../../domain/repository/manage_rating_repository.dart';

part 'manage_rating_event.dart';
part 'manage_rating_state.dart';

class ManageRatingBloc extends BaseBloc<ManageRatingEvent, ManageRatingState> {
  final ManageRatingRepository repository;
  final WidgetInfiniteListBloc listBloc = WidgetInfiniteListBloc();

  ManageRatingBloc(this.repository) : super(ManageRatingInitial()) {
    on<FetchManageRatings>(_onFetchManageRatings);
    on<LoadMoreManageRatings>(_onLoadMoreManageRatings);
    on<ChangeRatingStatus>(_onChangeRatingStatus);
    on<ClearRatingMessages>(_onClearRatingMessages);
  }

  @override
  Future<void> close() {
    listBloc.close();
    return super.close();
  }

  Future<void> _onFetchManageRatings(FetchManageRatings event, Emitter<ManageRatingState> emit) async {
    emit(ManageRatingLoading(status: event.status, page: 1));

    final dataState = await repository.fetchRatings(
      status: event.status,
      page: 1,
    );

    if (dataState is DataSuccess) {
      final listEntity = dataState.data!;
      emit(ManageRatingLoaded(
        ratings: listEntity.ratings,
        hasMore: listEntity.hasMore,
        status: event.status,
        page: 1,
      ));
    } else {
      emit(ManageRatingFailed(
        message: dataState.error ?? "خطا در دریافت لیست امتیازها",
        status: event.status,
        page: 1,
      ));
    }
  }

  Future<void> _onLoadMoreManageRatings(LoadMoreManageRatings event, Emitter<ManageRatingState> emit) async {
    final currentState = state;
    if (currentState is! ManageRatingLoaded || !currentState.hasMore) {
      listBloc.add(WidgetInfiniteListBlocEventHideBottomLoading());
      return;
    }

    emit(ManageRatingLoadingMore(
      ratings: currentState.ratings,
      hasMore: currentState.hasMore,
      status: currentState.status,
      page: currentState.page,
    ));

    final nextPage = currentState.page + 1;
    final dataState = await repository.fetchRatings(
      status: currentState.status,
      page: nextPage,
    );

    listBloc.add(WidgetInfiniteListBlocEventHideBottomLoading());

    if (dataState is DataSuccess) {
      final listEntity = dataState.data!;
      emit(ManageRatingLoaded(
        ratings: [...currentState.ratings, ...listEntity.ratings],
        hasMore: listEntity.hasMore,
        status: currentState.status,
        page: nextPage,
      ));
    } else {
      emit(currentState.copyWith(errorMessage: dataState.error));
    }
  }

  Future<void> _onChangeRatingStatus(ChangeRatingStatus event, Emitter<ManageRatingState> emit) async {
    final currentState = state;
    if (currentState is! ManageRatingLoaded) return;

    emit(currentState.copyWith(processingId: event.ratingId, clearMessages: true));

    final dataState = await repository.changeRatingStatus(event.ratingId);

    if (dataState is DataSuccess) {
      add(FetchManageRatings(status: currentState.status));
      emit(currentState.copyWith(
        successMessage: dataState.data,
        clearProcessingId: true,
      ));
    } else {
      emit(currentState.copyWith(
        errorMessage: dataState.error,
        clearProcessingId: true,
      ));
    }
  }

  void _onClearRatingMessages(ClearRatingMessages event, Emitter<ManageRatingState> emit) {
    if (state is ManageRatingLoaded) {
      emit((state as ManageRatingLoaded).copyWith(clearMessages: true));
    }
  }
}
