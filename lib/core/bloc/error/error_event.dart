part of 'error_bloc.dart';

abstract class ErrorEvent {}

class ErrorBeingResolved extends ErrorEvent {}

class ShowError extends ErrorEvent {
  final String message;
  final AppException? exception;
  ShowError(this.message, {this.exception});
}
