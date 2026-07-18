import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppBlocState> {
  AppBloc() : super(const AppBlocStateInitial()) {
    on<AppEventDataUpdated>(_onDataUpdated);
  }

  void _onDataUpdated(AppEventDataUpdated event, Emitter<AppBlocState> emit) {
    // Handle app wide updates
  }
}
