import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../domain/repository/profile_repository.dart';
import '../../domain/entity/profile_entity.dart';
import '../../../../core/resources/data_state.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends BaseBloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc(this.profileRepository) : super(const ProfileInitial()) {
    on<FetchProfileDataEvent>(_onFetchProfileData);
    on<UpdateProfileDataEvent>(_onUpdateProfileData);
  }

  Future<void> _onFetchProfileData(FetchProfileDataEvent event, Emitter<ProfileState> emit) async {
    emit(const ProfileLoading());
    final dataState = await profileRepository.fetchProfileData();

    if (dataState is DataSuccess) {
      emit(ProfileLoaded(dataState.data!));
    } else {
      emit(ProfileError(dataState.error ?? "خطا در دریافت اطلاعات"));
    }
  }

  Future<void> _onUpdateProfileData(UpdateProfileDataEvent event, Emitter<ProfileState> emit) async {
    emit(const ProfileLoading());
    final dataState = await profileRepository.updateProfileData(event.profile);

    if (dataState is DataSuccess) {
      emit(ProfileUpdateSuccess(dataState.data!));
      add(const FetchProfileDataEvent());
    } else {
      emit(ProfileError(dataState.error ?? "خطا در بروزرسانی"));
    }
  }
}
