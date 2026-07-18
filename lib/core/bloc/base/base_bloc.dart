import 'package:flutter_bloc/flutter_bloc.dart';
import '../error/error_bloc.dart';

abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  final ErrorBloc errorBloc = ErrorBloc();
  BaseBloc(super.initialState);

  @override
  Future<void> close() {
    errorBloc.close();
    return super.close();
  }
}
