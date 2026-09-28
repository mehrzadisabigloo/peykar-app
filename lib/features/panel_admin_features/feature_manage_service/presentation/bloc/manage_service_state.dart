part of 'manage_service_bloc.dart';

abstract class ManageServiceState extends Equatable {
  final List<ManageServiceEntity> services;
  final int page;
  final bool hasMore;
  final String? errorMessage;
  final String? successMessage;
  final String? processingId;
  final bool isDeleting;

  const ManageServiceState({
    this.services = const [],
    this.page = 1,
    this.hasMore = true,
    this.errorMessage,
    this.successMessage,
    this.processingId,
    this.isDeleting = false,
  });

  @override
  List<Object?> get props => [
    services,
    page,
    hasMore,
    errorMessage,
    successMessage,
    processingId,
    isDeleting,
  ];
}

class ManageServiceInitial extends ManageServiceState {
  const ManageServiceInitial();
}

class ManageServiceLoading extends ManageServiceState {
  const ManageServiceLoading({
    super.services,
    super.page,
    super.hasMore,
  });
}

class ManageServiceLoaded extends ManageServiceState {
  const ManageServiceLoaded({
    required super.services,
    required super.page,
    required super.hasMore,
    super.errorMessage,
    super.successMessage,
    super.processingId,
    super.isDeleting,
  });

  ManageServiceLoaded copyWith({
    List<ManageServiceEntity>? services,
    int? page,
    bool? hasMore,
    String? errorMessage,
    String? successMessage,
    String? processingId,
    bool? isDeleting,
    bool clearMessages = false,
  }) {
    return ManageServiceLoaded(
      services: services ?? this.services,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      errorMessage: errorMessage ?? (clearMessages ? null : this.errorMessage),
      successMessage: successMessage ?? (clearMessages ? null : this.successMessage),
      processingId: processingId ?? this.processingId,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }
}

class ManageServiceFailed extends ManageServiceState {
  final String message;
  const ManageServiceFailed(this.message, {
    super.services,
    super.page,
    super.hasMore,
  });

  @override
  List<Object?> get props => [...super.props, message];
}
