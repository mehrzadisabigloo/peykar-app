part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class FetchProfileDataEvent extends ProfileEvent {
  const FetchProfileDataEvent();
}

class UpdateProfileDataEvent extends ProfileEvent {
  final ProfileEntity profile;
  const UpdateProfileDataEvent(this.profile);

  @override
  List<Object?> get props => [profile];
}
