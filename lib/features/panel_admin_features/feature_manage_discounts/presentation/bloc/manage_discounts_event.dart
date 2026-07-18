part of 'manage_discounts_bloc.dart';

abstract class ManageDiscountsEvent extends Equatable {
  const ManageDiscountsEvent();

  @override
  List<Object?> get props => [];
}

class FetchDiscountsEvent extends ManageDiscountsEvent {
  const FetchDiscountsEvent();
}

class DeleteDiscountEvent extends ManageDiscountsEvent {
  final String id;
  const DeleteDiscountEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class ChangeDiscountStatusEvent extends ManageDiscountsEvent {
  final String id;
  const ChangeDiscountStatusEvent(this.id);

  @override
  List<Object?> get props => [id];
}
