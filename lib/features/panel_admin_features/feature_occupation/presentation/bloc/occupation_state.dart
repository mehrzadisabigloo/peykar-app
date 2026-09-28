import 'package:equatable/equatable.dart';
import '../../domain/entity/occupation_entity.dart';
import '../../domain/entity/occupation_list_entity.dart';

abstract class OccupationState extends Equatable {
  const OccupationState();
  @override
  List<Object?> get props => [];
}

class OccupationInitial extends OccupationState {}

class OccupationLoading extends OccupationState {}

class OccupationsLoaded extends OccupationState {
  final OccupationListEntity occupationList;
  final String? statusProcessingId;
  final String? orderProcessingId;
  final String? successMessage;
  final String? errorMessage;

  const OccupationsLoaded(
    this.occupationList, {
    this.statusProcessingId,
    this.orderProcessingId,
    this.successMessage,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        occupationList,
        statusProcessingId,
        orderProcessingId,
        successMessage,
        errorMessage,
      ];

  OccupationsLoaded copyWith({
    OccupationListEntity? occupationList,
    String? statusProcessingId,
    String? orderProcessingId,
    String? successMessage,
    String? errorMessage,
    bool clearStatusProcessingId = false,
    bool clearOrderProcessingId = false,
    bool clearMessages = false,
  }) {
    return OccupationsLoaded(
      occupationList ?? this.occupationList,
      statusProcessingId: clearStatusProcessingId ? null : (statusProcessingId ?? this.statusProcessingId),
      orderProcessingId: clearOrderProcessingId ? null : (orderProcessingId ?? this.orderProcessingId),
      successMessage: clearMessages ? null : (successMessage ?? this.successMessage),
      errorMessage: clearMessages ? null : (errorMessage ?? this.errorMessage),
    );
  }
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
