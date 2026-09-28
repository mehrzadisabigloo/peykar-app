import 'package:equatable/equatable.dart';
import '../../domain/entity/banner_entity.dart';

abstract class BannerEvent extends Equatable {
  const BannerEvent();

  @override
  List<Object?> get props => [];
}

class FetchBannersEvent extends BannerEvent {
  final bool isRefresh;
  final String? place;
  const FetchBannersEvent({this.isRefresh = false, this.place});

  @override
  List<Object?> get props => [isRefresh, place];
}

class LoadMoreBannersEvent extends BannerEvent {
  final String? place;
  const LoadMoreBannersEvent({this.place});

  @override
  List<Object?> get props => [place];
}

class AddBannerEvent extends BannerEvent {
  final Map<String, dynamic> params;
  const AddBannerEvent(this.params);

  @override
  List<Object?> get props => [params];
}

class EditBannerEvent extends BannerEvent {
  final String id;
  final Map<String, dynamic> params;
  const EditBannerEvent(this.id, this.params);

  @override
  List<Object?> get props => [id, params];
}

class DeleteBannerEvent extends BannerEvent {
  final String id;
  const DeleteBannerEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class ChangeBannerStatusEvent extends BannerEvent {
  final String id;
  const ChangeBannerStatusEvent(this.id);

  @override
  List<Object?> get props => [id];
}
