part of 'top_repair_shops_bloc.dart';


abstract class TopRepairShopsState extends Equatable {
  const TopRepairShopsState();

  @override
  List<Object?> get props => [];
}

class TopRepairShopsInitial extends TopRepairShopsState {
  const TopRepairShopsInitial();
}

class TopRepairShopsLoading extends TopRepairShopsState {
  const TopRepairShopsLoading();
}

class TopRepairShopsLoaded extends TopRepairShopsState {
  final List<UserEntity> shops;
  final bool hasReachedMax;
  final bool isLoadingMore;

  const TopRepairShopsLoaded({
    required this.shops,
    this.hasReachedMax = false,
    this.isLoadingMore = false,
  });

  TopRepairShopsLoaded copyWith({
    List<UserEntity>? shops,
    bool? hasReachedMax,
    bool? isLoadingMore,
  }) {
    return TopRepairShopsLoaded(
      shops: shops ?? this.shops,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [shops, hasReachedMax, isLoadingMore];
}

class TopRepairShopsError extends TopRepairShopsState {
  final String message;
  const TopRepairShopsError(this.message);

  @override
  List<Object?> get props => [message];
}
