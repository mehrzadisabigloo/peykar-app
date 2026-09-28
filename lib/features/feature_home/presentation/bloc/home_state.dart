import 'package:equatable/equatable.dart';
import '../../../panel_admin_features/feature_occupation/domain/entity/occupation_entity.dart';
import '../../../panel_admin_features/feature_banner/domain/entity/banner_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<OccupationEntity> occupations;
  final List<BannerEntity> banners;
  final bool hasMore;
  final int total;
  final int page;
  final String? errorMessage;

  const HomeLoaded({
    required this.occupations,
    this.banners = const [],
    required this.hasMore,
    required this.total,
    required this.page,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [occupations, banners, hasMore, total, page, errorMessage];
}

class HomeLoadingMore extends HomeState {
  final List<OccupationEntity> occupations;
  final List<BannerEntity> banners;
  final bool hasMore;
  final int total;
  final int page;

  const HomeLoadingMore({
    required this.occupations,
    this.banners = const [],
    required this.hasMore,
    required this.total,
    required this.page,
  });

  @override
  List<Object?> get props => [occupations, banners, hasMore, total, page];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
