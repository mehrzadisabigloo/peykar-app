import 'package:flutter_bloc/flutter_bloc.dart';
import '../../error/app_exception.dart';

part 'error_event.dart';
part 'error_state.dart';

class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  ErrorBloc() : super(ErrorStateInitial()) {
    on<ShowError>((event, emit) {
      emit(ErrorStateDisplaySnackBar(event.message));
    });
    on<ErrorBeingResolved>((event, emit) {
      emit(ErrorStateInitial());
    });
  }
}
