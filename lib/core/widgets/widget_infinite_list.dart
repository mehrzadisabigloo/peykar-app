import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:implicitly_animated_list/implicitly_animated_list.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../base/base_widget_state.dart';
import '../bloc/widget_infinite_list/widget_infinite_list_bloc.dart';

class WidgetInfiniteList extends StatefulWidget {
  final Widget Function(BuildContext context, dynamic item) builder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final bool reverse;
  final EdgeInsets? padding;
  final List items;
  final double? topLoadLimit;
  final double? lowerLoadLimit;
  final Duration? animationDuration;
  final AnimatedChildBuilder? deleteAnimation;
  final AnimatedChildBuilder? insertAnimation;
  final Widget errorWidget;
  final bool hasReachedBottom;
  final bool Function(dynamic first, dynamic second)? itemEquality;
  final AutoScrollController? scrollToIndexController;
  final bool hasReachedTop;
  final WidgetInfiniteListBloc bloc;
  final void Function()? loadBottomData;
  final void Function()? loadTopData;
  final void Function()? refreshOnSwipe;
  final bool isLoading;
  final Widget loadingWidget;
  final Color? backgroundColor;
  final Color? loadingIndicatorColor;
  final bool hasErrorOccurred;
  final ScrollPhysics? scrollPhysics;
  final bool? shrinkWrap;
  
  const WidgetInfiniteList({
    super.key,
    required this.builder,
    required this.items,
    required this.bloc,
    this.scrollPhysics,
    this.reverse = false,
    this.separatorBuilder,
    this.padding,
    required this.errorWidget,
    this.itemEquality,
    this.backgroundColor,
    this.deleteAnimation,
    this.animationDuration,
    this.insertAnimation,
    this.lowerLoadLimit = 200,
    this.topLoadLimit,
    required this.hasReachedTop,
    required this.hasReachedBottom,
    this.scrollToIndexController,
    this.refreshOnSwipe,
    this.loadBottomData,
    this.loadTopData,
    required this.isLoading,
    required this.loadingWidget,
    this.loadingIndicatorColor,
    required this.hasErrorOccurred,
    this.shrinkWrap,
  });

  @override
  State<WidgetInfiniteList> createState() => _WidgetInfiniteListState();
}

class _WidgetInfiniteListState extends BaseWidgetState<WidgetInfiniteList> {
  WidgetInfiniteListBloc get bloc => widget.bloc;
  late final AutoScrollController controller = widget.scrollToIndexController ?? AutoScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(onScrollListener);
    bloc.add(WidgetInfiniteListBlocEventInit(
        widget.topLoadLimit, widget.lowerLoadLimit, widget.reverse, widget.refreshOnSwipe != null));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<WidgetInfiniteListBloc, WidgetInfiniteListBlocState>(
          buildWhen: (p, c) => c.shouldRebuild,
          listenWhen: (p, c) => c.shouldListen,
          builder: blocBuilder,
          listener: blocListener),
    );
  }

  Widget blocBuilder(BuildContext context, WidgetInfiniteListBlocState state) {
    return Listener(
        onPointerDown: widget.refreshOnSwipe == null
            ? null
            : (details) => bloc.add(WidgetInfiniteListBlocEventDragStart(details)),
        onPointerMove: widget.refreshOnSwipe == null
            ? null
            : (details) => bloc.add(WidgetInfiniteListBlocEventDragUpdate(details)),
        onPointerUp: widget.refreshOnSwipe == null
            ? null
            : (details) => bloc.add(WidgetInfiniteListBlocEventDragEnd(details)),
        child: getMainWidget(state));
  }

  Widget _defaultAnimation(BuildContext context, Widget child, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: _driveDefaultAnimation(animation),
      child: child,
    );
  }

  Animation<double> _driveDefaultAnimation(Animation<double> parent) {
    return CurvedAnimation(
      parent: parent,
      curve: Curves.decelerate,
    ).drive(Tween<double>(begin: 0, end: 1));
  }

  void blocListener(BuildContext context, WidgetInfiniteListBlocState state) {
    if (state is WidgetInfiniteListBlocStateLoadBottom &&
        state.displayBottomLoading &&
        widget.loadBottomData != null) {
      widget.loadBottomData!();
    } else if (state is WidgetInfiniteListBlocStateLoadTop &&
        state.displayTopLoading &&
        widget.loadTopData != null) {
      widget.loadTopData!();
    } else if (state is WidgetInfiniteListBlocStateRefresh && widget.refreshOnSwipe != null) {
      widget.refreshOnSwipe!();
    }
  }

  bool onScrollNotification(UserScrollNotification notification, WidgetInfiniteListBlocState state) {
    if (notification.metrics.axis == Axis.horizontal) return false;
    bloc.add(WidgetInfiniteListBlocEventUpdateScrollInfo(notification));
    return false;
  }

  void onScrollListener() {
    bloc.add(WidgetInfiniteListBlocEventOnScroll(controller.position));
  }

  @override
  void dispose() {
    controller.removeListener(onScrollListener);
    if (widget.scrollToIndexController == null) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget getMainWidget(WidgetInfiniteListBlocState state) {
    if (widget.hasErrorOccurred) {
      return widget.errorWidget;
    } else if (widget.isLoading) {
      return widget.loadingWidget;
    }
    return Column(
      children: [
        Container(
          height: state.swipeRefreshHeight,
          padding: EdgeInsets.all(8.r),
          child: SpinKitCircle(size: state.swipeRefreshHeight * 0.75, color: primaryColor),
        ),
        AnimatedContainer(
            duration: baseAnimDuration,
            color: widget.backgroundColor ?? Colors.transparent,
            child: (state.displayTopLoading && !widget.hasReachedTop)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SpinKitFadingFour(
                      size: 32.r,
                      color: widget.loadingIndicatorColor ?? primaryColor,
                    ),
                  )
                : SizedBox(width: 64.w, height: 0)),
        Expanded(
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) => onScrollNotification(notification, state),
            child: ImplicitlyAnimatedList(
              itemData: widget.items,
              padding: widget.padding,
              reverse: widget.reverse,
              physics: widget.scrollPhysics,
              controller: controller,
              shrinkWrap: widget.shrinkWrap ?? false,
              itemBuilder: (context, data) => widget.builder(context, data),
              itemEquality: widget.itemEquality ?? (f, s) => f == s,
              insertDuration: widget.animationDuration ?? baseAnimDuration,
              deleteDuration: widget.animationDuration ?? baseAnimDuration,
              deleteAnimation: widget.deleteAnimation ?? _defaultAnimation,
              insertAnimation: widget.insertAnimation ?? _defaultAnimation,
            ),
          ),
        ),
        AnimatedContainer(
            duration: baseAnimDuration,
            color: widget.backgroundColor ?? Colors.transparent,
            child: (state.displayBottomLoading && !widget.hasReachedBottom)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SpinKitFadingFour(
                      size: 32.r,
                      color: widget.loadingIndicatorColor ?? primaryColor,
                    ),
                  )
                : SizedBox(width: 64.w, height: 0)),
      ],
    );
  }
}
