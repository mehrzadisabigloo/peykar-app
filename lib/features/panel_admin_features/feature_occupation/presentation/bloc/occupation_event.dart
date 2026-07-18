import 'package:equatable/equatable.dart';
import '../../domain/entity/occupation_entity.dart';

abstract class OccupationEvent extends Equatable {
  const OccupationEvent();
  @override
  List<Object?> get props => [];
}

class FetchOccupationsEvent extends OccupationEvent {
  final OccupationFilterParams params;
  const FetchOccupationsEvent({this.params = const OccupationFilterParams()});
  @override
  List<Object?> get props => [params];
}

class ChangeOccupationStatusEvent extends OccupationEvent {
  final String id;
  const ChangeOccupationStatusEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class MoveOccupationUpEvent extends OccupationEvent {
  final String id;
  const MoveOccupationUpEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class MoveOccupationDownEvent extends OccupationEvent {
  final String id;
  const MoveOccupationDownEvent(this.id);
  @override
  List<Object?> get props => [id];
}
