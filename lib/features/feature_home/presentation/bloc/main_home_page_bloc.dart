import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../../../core/services/jwt_decoder.dart';
import '../../../../core/services/locator.dart';
import '../../../feature_profile/domain/entity/profile_entity.dart';
import '../../../feature_profile/domain/repository/profile_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/resources/data_state.dart';

// Events
abstract class MainHomePageEvent extends Equatable {
  const MainHomePageEvent();

  @override
  List<Object?> get props => [];
}

class ChangeScreen extends MainHomePageEvent {
  final int index;
  const ChangeScreen(this.index);

  @override
  List<Object?> get props => [index];
}

class GetRole extends MainHomePageEvent {
  const GetRole();
}

class CheckAccountStatus extends MainHomePageEvent {
  const CheckAccountStatus();
}

class AppBarAlarms extends MainHomePageEvent {
  const AppBarAlarms();
}

class UpdateProfile extends MainHomePageEvent {
  final ProfileEntity profile;
  const UpdateProfile(this.profile);

  @override
  List<Object?> get props => [profile];
}

// State
class MainHomePageState extends Equatable {
  final int index;
  final String role;
  final int alarmCount;
  final String status;
  final bool isLoading;
  final bool? statusCheckSuccess;
  final ProfileEntity? profile;

  const MainHomePageState({
    this.index = 4,
    this.role = '',
    this.alarmCount = 0,
    this.status = '',
    this.isLoading = false,
    this.statusCheckSuccess,
    this.profile,
  });

  bool get isApproved => role != 'repairman' || status != 'Draft';

  MainHomePageState copyWith({
    int? index,
    String? role,
    int? alarmCount,
    String? status,
    bool? isLoading,
    bool? statusCheckSuccess,
    ProfileEntity? profile,
  }) {
    return MainHomePageState(
      index: index ?? this.index,
      role: role ?? this.role,
      alarmCount: alarmCount ?? this.alarmCount,
      status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
      statusCheckSuccess: statusCheckSuccess ?? this.statusCheckSuccess,
      profile: profile ?? this.profile,
    );
  }

  @override
  List<Object?> get props => [index, role, alarmCount, status, isLoading, statusCheckSuccess, profile];
}

// Bloc
class MainHomePageBloc extends BaseBloc<MainHomePageEvent, MainHomePageState> {
  final JwtDecoder jwtDecoder;
  final ProfileRepository profileRepository;

  MainHomePageBloc(this.jwtDecoder, this.profileRepository) : super(const MainHomePageState()) {
    on<ChangeScreen>(_onChangeScreen);
    on<GetRole>(_onGetRole);
    on<CheckAccountStatus>(_onCheckAccountStatus);
    on<AppBarAlarms>(_onAppBarAlarms);
    on<UpdateProfile>(_onUpdateProfile);
  }

  void _onChangeScreen(ChangeScreen event, Emitter<MainHomePageState> emit) {
    emit(state.copyWith(index: event.index));
  }

  Future<void> _onGetRole(GetRole event, Emitter<MainHomePageState> emit) async {
    try {
      // 1. Get stored data immediately for instant UI response
      String role = await jwtDecoder.getRule();
      String? storedStatus = await jwtDecoder.getStatus();
      
      if (storedStatus == 'Draft') {
        role = 'repairman';
      }

      int initialIndex = state.index;
      if (role == 'repairman' || role == 'admin') {
        initialIndex = 2; // Dashboard for repairman
      } else {
        initialIndex = 4; // Home for user
      }
      
      // Emit initial state from storage
      emit(state.copyWith(role: role, index: initialIndex, status: storedStatus ?? ''));

      // 2. Sync with server in background
      final dataState = await profileRepository.fetchProfileData();
      if (dataState is DataSuccess) {
        String status = dataState.data?.status ?? '';
        String roleFromServer = dataState.data?.role ?? role;

        if (status == 'Draft') {
          roleFromServer = 'repairman';
        }

        // Save fresh status to storage
        final storage = locator<FlutterSecureStorage>();
        await storage.write(key: 'status', value: status);

        // Update state if changed
        emit(state.copyWith(role: roleFromServer, status: status, profile: dataState.data));
      }
    } catch (e) {
      emit(state.copyWith(role: 'user', index: 4)); // Default role on error
    }
  }

  Future<void> _onCheckAccountStatus(CheckAccountStatus event, Emitter<MainHomePageState> emit) async {
    emit(state.copyWith(isLoading: true, statusCheckSuccess: null));
    try {
      final dataState = await profileRepository.fetchProfileData();
      if (dataState is DataSuccess) {
        String status = dataState.data?.status ?? '';
        String role = dataState.data?.role ?? state.role;

        // Ensure role is repairman if status is Draft
        if (status == 'Draft') {
          role = 'repairman';
        }

        // Save status to storage for persistence
        final storage = locator<FlutterSecureStorage>();
        await storage.write(key: 'status', value: status);

        emit(state.copyWith(status: status, role: role, isLoading: false, statusCheckSuccess: true, profile: dataState.data));
      } else {
        emit(state.copyWith(isLoading: false, statusCheckSuccess: false));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, statusCheckSuccess: false));
    }
  }

  void _onAppBarAlarms(AppBarAlarms event, Emitter<MainHomePageState> emit) {
    // Logic for alarms if needed
    emit(state.copyWith(alarmCount: 0));
  }

  void _onUpdateProfile(UpdateProfile event, Emitter<MainHomePageState> emit) {
    String role = event.profile.role;
    String status = event.profile.status ?? '';

    if (status == 'Draft') {
      role = 'repairman';
    }

    emit(state.copyWith(
      profile: event.profile,
      role: role,
      status: status,
    ));
  }
}
