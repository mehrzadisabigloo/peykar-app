part of 'service_detail_bloc.dart';


abstract class ServiceDetailEvent extends Equatable {
  const ServiceDetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchServiceDetail extends ServiceDetailEvent {
  final String serviceId;
  const FetchServiceDetail(this.serviceId);

  @override
  List<Object?> get props => [serviceId];
}
