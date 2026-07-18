import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../feature_manage_products/domain/entity/repairman_entity.dart';
import '../../domain/entity/manage_services_entity.dart';
import '../base/base_manage_services_stateful_widget_state.dart';
import '../bloc/service_detail/service_detail_bloc.dart';
import '../../../feature_manage_products/presentation/widget/product_detail_shimmer.dart';

class ScreenServiceDetail extends StatefulWidget {
  final String serviceId;

  const ScreenServiceDetail({
    super.key,
    required this.serviceId,
  });

  @override
  State<ScreenServiceDetail> createState() => _ScreenServiceDetailState();
}

class _ScreenServiceDetailState
    extends BaseManageServicesStatefulWidgetState<ScreenServiceDetail, ServiceDetailBloc> {
  _ScreenServiceDetailState() : super(locator<ServiceDetailBloc>());

  final PageController _pageController = PageController();
  double _slideValue = 0.0;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    bloc.add(FetchServiceDetail(widget.serviceId));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    // Teal-focused theme for services
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme.copyWith(
      primary: Colors.teal,
      onPrimary: Colors.white,
      primaryContainer: Colors.teal.shade100,
      onPrimaryContainer: Colors.teal.shade900,
    );
    final textTheme = theme.textTheme;

    return Theme(
      data: theme.copyWith(colorScheme: colorScheme),
      child: BlocBuilder<ServiceDetailBloc, ServiceDetailState>(
        builder: (context, state) {
          if (state is ServiceDetailLoading) {
            return Scaffold(
              backgroundColor: colorScheme.surface,
              body: const ProductDetailShimmer(), // Reuse shimmer
            );
          }
          if (state is ServiceDetailError) {
            return Scaffold(
              backgroundColor: colorScheme.surface,
              body: ErrorStateWidget(
                message: state.message,
                onRetry: () => bloc.add(FetchServiceDetail(widget.serviceId)),
              ),
            );
          }
          if (state is ServiceDetailLoaded) {
            final service = state.service;
            final formatter = intl.NumberFormat('#,###');

            return Scaffold(
              backgroundColor: colorScheme.surface,
              body: Stack(
                children: [
                  // 1. Background Image Layer
                  SizedBox(
                    height: 300.h,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        service.images.isNotEmpty
                            ? PageView.builder(
                                controller: _pageController,
                                itemCount: service.images.length,
                                itemBuilder: (context, index) {
                                  return CachedNetworkImage(
                                    imageUrl: service.images[index],
                                    fit: BoxFit.contain,
                                    errorWidget: (_, _, _) => _buildDetailPlaceholder(colorScheme),
                                    placeholder: (_, _) => const ProductDetailShimmer(),
                                  );
                                },
                              )
                            : _buildDetailPlaceholder(colorScheme),
                        if (service.images.length > 1)
                          Positioned(
                            top: 20.h,
                            right: 20.w,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: service.images.asMap().entries.map((entry) {
                                final index = entry.key;
                                return AnimatedBuilder(
                                  animation: _pageController,
                                  builder: (context, child) {
                                    double selectedness = 0.0;
                                    if (_pageController.hasClients && _pageController.page != null) {
                                      selectedness = (1.0 - (index - _pageController.page!).abs()).clamp(0.0, 1.0);
                                    } else if (index == 0) {
                                      selectedness = 1.0;
                                    }
                                    
                                    return Container(
                                      width: 8.w + (8.w * selectedness),
                                      height: 8.h,
                                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4.r),
                                        color: colorScheme.primary.withValues(alpha: 0.2 + (0.8 * selectedness)),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                      ],
                    ),
                  ),

                  // 2. Top Navigation Bar
                  Positioned(
                    top: 20.h,
                    left: 20.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            _buildCircleButton(Icons.favorite_border_rounded, colorScheme, () {}),
                            SizedBox(width: 12.w),
                            _buildCircleButton(
                              Icons.call_rounded,
                              colorScheme,
                              () async {
                                final phoneNumber = service.repairman?.mobile ??
                                    (service.repairman?.phoneNumbers?.isNotEmpty == true
                                        ? service.repairman!.phoneNumbers!.first
                                        : null);
                                if (phoneNumber != null) {
                                  final Uri launchUri = Uri(
                                    scheme: 'tel',
                                    path: phoneNumber,
                                  );
                                  try {
                                    await launchUrl(launchUri);
                                  } catch (e) {
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        CstmSnackBar().snackBar(
                                          'خطا در برقراری تماس',
                                          colorScheme.error,
                                        ),
                                      );
                                    }
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    CstmSnackBar().snackBar(
                                      'شماره تماس یافت نشد',
                                      colorScheme.error,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  // 3. Floating Glassmorphism Title Pill
                  Positioned(
                    top: 200.h,
                    left: 24.w,
                    right: 24.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                          decoration: BoxDecoration(
                            color: colorScheme.surface.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(30.r),
                            border: Border.all(color: colorScheme.surface.withValues(alpha: 0.2), width: 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  service.title,
                                  style: TextStyle(
                                    color: colorScheme.onSurface,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'محدوده قیمت',
                                    style: TextStyle(
                                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    '${formatter.format(service.priceMin)} - ${formatter.format(service.priceMax)}',
                                    style: TextStyle(
                                      color: colorScheme.onSurface,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'تومان',
                                    style: TextStyle(
                                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 4. Overlapping Bottom Sheet
                  DraggableScrollableSheet(
                    initialChildSize: 0.61,
                    minChildSize: 0.61,
                    maxChildSize: 0.9,
                    builder: (context, scrollController) {
                      return Container(
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(36.r)),
                          boxShadow: [
                            BoxShadow(
                              color: theme.shadowColor.withValues(alpha: theme.brightness == Brightness.dark ? 0.5 : 0.1),
                              blurRadius: 30,
                              offset: const Offset(0, -10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 12.h, bottom: 16.h),
                              width: 36.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                color: colorScheme.onSurface.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                controller: scrollController,
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 120.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildCreatorRow(service.repairman, colorScheme, textTheme),
                                    SizedBox(height: 24.h),
                                    _buildStatsBox(service, colorScheme, textTheme),
                                    SizedBox(height: 20.h),
                                    _buildTabsSection(colorScheme, textTheme),
                                    SizedBox(height: 20.h),

                                    if (_selectedTabIndex == 0)
                                      Text(
                                        service.description.isNotEmpty
                                            ? service.description
                                            : 'توضیحات این سرویس به‌زودی تکمیل خواهد شد. تیم ما با بهترین تجهیزات آماده خدمت‌رسانی است.',
                                        style: TextStyle(
                                          color: textTheme.bodySmall?.color ?? colorScheme.onSurfaceVariant,
                                          fontSize: 13.sp,
                                          height: 1.6,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    else if (_selectedTabIndex == 1)
                                      Column(
                                        children: [
                                          _buildSpecItem('زمان تقریبی', '۲ ساعت', colorScheme),
                                          _buildSpecItem('تضمین کیفیت', 'دارد', colorScheme),
                                          _buildSpecItem('محل ارائه', 'در محل یا تعمیرگاه', colorScheme),
                                        ],
                                      )
                                    else
                                      Column(
                                        children: [
                                          _buildReviewItem('حسین راد', 'سریع و حرفه‌ای عمل کردند.', 5, colorScheme),
                                          _buildReviewItem('سارا امینی', 'قیمت مناسب و برخورد عالی.', 5, colorScheme),
                                        ],
                                      ),
                                    SizedBox(height: 20.h),
                                    _buildInfoListItem(colorScheme, textTheme),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  // 5. Floating Bottom Action Bar
                  Positioned(
                    bottom: 30.h,
                    left: 24.w,
                    right: 24.w,
                    child: _buildFloatingActionBar(colorScheme),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildDetailPlaceholder(ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primaryContainer,
            colorScheme.surfaceContainerHighest,
          ],
        ),
      ),
      child: Center(
        child: Icon(
          Icons.build_circle_outlined,
          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.2),
          size: 64.sp,
        ),
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, ColorScheme colorScheme, VoidCallback onTap) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: 48.r,
            height: 48.r,
            decoration: BoxDecoration(
              color: colorScheme.surface.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: colorScheme.surface.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Icon(icon, color: colorScheme.onSurface, size: 20.sp),
          ),
        ),
      ),
    );
  }

  Widget _buildCreatorRow(RepairmanEntity? repairman, ColorScheme colorScheme, TextTheme textTheme) {
    final title = repairman?.fullName.isNotEmpty == true ? repairman!.fullName : 'نام تعمیرگاه';
    final subtitle = repairman?.brand?.isNotEmpty == true ? repairman!.brand! : 'متخصص فنی';

    return Row(
      children: [
        Container(
          width: 44.r,
          height: 44.r,
          decoration: BoxDecoration(
            color: colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.handyman_outlined, color: colorScheme.onPrimary, size: 20.sp),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                style: TextStyle(
                  color: textTheme.bodySmall?.color ?? colorScheme.onSurfaceVariant,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              Icon(Icons.verified_user_rounded, color: colorScheme.primary, size: 14.sp),
              SizedBox(width: 6.w),
              Text(
                'تایید شده',
                style: TextStyle(color: colorScheme.primary, fontSize: 12.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildStatsBox(ManageServicesEntity service, ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  'مدت زمان',
                  style: TextStyle(color: textTheme.bodySmall?.color ?? colorScheme.onSurfaceVariant, fontSize: 12.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  '۲-۴ ساعت',
                  style: TextStyle(color: colorScheme.onSurface, fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 40.h,
            color: colorScheme.onSurface.withValues(alpha: 0.1),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  'وضعیت رزرو',
                  style: TextStyle(color: textTheme.bodySmall?.color ?? colorScheme.onSurfaceVariant, fontSize: 12.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  service.status == 'active' ? 'آماده پذیرش' : 'غیرفعال',
                  style: TextStyle(
                      color: service.status == 'active' ? Colors.teal : Colors.red,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabsSection(ColorScheme colorScheme, TextTheme textTheme) {
    final tabs = ['درباره سرویس', 'جزئیات فنی', 'نظرات'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: tabs.asMap().entries.map((entry) {
        final index = entry.key;
        final tab = entry.value;
        final isActive = _selectedTabIndex == index;
        return GestureDetector(
          onTap: () => setState(() => _selectedTabIndex = index),
          child: Container(
            margin: EdgeInsets.only(left: 12.w),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isActive ? colorScheme.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              tab,
              style: TextStyle(
                color: isActive ? colorScheme.onPrimary : (textTheme.bodySmall?.color ?? colorScheme.onSurfaceVariant),
                fontSize: 14.sp,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSpecItem(String label, String value, ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: colorScheme.onSurface.withValues(alpha: 0.6), fontSize: 13.sp)),
          Text(value, style: TextStyle(color: colorScheme.onSurface, fontSize: 13.sp, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String name, String comment, int rating, ColorScheme colorScheme) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: TextStyle(color: colorScheme.onSurface, fontSize: 14.sp, fontWeight: FontWeight.bold)),
              Row(
                children: List.generate(5, (index) => Icon(
                  index < rating ? Icons.star_rounded : Icons.star_outline_rounded,
                  color: Colors.amber,
                  size: 16.sp,
                )),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(comment, style: TextStyle(color: colorScheme.onSurface.withValues(alpha: 0.8), fontSize: 12.sp)),
        ],
      ),
    );
  }

  Widget _buildInfoListItem(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.verified_outlined, color: colorScheme.primary, size: 20.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('تضمین کیفیت زینو',
                    style: TextStyle(color: colorScheme.onSurface, fontSize: 14.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 4.h),
                Text('بازگشت وجه در صورت نارضایتی',
                    style: TextStyle(
                        color: textTheme.bodySmall?.color ?? colorScheme.onSurfaceVariant, fontSize: 11.sp)),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios_rounded,
              color: textTheme.bodySmall?.color ?? colorScheme.onSurfaceVariant, size: 14.sp),
        ],
      ),
    );
  }

  Widget _buildFloatingActionBar(ColorScheme colorScheme) {
    return Container(
      height: 64.h,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(40.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
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
                    Icon(Icons.chevron_right_rounded, color: colorScheme.primary.withValues(alpha: 0.2), size: 24.sp),
                    Icon(Icons.chevron_right_rounded, color: colorScheme.primary.withValues(alpha: 0.5), size: 24.sp),
                    Icon(Icons.chevron_right_rounded, color: colorScheme.primary, size: 24.sp),
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
                duration: _slideValue == 0 || _slideValue == maxSlide ? const Duration(milliseconds: 300) : Duration.zero,
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        CstmSnackBar().snackBar(
                          'درخواست سرویس ثبت شد. با شما تماس می‌گیریم.',
                          colorScheme.primary,
                        ),
                      );
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
