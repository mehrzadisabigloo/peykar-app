import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import '../../domain/entity/manage_services_entity.dart';

class ServiceCard extends StatelessWidget {
  final ManageServicesEntity service;
  final VoidCallback? onTap;

  const ServiceCard({
    super.key,
    required this.service,
    this.onTap,
  });

  Widget _buildPlaceholder() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE8EAF6), // Indigo 50
            Color(0xFFF5F5F5), // Grey 100
          ],
        ),
      ),
      child: Icon(
        Icons.build_circle_outlined,
        color: Colors.indigo.withValues(alpha: 0.3),
        size: 30.sp,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat('#,###');

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24.r),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Service Image
              Container(
                width: 90.r,
                height: 90.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: const Color(0xFFF8F9FE),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: service.imageUrl.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: service.imageUrl,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => _buildPlaceholder(),
                          placeholder: (context, url) => Container(
                            color: Colors.grey[200],
                          ),
                        )
                      : _buildPlaceholder(),
                ),
              ),
              SizedBox(width: 16.w),
              // Content Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            service.name,
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF1A1C1E),
                              letterSpacing: -0.5,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        _buildStatusBadge(service.status),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      service.description,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF74777F).withValues(alpha: 0.8),
                        height: 1.3,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Enhanced Integrated Range UI
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'محدوده قیمت:',
                                style: TextStyle(
                                  fontSize: 9.sp,
                                  color: const Color(0xFFC4C6CF),
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // SizedBox(width: 50.w,),
                                  // Start Price + Circle
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        formatter.format(service.priceMin),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.indigo.shade900,
                                        ),
                                      ),
                                      SizedBox(width: 15.w),
                                      Container(
                                        width: 8.r,
                                        height: 8.r,
                                        decoration: BoxDecoration(
                                          color: Colors.indigo.shade300,
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.white, width: 1.5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.indigo.withValues(alpha: 0.2),
                                              blurRadius: 4,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Connecting Line (Refined width)
                                  Container(
                                    height: 2.h,
                                    width: 50.w,
                                    margin: EdgeInsets.symmetric(horizontal: 8.w), // Increased margin to make line smaller
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.indigo.shade200,
                                          Colors.indigo.shade50,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(1.r),
                                    ),
                                  ),
                                  // End Circle + Price
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 8.r,
                                        height: 8.r,
                                        decoration: BoxDecoration(
                                          color: Colors.indigo.shade300,
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.white, width: 1.5),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.indigo.withValues(alpha: 0.2),
                                              blurRadius: 4,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 15.w),
                                      Text(
                                        formatter.format(service.priceMax),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.indigo.shade900,
                                        ),
                                      ),
                                      SizedBox(width: 6.w),

                                      Text(
                                        'تومان',
                                        style: TextStyle(
                                          fontSize: 9.sp,
                                          color: Colors.indigo.shade400,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    final isActive = status == 'Active';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: (isActive ? Colors.green : Colors.orange).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        isActive ? 'فعال' : 'غیرفعال',
        style: TextStyle(
          fontSize: 10.sp,
          color: isActive ? Colors.green.shade700 : Colors.orange.shade800,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
