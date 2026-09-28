
part of 'create_time_slot_bloc.dart';

abstract class CreateTimeSlotState extends Equatable {
  const CreateTimeSlotState();
  @override
  List<Object?> get props => [];
}

class CreateTimeSlotInitial extends CreateTimeSlotState {
  final Jalali selectedDate;
  final List<TimeSlotEntity> remoteSlots;
  final bool isLoading;
  final String? error;
  final bool isFetchError;
  final String? successMessage;
  final bool showCalendar;
  final int currentPage;
  final bool hasNextPage;
  final bool isDeleting;
  final String? deletingSlotId;

  const CreateTimeSlotInitial({
    required this.selectedDate,
    this.remoteSlots = const [],
    this.isLoading = false,
    this.error,
    this.isFetchError = false,
    this.successMessage,
    this.showCalendar = false,
    this.currentPage = 1,
    this.hasNextPage = false,
    this.isDeleting = false,
    this.deletingSlotId,
  });

  @override
  List<Object?> get props => [
        selectedDate,
        remoteSlots,
        isLoading,
        error,
        isFetchError,
        successMessage,
        showCalendar,
        currentPage,
        hasNextPage,
        isDeleting,
        deletingSlotId,
      ];

  CreateTimeSlotInitial copyWith({
    Jalali? selectedDate,
    List<TimeSlotEntity>? remoteSlots,
    bool? isLoading,
    String? error,
    bool? isFetchError,
    String? successMessage,
    bool? showCalendar,
    int? currentPage,
    bool? hasNextPage,
    bool? isDeleting,
    String? deletingSlotId,
    bool clearStatus = false,
  }) {
    return CreateTimeSlotInitial(
      selectedDate: selectedDate ?? this.selectedDate,
      remoteSlots: remoteSlots ?? this.remoteSlots,
      isLoading: isLoading ?? this.isLoading,
      error: clearStatus ? null : (error ?? this.error),
      isFetchError: clearStatus ? false : (isFetchError ?? this.isFetchError),
      successMessage: clearStatus ? null : (successMessage ?? this.successMessage),
      showCalendar: showCalendar ?? this.showCalendar,
      currentPage: currentPage ?? this.currentPage,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      isDeleting: isDeleting ?? this.isDeleting,
      deletingSlotId: deletingSlotId ?? this.deletingSlotId,
    );
  }
}
