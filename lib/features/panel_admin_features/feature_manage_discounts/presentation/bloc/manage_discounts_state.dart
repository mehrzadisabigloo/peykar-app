part of 'manage_discounts_bloc.dart';

abstract class ManageDiscountsState extends Equatable {
  const ManageDiscountsState();

  @override
  List<Object?> get props => [];
}

class ManageDiscountsInitial extends ManageDiscountsState {
  const ManageDiscountsInitial();
}

class ManageDiscountsLoading extends ManageDiscountsState {
  const ManageDiscountsLoading();
}

class ManageDiscountsLoaded extends ManageDiscountsState {
  final List<DiscountModel> discounts;
  final String? processingId;
  final bool isDeleting;
  final String? errorMessage;
  final String? successMessage;

  const ManageDiscountsLoaded(
    this.discounts, {
    this.processingId,
    this.isDeleting = false,
    this.errorMessage,
    this.successMessage,
  });

  ManageDiscountsLoaded copyWith({
    List<DiscountModel>? discounts,
    String? processingId,
    bool? isDeleting,
    String? errorMessage,
    String? successMessage,
    bool clearMessages = false,
  }) {
    return ManageDiscountsLoaded(
      discounts ?? this.discounts,
      processingId: processingId ?? this.processingId,
      isDeleting: isDeleting ?? this.isDeleting,
      errorMessage: errorMessage ?? (clearMessages ? null : this.errorMessage),
      successMessage: successMessage ?? (clearMessages ? null : this.successMessage),
    );
  }

  @override
  List<Object?> get props => [discounts, processingId, isDeleting, errorMessage, successMessage];
}

class ManageDiscountsError extends ManageDiscountsState {
  final String message;
  const ManageDiscountsError(this.message);

  @override
  List<Object?> get props => [message];
}
