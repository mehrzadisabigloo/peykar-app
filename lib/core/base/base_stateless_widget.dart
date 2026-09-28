import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({super.key});

  Duration get baseAnimDuration => const Duration(milliseconds: 500);
  Duration get baseAnimDurationShort => const Duration(milliseconds: 300);
  Duration get baseAnimDurationShorter => const Duration(milliseconds: 150);

  SizedBox get verySmallVerticalGap => SizedBox(height: 4.r);
  SizedBox get smallVerticalGap => SizedBox(height: 8.r);
  SizedBox get mediumVerticalGap => SizedBox(height: 16.r);
  SizedBox get largeVerticalGap => SizedBox(height: 24.r);
  SizedBox get verySmallHorizontalGap => SizedBox(width: 4.r);
  SizedBox get smallHorizontalGap => SizedBox(width: 8.r);
  SizedBox get mediumHorizontalGap => SizedBox(width: 16.r);
  SizedBox get largeHorizontalGap => SizedBox(width: 24.r);

  Color primaryColor(BuildContext context) => Theme.of(context).colorScheme.primary;
  Color primaryColorLight(BuildContext context) => Theme.of(context).colorScheme.primaryContainer;
  Color secondaryColor(BuildContext context) => Theme.of(context).colorScheme.secondary;
  Color canvasColor(BuildContext context) => Theme.of(context).canvasColor;
  Color colorDivider(BuildContext context) => Theme.of(context).dividerColor;
  Color colorOnPrimary(BuildContext context) => Theme.of(context).colorScheme.onPrimaryContainer;
  Color colorError(BuildContext context) => Theme.of(context).colorScheme.error;
  Color colorGreyText(BuildContext context) => Theme.of(context).colorScheme.onSurfaceVariant;
  Color colorGreyOutline(BuildContext context) => Theme.of(context).colorScheme.outlineVariant;
  Color colorGreyTextDark(BuildContext context) => Theme.of(context).colorScheme.onSurface;
  Color colorGreyTextLight(BuildContext context) => Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.6);

  double get fontSizeSmall => 11.r;
  double get fontSizeMedium => 14.r;
  double get fontSizeLarge => 18.r;
  double get fontSizeBig => 24.r;
  double get fontSizeExtraLarge => 32.r;
  double get fontSizeExtraExtraLarge => 48.r;
  double get fontSizeSuperExtraLarge => 64.r;
}
