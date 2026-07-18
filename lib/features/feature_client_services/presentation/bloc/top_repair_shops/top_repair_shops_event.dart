part of 'top_repair_shops_bloc.dart';


abstract class TopRepairShopsEvent extends Equatable {
  const TopRepairShopsEvent();

  @override
  List<Object?> get props => [];
}

class FetchTopRepairShopsEvent extends TopRepairShopsEvent {
  final bool isRefresh;
  const FetchTopRepairShopsEvent({this.isRefresh = false});

  @override
  List<Object?> get props => [isRefresh];
}

class LoadMoreTopRepairShopsEvent extends TopRepairShopsEvent {
  const LoadMoreTopRepairShopsEvent();
}
