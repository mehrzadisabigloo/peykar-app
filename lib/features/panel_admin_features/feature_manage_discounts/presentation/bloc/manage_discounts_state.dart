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
  const ManageDiscountsLoaded(this.discounts, {this.processingId});

  @override
  List<Object?> get props => [discounts, processingId];
}

class ManageDiscountsError extends ManageDiscountsState {
  final String message;
  const ManageDiscountsError(this.message);

  @override
  List<Object?> get props => [message];
}
