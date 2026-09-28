import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../feature_create_time_slot/data/model/time_slot_model.dart';
import '../../domain/entity/repair_shop_entity.dart';
import '../../domain/repository/repair_shop_repository.dart';
import '../../../../core/resources/data_state.dart';
import '../../data/model/rating_model.dart';

part 'repair_shop_event.dart';
part 'repair_shop_state.dart';

class RepairShopBloc extends BaseBloc<RepairShopEvent, RepairShopState> {
  final RepairShopRepository repairShopRepository;

  RepairShopBloc(this.repairShopRepository) : super(const RepairShopState()) {
    on<FetchRepairShopDataEvent>(_onFetchRepairShopData);
    on<FetchPublicTimeSlotsEvent>(_onFetchPublicTimeSlots);
    on<SubmitReservationEvent>(_onSubmitReservation);
    on<SubmitRatingEvent>(_onSubmitRating);
    on<FetchRepairmanRatingsEvent>(_onFetchRepairmanRatings);
  }

  Future<void> _onFetchRepairShopData(FetchRepairShopDataEvent event, Emitter<RepairShopState> emit) async {
    emit(state.copyWith(repairShopStatus: RepairShopStatus.loading));
    final dataState = await repairShopRepository.fetchRepairShopData(event.repairmanId);

    if (dataState is DataSuccess) {
      emit(state.copyWith(
        repairShopStatus: RepairShopStatus.loaded,
        repairShop: dataState.data,
      ));
    } else {
      emit(state.copyWith(
        repairShopStatus: RepairShopStatus.error,
        repairShopError: dataState.error ?? "خطا در دریافت اطلاعات تعمیرگاه",
      ));
    }
  }

  Future<void> _onFetchPublicTimeSlots(FetchPublicTimeSlotsEvent event, Emitter<RepairShopState> emit) async {
    emit(state.copyWith(timeSlotsStatus: TimeSlotsStatus.loading));
    final dataState = await repairShopRepository.fetchPublicTimeSlots(event.repairmanId, date: event.date);

    if (dataState is DataSuccess) {
      emit(state.copyWith(
        timeSlotsStatus: TimeSlotsStatus.loaded,
        timeSlots: dataState.data ?? [],
      ));
    } else {
      emit(state.copyWith(
        timeSlotsStatus: TimeSlotsStatus.error,
        timeSlotsError: dataState.error ?? "خطا در دریافت زمان‌های آزاد",
      ));
    }
  }

  Future<void> _onSubmitReservation(SubmitReservationEvent event, Emitter<RepairShopState> emit) async {
    emit(state.copyWith(reservationStatus: ReservationStatus.submitting));
    final dataState = await repairShopRepository.reserveTimeSlot(event.timeSlotId, event.description);

    if (dataState is DataSuccess) {
      emit(state.copyWith(
        reservationStatus: ReservationStatus.success,
        reservationData: dataState.data,
      ));
    } else {
      emit(state.copyWith(
        reservationStatus: ReservationStatus.error,
        reservationError: dataState.error ?? "خطا در ثبت رزرو",
      ));
    }
  }

  Future<void> _onSubmitRating(SubmitRatingEvent event, Emitter<RepairShopState> emit) async {
    emit(state.copyWith(ratingSubmitStatus: RatingSubmitStatus.submitting));
    final dataState = await repairShopRepository.storeRating(event.repairmanId, event.score, event.description);

    if (dataState is DataSuccess) {
      emit(state.copyWith(
        ratingSubmitStatus: RatingSubmitStatus.success,
        ratingSubmitMessage: dataState.data!['message'] ?? "امتیاز شما با موفقیت ثبت شد",
      ));
    } else {
      emit(state.copyWith(
        ratingSubmitStatus: RatingSubmitStatus.error,
        ratingSubmitError: dataState.error ?? "خطا در ثبت امتیاز",
      ));
    }
  }

  Future<void> _onFetchRepairmanRatings(FetchRepairmanRatingsEvent event, Emitter<RepairShopState> emit) async {
    emit(state.copyWith(ratingsStatus: RatingsStatus.loading));
    final dataState = await repairShopRepository.fetchRepairmanRatings(event.repairmanId, page: event.page);

    if (dataState is DataSuccess) {
      emit(state.copyWith(
        ratingsStatus: RatingsStatus.loaded,
        ratings: dataState.data ?? [],
      ));
    } else {
      emit(state.copyWith(
        ratingsStatus: RatingsStatus.error,
        ratingsError: dataState.error ?? "خطا در دریافت لیست امتیازها",
      ));
    }
  }
}
