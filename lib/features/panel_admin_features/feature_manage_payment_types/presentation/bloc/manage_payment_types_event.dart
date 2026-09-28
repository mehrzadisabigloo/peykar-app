part of 'manage_payment_types_bloc.dart';

abstract class ManagePaymentTypesEvent extends Equatable {
  const ManagePaymentTypesEvent();

  @override
  List<Object?> get props => [];
}

class FetchPaymentTypesEvent extends ManagePaymentTypesEvent {
  final Map<String, dynamic> params;
  const FetchPaymentTypesEvent({this.params = const {'count_item': 100, 'is_paginate': false}});

  @override
  List<Object?> get props => [params];
}

class ChangePaymentTypeStatusEvent extends ManagePaymentTypesEvent {
  final int id;
  const ChangePaymentTypeStatusEvent(this.id);

  @override
  List<Object?> get props => [id];
}
