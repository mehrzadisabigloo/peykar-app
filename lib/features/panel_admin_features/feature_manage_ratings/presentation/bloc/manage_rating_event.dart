part of 'manage_rating_bloc.dart';

abstract class ManageRatingEvent extends Equatable {
  const ManageRatingEvent();

  @override
  List<Object?> get props => [];
}

class FetchManageRatings extends ManageRatingEvent {
  final String? status;
  final bool refresh;

  const FetchManageRatings({this.status, this.refresh = false});

  @override
  List<Object?> get props => [status, refresh];
}

class LoadMoreManageRatings extends ManageRatingEvent {
  const LoadMoreManageRatings();
}

class ChangeRatingStatus extends ManageRatingEvent {
  final String ratingId;

  const ChangeRatingStatus(this.ratingId);

  @override
  List<Object?> get props => [ratingId];
}

class ClearRatingMessages extends ManageRatingEvent {
  const ClearRatingMessages();
}
