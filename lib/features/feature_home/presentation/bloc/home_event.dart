import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class FetchHomeDataEvent extends HomeEvent {
  final String? role;
  const FetchHomeDataEvent({this.role});

  @override
  List<Object?> get props => [role];
}

class LoadMoreHomeDataEvent extends HomeEvent {}
