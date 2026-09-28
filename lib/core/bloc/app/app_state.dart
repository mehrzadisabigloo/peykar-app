part of 'app_bloc.dart';

abstract class AppBlocState extends Equatable {
  final bool shouldListen;
  final bool shouldRebuild;
  const AppBlocState({this.shouldListen = false, this.shouldRebuild = false});

  @override
  List<Object?> get props => [shouldListen, shouldRebuild];
}

class AppBlocStateInitial extends AppBlocState {
  const AppBlocStateInitial() : super(shouldRebuild: true);
}

class AppBlocStateDataUpdated extends AppBlocState {
  final dynamic data;
  final EnumAppOperationType operation;
  final DateTime timestamp;

  AppBlocStateDataUpdated(this.data, this.operation)
      : timestamp = DateTime.now(),
        super(shouldListen: true);

  @override
  List<Object?> get props => [data, operation, timestamp];
}
