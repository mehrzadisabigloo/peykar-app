part of 'manage_service_bloc.dart';

abstract class ManageServiceEvent extends Equatable {
  const ManageServiceEvent();

  @override
  List<Object?> get props => [];
}

class FetchManageServices extends ManageServiceEvent {
  final bool isRefresh;
  final String? title;
  final String? repairmanId;

  const FetchManageServices({
    this.isRefresh = false,
    this.title,
    this.repairmanId,
  });

  @override
  List<Object?> get props => [isRefresh, title, repairmanId];
}

class LoadMoreManageServices extends ManageServiceEvent {
  const LoadMoreManageServices();
}

class ChangeServiceStatus extends ManageServiceEvent {
  final String serviceId;
  final String status;

  const ChangeServiceStatus(this.serviceId, this.status);

  @override
  List<Object?> get props => [serviceId, status];
}

class DeleteService extends ManageServiceEvent {
  final String serviceId;

  const DeleteService(this.serviceId);

  @override
  List<Object?> get props => [serviceId];
}
