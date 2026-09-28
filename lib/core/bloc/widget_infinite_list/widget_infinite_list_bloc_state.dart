part of 'widget_infinite_list_bloc.dart';

sealed class WidgetInfiniteListBlocState extends Equatable {
  final bool displayBottomLoading;
  final bool displayTopLoading;
  final double swipeRefreshHeight;
  final bool shouldRebuild;
  final bool shouldListen;

  const WidgetInfiniteListBlocState({
    this.swipeRefreshHeight = 0,
    this.displayBottomLoading = false,
    this.displayTopLoading = false,
    this.shouldRebuild = true,
    this.shouldListen = false,
  });

  @override
  List<Object?> get props => [displayBottomLoading, displayTopLoading, swipeRefreshHeight, shouldRebuild, shouldListen];
}

final class WidgetInfiniteListBlocStateDataLoaded extends WidgetInfiniteListBlocState {
  const WidgetInfiniteListBlocStateDataLoaded({
    super.displayBottomLoading = false,
    super.displayTopLoading = false,
    super.swipeRefreshHeight,
  });
}

final class WidgetInfiniteListBlocStateLoadTop extends WidgetInfiniteListBlocState {
  const WidgetInfiniteListBlocStateLoadTop() : super(shouldListen: true, shouldRebuild: false, displayTopLoading: true);
}

final class WidgetInfiniteListBlocStateLoadBottom extends WidgetInfiniteListBlocState {
  const WidgetInfiniteListBlocStateLoadBottom() : super(shouldListen: true, shouldRebuild: false, displayBottomLoading: true);
}

final class WidgetInfiniteListBlocStateInitial extends WidgetInfiniteListBlocState {
  const WidgetInfiniteListBlocStateInitial();
}

final class WidgetInfiniteListBlocStateRefresh extends WidgetInfiniteListBlocState {
  const WidgetInfiniteListBlocStateRefresh() : super(shouldListen: true, shouldRebuild: false, displayTopLoading: false, displayBottomLoading: false);
}
