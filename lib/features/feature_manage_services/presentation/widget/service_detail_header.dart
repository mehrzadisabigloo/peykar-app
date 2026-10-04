import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../feature_manage_products/presentation/widget/product_detail_shimmer.dart';
import '../../domain/entity/manage_services_entity.dart';

class ServiceDetailHeader extends StatelessWidget {
  final ManageServicesEntity service;
  final PageController pageController;

  const ServiceDetailHeader({
    super.key,
    required this.service,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final formatter = intl.NumberFormat('#,###');

    return Stack(
      children: [
        SizedBox(
          height: 300.h,
          width: double.infinity,
          child: Stack(
            children: [
              service.images.isNotEmpty
                  ? PageView.builder(
                      controller: pageController,
                      itemCount: service.images.length,
                      itemBuilder: (context, index) {
                        return CachedNetworkImage(
                          imageUrl: service.images[index],
                          fit: BoxFit.contain,
                          errorWidget: (_, _, _) =>
                              _buildDetailPlaceholder(colorScheme),
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
                    children:
                        service.images.asMap().entries.map((entry) {
                      final index = entry.key;
                      return AnimatedBuilder(
                        animation: pageController,
                        builder: (context, child) {
                          double selectedness = 0.0;
                          if (pageController.hasClients &&
                              pageController.page != null) {
                            selectedness = (1.0 -
                                    (index - pageController.page!).abs())
                                .clamp(0.0, 1.0);
                          } else if (index == 0) {
                            selectedness = 1.0;
                          }

                          return Container(
                            width: 8.w + (8.w * selectedness),
                            height: 8.h,
                            margin:
                                EdgeInsets.symmetric(horizontal: 4.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: colorScheme.primary.withValues(
                                  alpha: 0.2 + (0.8 * selectedness)),
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
        Positioned(
          top: 20.h,
          left: 20.w,
          child: Row(
            children: [
              _buildCircleButton(
                Icons.favorite_border_rounded,
                colorScheme,
                () {},
              ),
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
                        CstmSnackBar.showError(
                            context, 'خطا در برقراری تماس');
                      }
                    }
                  } else {
                    CstmSnackBar.showError(context, 'شماره تماس یافت نشد');
                  }
                },
              ),
            ],
          ),
        ),
        Positioned(
          top: 200.h,
          left: 24.w,
          right: 24.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 24.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: colorScheme.surface.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                    color: colorScheme.surface.withValues(alpha: 0.2),
                    width: 1,
                  ),
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
                            color: colorScheme.onSurface
                                .withValues(alpha: 0.6),
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
                            color: colorScheme.onSurface
                                .withValues(alpha: 0.6),
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
      ],
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

  Widget _buildCircleButton(
      IconData icon, ColorScheme colorScheme, VoidCallback onTap) {
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
}
