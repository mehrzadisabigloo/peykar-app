import 'package:equatable/equatable.dart';
import '../../domain/entity/banner_entity.dart';

abstract class BannerState extends Equatable {
  final List<BannerEntity> banners;
  final int page;
  final bool hasMore;
  final String? processingId;
  final bool isDeleting;
  final String? successMessage;
  final String? errorMessage;
  final String? place;

  const BannerState({
    this.banners = const [],
    this.page = 1,
    this.hasMore = true,
    this.processingId,
    this.isDeleting = false,
    this.successMessage,
    this.errorMessage,
    this.place,
  });

  @override
  List<Object?> get props => [banners, page, hasMore, processingId, isDeleting, successMessage, errorMessage, place];

  BannerState copyWith({
    List<BannerEntity>? banners,
    int? page,
    bool? hasMore,
    String? processingId,
    bool? isDeleting,
    String? successMessage,
    String? errorMessage,
    String? place,
    bool clearProcessingId = false,
    bool clearMessages = false,
  });
}

class BannerInitial extends BannerState {
  const BannerInitial();

  @override
  BannerState copyWith({
    List<BannerEntity>? banners,
    int? page,
    bool? hasMore,
    String? processingId,
    bool? isDeleting,
    String? successMessage,
    String? errorMessage,
    String? place,
    bool clearProcessingId = false,
    bool clearMessages = false,
  }) {
    return BannerInitial();
  }
}

class BannerLoading extends BannerState {
  const BannerLoading({
    super.banners,
    super.page,
    super.hasMore,
    super.place,
  });

  @override
  BannerState copyWith({
    List<BannerEntity>? banners,
    int? page,
    bool? hasMore,
    String? processingId,
    bool? isDeleting,
    String? successMessage,
    String? errorMessage,
    String? place,
    bool clearProcessingId = false,
    bool clearMessages = false,
  }) {
    return BannerLoading(
      banners: banners ?? this.banners,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      place: place ?? this.place,
    );
  }
}

class BannerLoaded extends BannerState {
  const BannerLoaded({
    required super.banners,
    required super.page,
    required super.hasMore,
    super.processingId,
    super.isDeleting,
    super.successMessage,
    super.errorMessage,
    super.place,
  });

  @override
  BannerLoaded copyWith({
    List<BannerEntity>? banners,
    int? page,
    bool? hasMore,
    String? processingId,
    bool? isDeleting,
    String? successMessage,
    String? errorMessage,
    String? place,
    bool clearProcessingId = false,
    bool clearMessages = false,
  }) {
    return BannerLoaded(
      banners: banners ?? this.banners,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      processingId: processingId ?? (clearProcessingId ? null : this.processingId),
      isDeleting: isDeleting ?? this.isDeleting,
      successMessage: successMessage ?? (clearMessages ? null : this.successMessage),
      errorMessage: errorMessage ?? (clearMessages ? null : this.errorMessage),
      place: place ?? this.place,
    );
  }
}

class BannerFailed extends BannerState {
  final String message;
  const BannerFailed(this.message) : super(errorMessage: message);

  @override
  List<Object?> get props => [message];

  @override
  BannerState copyWith({
    List<BannerEntity>? banners,
    int? page,
    bool? hasMore,
    String? processingId,
    bool? isDeleting,
    String? successMessage,
    String? errorMessage,
    String? place,
    bool clearProcessingId = false,
    bool clearMessages = false,
  }) {
    return BannerFailed(errorMessage ?? message);
  }
}
