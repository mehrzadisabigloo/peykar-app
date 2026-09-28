import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/resources/consts.dart';
import '../../../../features/panel_admin_features/feature_occupation/domain/entity/occupation_entity.dart';

class JobCategoriesGrid extends StatelessWidget {
  final List<OccupationEntity> occupations;

  const JobCategoriesGrid({super.key, required this.occupations});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemCount: occupations.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final occupation = occupations[index];
            return CategoryItem(occupation: occupation);
          },
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  static Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
      child: Text(
        'دسته‌های شغلی',
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w900,
          color: theme.colorScheme.onSurface,
          fontFamily: 'BonyadeKoodak',
        ),
      ),
    );
  }

  static Widget buildHeader(BuildContext context) => _buildHeader(context);
}

class CategoryItem extends StatelessWidget {
  final OccupationEntity occupation;
  const CategoryItem({super.key, required this.occupation});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color itemColor = _parseColor(context, occupation.color);

    return GestureDetector(
      onTap: () {
        context.pushNamed(
          'category_detail',
          pathParameters: {'title': occupation.title ?? ''},
          queryParameters: {'occupation_id': occupation.id ?? ''},
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: itemColor.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(32.r),
          border: Border.all(
            color: itemColor.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Right Side: Image with Overlay Icon
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 90.r,
                  height: 90.r,
                  margin: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.r),
                    child: occupation.imageId != null && occupation.imageId!.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: '${Consts.baseFileUrl}${occupation.imageId}',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(
                              child: SizedBox(
                                width: 20.r,
                                height: 20.r,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: itemColor,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => Icon(
                              _getIconForTitle(occupation.title ?? ''),
                              size: 32.sp,
                              color: itemColor.withValues(alpha: 0.3),
                            ),
                          )
                        : Icon(
                            _getIconForTitle(occupation.title ?? ''),
                            size: 32.sp,
                            color: itemColor.withValues(alpha: 0.3),
                          ),
                  ),
                ),
                // Small overlay icon
                Positioned(
                  bottom: 8.r,
                  right: 8.r, // Positioned on the outer side (right bottom)
                  child: Container(
                    width: 35.r,
                    height: 35.r,
                    decoration: BoxDecoration(
                      color: itemColor,
                      borderRadius: BorderRadius.circular(15.r),

                      border: Border.all(
                        color: theme.colorScheme.surface,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      _getIconForTitle(occupation.title ?? ''),
                      size: 14.sp,
                      color: theme.colorScheme.surface,
                    ),
                  ),
                ),
              ],
            ),

            // Middle: Text Section
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      occupation.title ?? '—',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w900,
                        color: theme.colorScheme.onSurface,
                        fontFamily: 'BonyadeKoodak',
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'مشاهده تعمیرگاه‌های نزدیک',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                        fontFamily: 'BonyadeKoodak',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Left Side: Arrow Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                width: 32.r,
                height: 32.r,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: itemColor.withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: SvgPicture.asset(
                    'assets/svgs/left_arrow.svg',
                    colorFilter: ColorFilter.mode(itemColor, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForTitle(String title) {
    if (title.contains('برق')) return Icons.bolt_rounded;
    if (title.contains('تعویض روغنی') || title.contains('اتو سرویس')) return Icons.opacity_rounded;
    if (title.contains('نقاشی') || title.contains('صافکاری')) return Icons.format_paint_rounded;
    if (title.contains('تنظیم موتور')) return Icons.settings_outlined;
    if (title.contains('جلوبندی')) return Icons.build_rounded;
    if (title.contains('مکانیک')) return Icons.engineering_rounded;
    if (title.contains('باتری')) return Icons.battery_charging_full_rounded;
    if (title.contains('گیربکس')) return Icons.settings_input_component_rounded;
    if (title.contains('شیشه')) return Icons.web_asset_rounded;
    if (title.contains('قفل')) return Icons.lock_outline_rounded;
    if (title.contains('لاستیک')) return Icons.tire_repair_rounded;
    return Icons.more_horiz_rounded;
  }

  Color _parseColor(BuildContext context, String? hexColor) {
    if (hexColor == null || hexColor.isEmpty) return Theme.of(context).colorScheme.primary;
    try {
      String hex = hexColor.replaceAll('#', '');
      if (hex.length == 6) hex = 'FF$hex';
      return Color(int.parse(hex, radix: 16));
    } catch (e) {
      return Theme.of(context).colorScheme.primary;
    }
  }
}
