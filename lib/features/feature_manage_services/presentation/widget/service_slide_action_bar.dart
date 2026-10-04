import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/cstm_snakbar.dart';

class ServiceSlideActionBar extends StatefulWidget {
  const ServiceSlideActionBar({super.key});

  @override
  State<ServiceSlideActionBar> createState() => _ServiceSlideActionBarState();
}

class _ServiceSlideActionBarState extends State<ServiceSlideActionBar> {
  double _slideValue = 0.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: 64.h,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(40.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final trackWidth = constraints.maxWidth;
          final handleSize = 52.h;
          final maxSlide = trackWidth - handleSize - 12.r;

          return Stack(
            children: [
              Positioned(
                left: 24.w,
                top: 0,
                bottom: 0,
                child: Row(
                  children: [
                    Icon(Icons.chevron_right_rounded,
                        color: colorScheme.primary.withValues(alpha: 0.2),
                        size: 24.sp),
                    Icon(Icons.chevron_right_rounded,
                        color: colorScheme.primary.withValues(alpha: 0.5),
                        size: 24.sp),
                    Icon(Icons.chevron_right_rounded,
                        color: colorScheme.primary, size: 24.sp),
                  ],
                ),
              ),
              Center(
                child: Opacity(
                  opacity: (1 - (_slideValue / maxSlide)).clamp(0.2, 1.0),
                  child: Text(
                    'بکشید برای درخواست سرویس',
                    style: TextStyle(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: _slideValue == 0 || _slideValue == maxSlide
                    ? const Duration(milliseconds: 300)
                    : Duration.zero,
                curve: Curves.easeOut,
                right: 6.r + _slideValue,
                top: 6.r,
                bottom: 6.r,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      _slideValue -= details.primaryDelta!;
                      _slideValue = _slideValue.clamp(0.0, maxSlide);
                    });
                  },
                  onHorizontalDragEnd: (details) {
                    if (_slideValue >= maxSlide * 0.8) {
                      setState(() {
                        _slideValue = maxSlide;
                      });
                      CstmSnackBar.showInfo(
                          context, 'درخواست سرویس ثبت شد. با شما تماس می‌گیریم.');
                      Future.delayed(const Duration(seconds: 1), () {
                        if (mounted) setState(() => _slideValue = 0.0);
                      });
                    } else {
                      setState(() => _slideValue = 0.0);
                    }
                  },
                  child: Container(
                    width: handleSize,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(30.r),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.handyman_rounded,
                        color: colorScheme.onPrimary,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ),
              if (_slideValue >= maxSlide * 0.9)
                Center(
                  child: Text(
                    'انجام شد',
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
