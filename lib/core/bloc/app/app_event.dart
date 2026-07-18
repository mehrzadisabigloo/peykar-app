part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class AppEventDataUpdated extends AppEvent {
  final dynamic data;
  final EnumAppOperationType operation;
  const AppEventDataUpdated(this.data, this.operation);

  @override
  List<Object?> get props => [data, operation];
}

enum EnumAppOperationType {
  none,
  refresh,
}
