
part of 'repair_shop_bloc.dart';

enum RepairShopStatus { initial, loading, loaded, error }
enum RatingsStatus { initial, loading, loaded, error }
enum TimeSlotsStatus { initial, loading, loaded, error }
enum ReservationStatus { initial, submitting, success, error }
enum RatingSubmitStatus { initial, submitting, success, error }

class RepairShopState extends Equatable {
  final RepairShopStatus repairShopStatus;
  final RepairShopEntity? repairShop;
  final String? repairShopError;

  final RatingsStatus ratingsStatus;
  final List<RatingModel> ratings;
  final String? ratingsError;

  final TimeSlotsStatus timeSlotsStatus;
  final List<TimeSlotModel> timeSlots;
  final String? timeSlotsError;

  final ReservationStatus reservationStatus;
  final Map<String, dynamic>? reservationData;
  final String? reservationError;

  final RatingSubmitStatus ratingSubmitStatus;
  final String? ratingSubmitMessage;
  final String? ratingSubmitError;

  const RepairShopState({
    this.repairShopStatus = RepairShopStatus.initial,
    this.repairShop,
    this.repairShopError,
    this.ratingsStatus = RatingsStatus.initial,
    this.ratings = const [],
    this.ratingsError,
    this.timeSlotsStatus = TimeSlotsStatus.initial,
    this.timeSlots = const [],
    this.timeSlotsError,
    this.reservationStatus = ReservationStatus.initial,
    this.reservationData,
    this.reservationError,
    this.ratingSubmitStatus = RatingSubmitStatus.initial,
    this.ratingSubmitMessage,
    this.ratingSubmitError,
  });

  RepairShopState copyWith({
    RepairShopStatus? repairShopStatus,
    RepairShopEntity? repairShop,
    String? repairShopError,
    RatingsStatus? ratingsStatus,
    List<RatingModel>? ratings,
    String? ratingsError,
    TimeSlotsStatus? timeSlotsStatus,
    List<TimeSlotModel>? timeSlots,
    String? timeSlotsError,
    ReservationStatus? reservationStatus,
    Map<String, dynamic>? reservationData,
    String? reservationError,
    RatingSubmitStatus? ratingSubmitStatus,
    String? ratingSubmitMessage,
    String? ratingSubmitError,
  }) {
    return RepairShopState(
      repairShopStatus: repairShopStatus ?? this.repairShopStatus,
      repairShop: repairShop ?? this.repairShop,
      repairShopError: repairShopError ?? this.repairShopError,
      ratingsStatus: ratingsStatus ?? this.ratingsStatus,
      ratings: ratings ?? this.ratings,
      ratingsError: ratingsError ?? this.ratingsError,
      timeSlotsStatus: timeSlotsStatus ?? this.timeSlotsStatus,
      timeSlots: timeSlots ?? this.timeSlots,
      timeSlotsError: timeSlotsError ?? this.timeSlotsError,
      reservationStatus: reservationStatus ?? this.reservationStatus,
      reservationData: reservationData ?? this.reservationData,
      reservationError: reservationError ?? this.reservationError,
      ratingSubmitStatus: ratingSubmitStatus ?? this.ratingSubmitStatus,
      ratingSubmitMessage: ratingSubmitMessage ?? this.ratingSubmitMessage,
      ratingSubmitError: ratingSubmitError ?? this.ratingSubmitError,
    );
  }

  @override
  List<Object?> get props => [
    repairShopStatus,
    repairShop,
    repairShopError,
    ratingsStatus,
    ratings,
    ratingsError,
    timeSlotsStatus,
    timeSlots,
    timeSlotsError,
    reservationStatus,
    reservationData,
    reservationError,
    ratingSubmitStatus,
    ratingSubmitMessage,
    ratingSubmitError,
  ];
}
