part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object?> get props => [];
}

class FetchUsers extends UsersEvent {
  final UsersFilterParams params;
  const FetchUsers(this.params);

  @override
  List<Object?> get props => [params];
}

class LoadMoreUsers extends UsersEvent {
  const LoadMoreUsers();
}

class ClearUsersFilters extends UsersEvent {
  const ClearUsersFilters();
}

class StoreUserLocation extends UsersEvent {
  final double latitude;
  final double longitude;
  final String? address;

  const StoreUserLocation({
    required this.latitude,
    required this.longitude,
    this.address,
  });

  @override
  List<Object?> get props => [latitude, longitude, address];
}

class StartLocationPermissionRequest extends UsersEvent {}

class LocationPermissionDenied extends UsersEvent {
  final String message;
  const LocationPermissionDenied(this.message);

  @override
  List<Object?> get props => [message];
}
