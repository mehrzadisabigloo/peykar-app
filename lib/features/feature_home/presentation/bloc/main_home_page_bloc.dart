import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../../../core/services/jwt_decoder.dart';

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

class AppBarAlarms extends MainHomePageEvent {
  const AppBarAlarms();
}

// State
class MainHomePageState extends Equatable {
  final int index;
  final String role;
  final int alarmCount;

  const MainHomePageState({
    this.index = 4,
    this.role = '',
    this.alarmCount = 0,
  });

  MainHomePageState copyWith({
    int? index,
    String? role,
    int? alarmCount,
  }) {
    return MainHomePageState(
      index: index ?? this.index,
      role: role ?? this.role,
      alarmCount: alarmCount ?? this.alarmCount,
    );
  }

  @override
  List<Object?> get props => [index, role, alarmCount];
}

// Bloc
class MainHomePageBloc extends BaseBloc<MainHomePageEvent, MainHomePageState> {
  final JwtDecoder jwtDecoder;

  MainHomePageBloc(this.jwtDecoder) : super(const MainHomePageState()) {
    on<ChangeScreen>(_onChangeScreen);
    on<GetRole>(_onGetRole);
    on<AppBarAlarms>(_onAppBarAlarms);
  }

  void _onChangeScreen(ChangeScreen event, Emitter<MainHomePageState> emit) {
    emit(state.copyWith(index: event.index));
  }

  Future<void> _onGetRole(GetRole event, Emitter<MainHomePageState> emit) async {
    try {
      final role = await jwtDecoder.getRule();
      emit(state.copyWith(role: role));
    } catch (e) {
      emit(state.copyWith(role: 'user')); // Default role on error
    }
  }

  void _onAppBarAlarms(AppBarAlarms event, Emitter<MainHomePageState> emit) {
    // Logic for alarms if needed
    emit(state.copyWith(alarmCount: 0));
  }
}
