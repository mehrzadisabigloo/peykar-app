part of 'appointments_bloc.dart';

abstract class AppointmentsState extends Equatable {
  const AppointmentsState();

  @override
  List<Object?> get props => [];
}

class AppointmentsInitial extends AppointmentsState {
  const AppointmentsInitial();
}

class AppointmentsLoading extends AppointmentsState {
  const AppointmentsLoading();
}

class AppointmentsLoaded extends AppointmentsState {
  final List<AppointmentsEntity> appointments;
  final String currentDate;
  final DateTime? selectedDateTime;
  final bool showDatePicker;
  final String? processingAppointmentId;
  final String? processingAction;
  final String? errorToastMessage;
  final bool hasMore;
  final int currentPage;

  const AppointmentsLoaded({
    required this.appointments,
    required this.currentDate,
    this.selectedDateTime,
    this.showDatePicker = false,
    this.processingAppointmentId,
    this.processingAction,
    this.errorToastMessage,
    this.hasMore = false,
    this.currentPage = 1,
  });

  @override
  List<Object?> get props => [
        appointments,
        currentDate,
        selectedDateTime,
        showDatePicker,
        processingAppointmentId,
        processingAction,
        errorToastMessage,
        hasMore,
        currentPage,
      ];

  AppointmentsLoaded copyWith({
    List<AppointmentsEntity>? appointments,
    String? currentDate,
    DateTime? selectedDateTime,
    bool? showDatePicker,
    String? processingAppointmentId,
    String? processingAction,
    String? errorToastMessage,
    bool clearProcessingId = false,
    bool clearErrorToast = false,
    bool? hasMore,
    int? currentPage,
  }) {
    return AppointmentsLoaded(
      appointments: appointments ?? this.appointments,
      currentDate: currentDate ?? this.currentDate,
      selectedDateTime: selectedDateTime ?? this.selectedDateTime,
      showDatePicker: showDatePicker ?? this.showDatePicker,
      processingAppointmentId: clearProcessingId ? null : (processingAppointmentId ?? this.processingAppointmentId),
      processingAction: clearProcessingId ? null : (processingAction ?? this.processingAction),
      errorToastMessage: clearErrorToast ? null : (errorToastMessage ?? this.errorToastMessage),
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

class AppointmentsLoadingMore extends AppointmentsState {
  final List<AppointmentsEntity> appointments;
  final String currentDate;
  final bool hasMore;
  final int currentPage;

  const AppointmentsLoadingMore({
    required this.appointments,
    required this.currentDate,
    required this.hasMore,
    required this.currentPage,
  });

  @override
  List<Object?> get props => [appointments, currentDate, hasMore, currentPage];
}

class AppointmentsError extends AppointmentsState {
  final String message;
  const AppointmentsError(this.message);

  @override
  List<Object?> get props => [message];
}

class RatingSubmitting extends AppointmentsState {
  const RatingSubmitting();
}

class RatingSuccess extends AppointmentsState {
  final String message;
  const RatingSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class RatingError extends AppointmentsState {
  final String message;
  const RatingError(this.message);

  @override
  List<Object?> get props => [message];
}
