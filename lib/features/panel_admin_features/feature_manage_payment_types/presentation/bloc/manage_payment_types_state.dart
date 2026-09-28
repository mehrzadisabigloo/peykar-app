part of 'manage_payment_types_bloc.dart';

abstract class ManagePaymentTypesState extends Equatable {
  final String? errorMessage;
  final String? successMessage;

  const ManagePaymentTypesState({this.errorMessage, this.successMessage});

  @override
  List<Object?> get props => [errorMessage, successMessage];
}

class ManagePaymentTypesInitial extends ManagePaymentTypesState {
  const ManagePaymentTypesInitial();
}

class ManagePaymentTypesLoading extends ManagePaymentTypesState {
  const ManagePaymentTypesLoading();
}

class PaymentTypesLoaded extends ManagePaymentTypesState {
  final List<PaymentTypeEntity> paymentTypes;
  final int? processingId;

  const PaymentTypesLoaded(
    this.paymentTypes, {
    this.processingId,
    super.errorMessage,
    super.successMessage,
  });

  @override
  List<Object?> get props => [...super.props, paymentTypes, processingId];

  PaymentTypesLoaded copyWith({
    List<PaymentTypeEntity>? paymentTypes,
    int? processingId,
    bool clearProcessingId = false,
    String? errorMessage,
    String? successMessage,
    bool clearMessages = false,
  }) {
    return PaymentTypesLoaded(
      paymentTypes ?? this.paymentTypes,
      processingId: processingId ?? (clearProcessingId ? null : this.processingId),
      errorMessage: errorMessage ?? (clearMessages ? null : this.errorMessage),
      successMessage: successMessage ?? (clearMessages ? null : this.successMessage),
    );
  }
}

class ManagePaymentTypesError extends ManagePaymentTypesState {
  final String message;
  const ManagePaymentTypesError(this.message) : super(errorMessage: message);

  @override
  List<Object?> get props => [...super.props, message];
}

class PaymentTypeActionSuccess extends ManagePaymentTypesState {
  final String message;
  const PaymentTypeActionSuccess(this.message) : super(successMessage: message);

  @override
  List<Object?> get props => [...super.props, message];
}
