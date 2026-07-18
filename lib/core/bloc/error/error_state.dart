part of 'error_bloc.dart';

abstract class ErrorState {
  final bool shouldListen;
  final bool shouldRebuild;
  ErrorState({this.shouldListen = false, this.shouldRebuild = false});
}

class ErrorStateInitial extends ErrorState {}

class ErrorStateNone extends ErrorState {
  final AppException? exception;
  ErrorStateNone({this.exception}) : super(shouldListen: true);
}

class ErrorStateDisplaySnackBar extends ErrorState {
  final String message;
  ErrorStateDisplaySnackBar(this.message) : super(shouldListen: true);
}

class ErrorReceived extends ErrorState {
  final AppException? exception;
  ErrorReceived(this.exception) : super(shouldRebuild: true);
}
