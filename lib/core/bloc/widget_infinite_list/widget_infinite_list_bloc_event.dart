part of 'widget_infinite_list_bloc.dart';

sealed class WidgetInfiniteListBlocEvent {}

final class WidgetInfiniteListBlocEventInit extends WidgetInfiniteListBlocEvent {
  final double? upperLoadLimit;
  final double? lowerLoadLimit;
  final bool isReverse;
  final bool shouldSwipeRefresh;
  WidgetInfiniteListBlocEventInit(this.upperLoadLimit, this.lowerLoadLimit, this.isReverse, this.shouldSwipeRefresh);
}

final class WidgetInfiniteListBlocEventUpdateScrollInfo extends WidgetInfiniteListBlocEvent {
  final UserScrollNotification scrollInfo;
  WidgetInfiniteListBlocEventUpdateScrollInfo(this.scrollInfo);
}

final class WidgetInfiniteListBlocEventHideTopLoading extends WidgetInfiniteListBlocEvent {}

final class WidgetInfiniteListBlocEventOnScroll extends WidgetInfiniteListBlocEvent {
  final ScrollPosition position;
  WidgetInfiniteListBlocEventOnScroll(this.position);
}

class WidgetInfiniteListBlocEventDragStart extends WidgetInfiniteListBlocEvent {
  final PointerDownEvent event;
  WidgetInfiniteListBlocEventDragStart(this.event);
}

class WidgetInfiniteListBlocEventDragUpdate extends WidgetInfiniteListBlocEvent {
  final PointerMoveEvent moveEvent;
  WidgetInfiniteListBlocEventDragUpdate(this.moveEvent);
}

class WidgetInfiniteListBlocEventDragEnd extends WidgetInfiniteListBlocEvent {
  final PointerUpEvent event;
  WidgetInfiniteListBlocEventDragEnd(this.event);
}

class WidgetInfiniteListBlocEventHideBottomLoading extends WidgetInfiniteListBlocEvent {}
