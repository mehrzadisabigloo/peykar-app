part of 'manage_rating_bloc.dart';

abstract class ManageRatingState extends Equatable {
  final String? status;
  final int page;

  const ManageRatingState({this.status, this.page = 1});

  @override
  List<Object?> get props => [status, page];
}

class ManageRatingInitial extends ManageRatingState {}

class ManageRatingLoading extends ManageRatingState {
  const ManageRatingLoading({super.status, super.page});
}

class ManageRatingLoadingMore extends ManageRatingState {
  final List<ManageRatingEntity> ratings;
  final bool hasMore;

  const ManageRatingLoadingMore({
    required this.ratings,
    required this.hasMore,
    super.status,
    super.page,
  });

  @override
  List<Object?> get props => [ratings, hasMore, status, page];
}

class ManageRatingLoaded extends ManageRatingState {
  final List<ManageRatingEntity> ratings;
  final bool hasMore;
  final String? processingId;
  final String? successMessage;
  final String? errorMessage;

  const ManageRatingLoaded({
    required this.ratings,
    required this.hasMore,
    this.processingId,
    this.successMessage,
    this.errorMessage,
    super.status,
    super.page,
  });

  ManageRatingLoaded copyWith({
    List<ManageRatingEntity>? ratings,
    bool? hasMore,
    String? processingId,
    String? successMessage,
    String? errorMessage,
    bool clearProcessingId = false,
    bool clearMessages = false,
  }) {
    return ManageRatingLoaded(
      ratings: ratings ?? this.ratings,
      hasMore: hasMore ?? this.hasMore,
      processingId: processingId ?? (clearProcessingId ? null : this.processingId),
      successMessage: successMessage ?? (clearMessages ? null : this.successMessage),
      errorMessage: errorMessage ?? (clearMessages ? null : this.errorMessage),
      status: status,
      page: page,
    );
  }

  @override
  List<Object?> get props => [ratings, hasMore, processingId, successMessage, errorMessage, status, page];
}

class ManageRatingFailed extends ManageRatingState {
  final String message;

  const ManageRatingFailed({required this.message, super.status, super.page});

  @override
  List<Object?> get props => [message, status, page];
}
