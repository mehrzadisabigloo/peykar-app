part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial();
}

class Loading extends AuthenticationState {
  const Loading();
}

class Loaded extends AuthenticationState {
  final AuthEntity authEntity;
  const Loaded(this.authEntity);

  @override
  List<Object?> get props => [authEntity];
}

class AuthSuccess extends AuthenticationState {
  final AuthEntity authEntity;
  const AuthSuccess(this.authEntity);

  @override
  List<Object?> get props => [authEntity];
}

class Failed extends AuthenticationState {
  final String message;
  const Failed(this.message);

  @override
  List<Object?> get props => [message];
}

class OccupationLoading extends AuthenticationState {
  const OccupationLoading();
}

class OccupationsLoaded extends AuthenticationState {
  final List<OccupationEntity> occupations;
  const OccupationsLoaded(this.occupations);

  @override
  List<Object?> get props => [occupations];
}
