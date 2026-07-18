import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class BaseWidgetState<T extends StatefulWidget> extends State<T> {
  Duration get baseAnimDuration => const Duration(milliseconds: 500);
  Duration get baseAnimDurationShort => const Duration(milliseconds: 300);
  Duration get baseAnimDurationShorter => const Duration(milliseconds: 150);

  Color get primaryColor => Theme.of(context).colorScheme.primary;
  Color primaryColorLight(BuildContext context) => const Color(0xffc6c6c6);
  Color get secondaryColor => Theme.of(context).colorScheme.secondary;
  Color get canvasColor => Theme.of(context).canvasColor;
  Color get colorDivider => Theme.of(context).dividerColor;
  Color get onPrimary => Theme.of(context).colorScheme.onPrimaryContainer;
  Color get colorError => Theme.of(context).colorScheme.error;
  Color get colorGreyText => const Color(0xff707070);
  Color get colorGreyOutline => const Color(0xffeeeeee);
  Color get colorGreyTextDark => const Color(0xff555555);
  Color get colorGreyTextLight => const Color(0xffaaaaaa);
  Color get colorShimmerBase => primaryColorLight(context).withAlpha(150);
  Color get shimmerHighlightColor => Colors.white.withAlpha(150);

  SizedBox get verySmallVerticalGap => SizedBox(height: 4.r);
  SizedBox get smallVerticalGap => SizedBox(height: 8.r);
  SizedBox get mediumVerticalGap => SizedBox(height: 16.r);
  SizedBox get largeVerticalGap => SizedBox(height: 24.r);
  SizedBox get extraLargeVerticalGap => SizedBox(height: 32.r);
  SizedBox get smallHorizontalGap => SizedBox(width: 8.r);
  SizedBox get mediumHorizontalGap => SizedBox(width: 16.r);
  SizedBox get largeHorizontalGap => SizedBox(width: 24.r);
  SizedBox get extraLargeHorizontalGap => SizedBox(width: 32.r);

  double get fontSizeSmall => 11.r;
  double get fontSizeMedium => 14.r;
  double get fontSizeLarge => 18.r;
  double get fontSizeBig => 24.r;
  double get fontSizeExtraLarge => 32.r;
  double get fontSizeExtraExtraLarge => 48.r;
  double get fontSizeSuperExtraLarge => 64.r;

  Animation<Offset> driveOffsetAnimation(Animation<double> parent) {
    bool fromRight = Random().nextInt(2) == 0;
    return CurvedAnimation(
      parent: parent,
      curve: Curves.easeInOutQuad,
    ).drive(Tween<Offset>(begin: Offset(fromRight ? 1 : -1, 0), end: Offset.zero));
  }

  Animation<double> driveDoubleAnimation(Animation<double> animation) {
    return CurvedAnimation(parent: animation, curve: Curves.decelerate)
        .drive(Tween<double>(begin: 0, end: 1));
  }

  Widget defaultAnimation(
    BuildContext context,
    Widget child,
    Animation<double> animation,
  ) {
    return SlideTransition(
        position: driveOffsetAnimation(animation),
        child: ScaleTransition(scale: driveDoubleAnimation(animation), child: child));
  }
}
