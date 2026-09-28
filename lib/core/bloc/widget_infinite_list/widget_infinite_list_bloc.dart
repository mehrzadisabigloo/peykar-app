import 'dart:async';
import 'dart:math';

import "package:bloc_concurrency/bloc_concurrency.dart";
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../base/base_bloc.dart';

part 'widget_infinite_list_bloc_event.dart';
part 'widget_infinite_list_bloc_state.dart';

class WidgetInfiniteListBloc extends BaseBloc<WidgetInfiniteListBlocEvent, WidgetInfiniteListBlocState> {
  bool isScrollingUp = false;
  bool atEdge = false;
  double? distanceFromTop;
  double? distanceFromBottom;
  double? upperLoadLimit;
  double? bottomLoadLimit;
  late bool allowUpperLoading = upperLoadLimit == null ? false : true;
  late bool allowBottomLoading = bottomLoadLimit == null ? false : true;
  late bool isReversed;
  late bool shouldSwipeRefresh;
  PointerDownEvent? dragStartDetails;
  bool isRefreshing = false;
  bool isAtTheEdge = false;

  WidgetInfiniteListBloc() : super(const WidgetInfiniteListBlocStateInitial()) {
    on<WidgetInfiniteListBlocEventInit>(init);
    on<WidgetInfiniteListBlocEventUpdateScrollInfo>(updateScrollInfo, transformer: droppable());
    on<WidgetInfiniteListBlocEventHideTopLoading>(hideLoadMore);
    on<WidgetInfiniteListBlocEventOnScroll>(onScroll, transformer: droppable());
    on<WidgetInfiniteListBlocEventDragStart>(onDragStarted, transformer: droppable());
    on<WidgetInfiniteListBlocEventDragUpdate>(onDragUpdated, transformer: droppable());
    on<WidgetInfiniteListBlocEventDragEnd>(onDragEnded, transformer: droppable());
    on<WidgetInfiniteListBlocEventHideBottomLoading>(hideBottomLoading);
  }

  FutureOr<void> init(WidgetInfiniteListBlocEventInit event, Emitter<WidgetInfiniteListBlocState> emit) {
    upperLoadLimit = event.upperLoadLimit;
    bottomLoadLimit = event.lowerLoadLimit;
    isReversed = event.isReverse;
    shouldSwipeRefresh = event.shouldSwipeRefresh;
  }

  FutureOr<void> updateScrollInfo(
      WidgetInfiniteListBlocEventUpdateScrollInfo event, Emitter<WidgetInfiniteListBlocState> emit) async {
    isScrollingUp = calculateScrollingUp(event.scrollInfo);
    atEdge = event.scrollInfo.metrics.atEdge;
  }

  void emitLoadedState(Emitter<WidgetInfiniteListBlocState> emit,
      {bool? displayUpperLoading, bool? displayBottomLoading, double swipeRefreshHeight = 0}) {
    emit(WidgetInfiniteListBlocStateDataLoaded(
        displayBottomLoading: displayBottomLoading ?? state.displayBottomLoading,
        displayTopLoading: displayUpperLoading ?? state.displayTopLoading,
        swipeRefreshHeight: swipeRefreshHeight));
  }

  FutureOr<void> hideLoadMore(
      WidgetInfiniteListBlocEventHideTopLoading event, Emitter<WidgetInfiniteListBlocState> emit) {
    emitLoadedState(emit, displayUpperLoading: false);
  }

  bool calculateScrollingUp(UserScrollNotification scrollInfo) {
    if (isReversed) {
      return scrollInfo.direction == ScrollDirection.reverse;
    } else {
      return scrollInfo.direction == ScrollDirection.forward;
    }
  }

  FutureOr<void> onScroll(
      WidgetInfiniteListBlocEventOnScroll event, Emitter<WidgetInfiniteListBlocState> emit) {
    distanceFromBottom = isReversed ? event.position.extentBefore : event.position.extentAfter;
    distanceFromTop = isReversed ? event.position.extentAfter : event.position.extentBefore;
    isAtTheEdge = event.position.atEdge;

    if (shouldDisplayTopLoading()) {
      allowUpperLoading = false;
      emitLoadedState(emit, displayUpperLoading: true, displayBottomLoading: false);
      emit(WidgetInfiniteListBlocStateLoadTop());
    }
    if (shouldDisplayBottomLoading()) {
      allowBottomLoading = false;
      emitLoadedState(emit, displayUpperLoading: false, displayBottomLoading: true);
      emit(WidgetInfiniteListBlocStateLoadBottom());
    }
    if (!allowBottomLoading) {
      allowBottomLoading = bottomLoadLimit == null ? false : distanceFromBottom! > (1.5 * bottomLoadLimit!);
    }
    if (!allowUpperLoading) {
      allowUpperLoading = upperLoadLimit == null ? false : distanceFromTop! > (1.5 * upperLoadLimit!);
    }
  }

  FutureOr<void> onDragStarted(
      WidgetInfiniteListBlocEventDragStart event, Emitter<WidgetInfiniteListBlocState> emit) {
    dragStartDetails = event.event;
  }

  FutureOr<void> onDragUpdated(
      WidgetInfiniteListBlocEventDragUpdate event, Emitter<WidgetInfiniteListBlocState> emit) async {
    if (distanceFromTop == null || distanceFromTop! > 10 || isRefreshing || !isAtTheEdge) return;
    double heightDiff = event.moveEvent.position.dy - (dragStartDetails?.position.dy ?? 0);
    emitLoadedState(emit, swipeRefreshHeight: _calculateSwipeRefreshHeight(heightDiff));
    if (heightDiff > 80) {
      emit(const WidgetInfiniteListBlocStateRefresh());
      isRefreshing = true;
      emitLoadedState(emit,
          displayUpperLoading: false,
          displayBottomLoading: false,
          swipeRefreshHeight: _calculateSwipeRefreshHeight(heightDiff));
    }
  }

  FutureOr<void> onDragEnded(
      WidgetInfiniteListBlocEventDragEnd event, Emitter<WidgetInfiniteListBlocState> emit) {}

  double _calculateSwipeRefreshHeight(double heightDiff) {
    return max(0, min(heightDiff, 80));
  }

  bool shouldDisplayTopLoading() {
    if (upperLoadLimit == null || distanceFromTop == null) return false;
    bool cond1 = !state.displayTopLoading;
    bool cond2 = allowUpperLoading;
    bool cond3 = isScrollingUp;
    bool cond4 = upperLoadLimit != null;
    bool cond5 = distanceFromTop! < upperLoadLimit!;
    return cond1 && cond2 && cond3 && cond4 && cond5;
  }

  bool shouldDisplayBottomLoading() {
    if (bottomLoadLimit == null || distanceFromBottom == null) return false;

    bool cond1 = !state.displayBottomLoading;
    bool cond2 = allowBottomLoading;
    bool cond3 = !isScrollingUp;
    bool cond4 = bottomLoadLimit != null;
    bool cond5 = distanceFromBottom! < bottomLoadLimit!;

    return cond1 && cond2 && cond3 && cond4 && cond5;
  }

  @override
  void onChange(Change<WidgetInfiniteListBlocState> change) {
    debugPrint(change.toString());
    super.onChange(change);
  }

  FutureOr<void> hideBottomLoading(
      WidgetInfiniteListBlocEventHideBottomLoading event, Emitter<WidgetInfiniteListBlocState> emit) {
    emitLoadedState(emit, displayBottomLoading: false);
  }
}
