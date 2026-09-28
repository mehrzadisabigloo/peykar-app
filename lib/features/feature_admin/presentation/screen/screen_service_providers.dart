import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/themes/theme_main.dart';
import '../base/base_admin_stateful_widget_state.dart';
import '../bloc/admin_bloc.dart';

class ScreenServiceProviders extends StatefulWidget {
  const ScreenServiceProviders({super.key});

  @override
  State<ScreenServiceProviders> createState() => _ScreenServiceProvidersState();
}

class _ScreenServiceProvidersState extends BaseAdminStatefulWidgetState<ScreenServiceProviders, AdminBloc> {
  _ScreenServiceProvidersState() : super(locator<AdminBloc>());

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 100.h),
              physics: const BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildProviderCard(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 16.h),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.04),
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'جستجو در خدمات دهندگان...',
            hintStyle: TextStyle(fontSize: 13.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
            prefixIcon: Icon(Icons.search_rounded, color: Theme.of(context).colorScheme.onSurfaceVariant, size: 22.sp),
            suffixIcon: Icon(Icons.tune_rounded, color: Theme.of(context).colorScheme.primary, size: 20.sp),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          ),
        ),
      ),
    );
  }

  Widget _buildProviderCard(int index) {
    final titles = [
      'تعمیرگاه سرویس یار',
      'انو سرویس دقت',
      'مکانیک پایتخت',
      'برق خودرو شرق',
      'صافکاری نوین'
    ];
    final statuses = ['تایید شده', 'تایید شده', 'در انتظار تایید', 'تایید شده', 'غیرفعال'];
    final statusColors = [
      StatusColors.of(context).success,
      StatusColors.of(context).success,
      StatusColors.of(context).warning,
      StatusColors.of(context).success,
      Theme.of(context).colorScheme.error,
    ];

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 56.r,
            height: 56.r,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(Icons.storefront_rounded, color: Theme.of(context).colorScheme.onSurfaceVariant, size: 28.sp),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titles[index],
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.verified_rounded, size: 14.sp, color: StatusColors.of(context).info),
                    SizedBox(width: 4.w),
                    Text(
                      'تایید شده توسط زینو',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buildStatusBadge(statuses[index], statusColors[index]),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 10.sp,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
