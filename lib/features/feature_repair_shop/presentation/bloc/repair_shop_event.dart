part of 'repair_shop_bloc.dart';


abstract class RepairShopEvent extends Equatable {
  const RepairShopEvent();

  @override
  List<Object?> get props => [];
}

class FetchRepairShopDataEvent extends RepairShopEvent {
  final String repairmanId;
  const FetchRepairShopDataEvent(this.repairmanId);

  @override
  List<Object?> get props => [repairmanId];
}

class FetchPublicTimeSlotsEvent extends RepairShopEvent {
  final String repairmanId;
  final String? date;
  const FetchPublicTimeSlotsEvent(this.repairmanId, {this.date});

  @override
  List<Object?> get props => [repairmanId, date];
}

class SubmitReservationEvent extends RepairShopEvent {
  final String timeSlotId;
  final String description;
  const SubmitReservationEvent(this.timeSlotId, this.description);

  @override
  List<Object?> get props => [timeSlotId, description];
}

class SubmitRatingEvent extends RepairShopEvent {
  final String repairmanId;
  final int score;
  final String description;

  const SubmitRatingEvent({
    required this.repairmanId,
    required this.score,
    required this.description,
  });

  @override
  List<Object?> get props => [repairmanId, score, description];
}

class FetchRepairmanRatingsEvent extends RepairShopEvent {
  final String repairmanId;
  final int page;
  const FetchRepairmanRatingsEvent(this.repairmanId, {this.page = 1});

  @override
  List<Object?> get props => [repairmanId, page];
}
