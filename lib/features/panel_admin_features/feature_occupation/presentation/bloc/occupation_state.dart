import 'package:equatable/equatable.dart';
import '../../domain/entity/occupation_entity.dart';

abstract class OccupationState extends Equatable {
  const OccupationState();
  @override
  List<Object?> get props => [];
}

class OccupationInitial extends OccupationState {}

class OccupationLoading extends OccupationState {}

class OccupationsLoaded extends OccupationState {
  final List<OccupationEntity> occupations;
  const OccupationsLoaded(this.occupations);
  @override
  List<Object?> get props => [occupations];
}

class OccupationError extends OccupationState {
  final String message;
  const OccupationError(this.message);
  @override
  List<Object?> get props => [message];
}

class OccupationActionSuccess extends OccupationState {
  final String message;
  final OccupationEntity occupation;
  const OccupationActionSuccess(this.message, this.occupation);
  @override
  List<Object?> get props => [message, occupation];
}
