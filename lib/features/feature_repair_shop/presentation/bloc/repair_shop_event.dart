part of 'repair_shop_bloc.dart';


abstract class RepairShopEvent extends Equatable {
  const RepairShopEvent();

  @override
  List<Object?> get props => [];
}

class FetchRepairShopDataEvent extends RepairShopEvent {
  final String repairmanId;
  const FetchRepairShopDataEvent(this.repairmanId);

  @override
  List<Object?> get props => [repairmanId];
}
