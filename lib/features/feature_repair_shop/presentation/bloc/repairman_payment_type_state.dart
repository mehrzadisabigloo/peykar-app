part of 'repairman_payment_type_bloc.dart';

abstract class RepairmanPaymentTypeState extends Equatable {
  const RepairmanPaymentTypeState();

  @override
  List<Object?> get props => [];
}

class RepairmanPaymentTypeInitial extends RepairmanPaymentTypeState {}

class RepairmanPaymentTypeLoading extends RepairmanPaymentTypeState {}

class RepairmanPaymentTypeLoaded extends RepairmanPaymentTypeState {
  final List<PaymentTypeModel> myPaymentTypes;
  final List<PaymentTypeModel> allActivePaymentTypes;
  final String? successMessage;
  final String? errorMessage;
  final bool isActionLoading;
  final int? processingId;

  const RepairmanPaymentTypeLoaded({
    required this.myPaymentTypes,
    required this.allActivePaymentTypes,
    this.successMessage,
    this.errorMessage,
    this.isActionLoading = false,
    this.processingId,
  });

  RepairmanPaymentTypeLoaded copyWith({
    List<PaymentTypeModel>? myPaymentTypes,
    List<PaymentTypeModel>? allActivePaymentTypes,
    String? successMessage,
    String? errorMessage,
    bool? isActionLoading,
    int? processingId,
    bool clearProcessingId = false,
    bool clearMessages = false,
  }) {
    return RepairmanPaymentTypeLoaded(
      myPaymentTypes: myPaymentTypes ?? this.myPaymentTypes,
      allActivePaymentTypes: allActivePaymentTypes ?? this.allActivePaymentTypes,
      successMessage: clearMessages ? null : (successMessage ?? this.successMessage),
      errorMessage: clearMessages ? null : (errorMessage ?? this.errorMessage),
      isActionLoading: isActionLoading ?? this.isActionLoading,
      processingId: clearProcessingId ? null : (processingId ?? this.processingId),
    );
  }

  @override
  List<Object?> get props => [myPaymentTypes, allActivePaymentTypes, successMessage, errorMessage, isActionLoading, processingId];
}

class RepairmanPaymentTypeError extends RepairmanPaymentTypeState {
  final String message;
  const RepairmanPaymentTypeError(this.message);

  @override
  List<Object?> get props => [message];
}
