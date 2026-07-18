part of 'repair_shop_bloc.dart';


abstract class RepairShopState extends Equatable {
  const RepairShopState();

  @override
  List<Object?> get props => [];
}

class RepairShopInitial extends RepairShopState {
  const RepairShopInitial();
}

class RepairShopLoading extends RepairShopState {
  const RepairShopLoading();
}

class RepairShopLoaded extends RepairShopState {
  final RepairShopEntity entity;
  const RepairShopLoaded(this.entity);

  @override
  List<Object?> get props => [entity];
}

class RepairShopError extends RepairShopState {
  final String message;
  const RepairShopError(this.message);

  @override
  List<Object?> get props => [message];
}
