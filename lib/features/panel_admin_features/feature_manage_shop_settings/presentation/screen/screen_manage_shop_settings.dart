import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../../core/services/locator.dart';
import '../../../../../../core/widgets/cstm_snakbar.dart';
import '../../../../../../core/widgets/error_state_widget.dart';
import '../../../../../../core/widgets/management_card_shimmer.dart';
import '../../../../../../core/themes/theme_main.dart';
import '../base/base_manage_shop_settings_stateful_widget_state.dart';
import '../bloc/manage_shop_settings_bloc.dart';
import '../../data/model/shop_setting_model.dart';

class ScreenManageShopSettings extends StatefulWidget {
  const ScreenManageShopSettings({super.key});

  @override
  State<ScreenManageShopSettings> createState() => _ScreenManageShopSettingsState();
}

class _ScreenManageShopSettingsState extends BaseManageShopSettingsStatefulWidgetState<ScreenManageShopSettings, ManageShopSettingsBloc> {
  _ScreenManageShopSettingsState() : super(locator<ManageShopSettingsBloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(FetchShopSettingsEvent());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      body: BlocConsumer<ManageShopSettingsBloc, ManageShopSettingsState>(
        listener: (context, state) {
          if (state is ShopSettingsLoaded) {
            if (state.successMessage != null) {
              CstmSnackBar.showSuccess(context, state.successMessage!);
            }
            if (state.errorMessage != null) {
              CstmSnackBar.showError(context, state.errorMessage!);
            }
          }
          if (state is ManageShopSettingsError) {
             CstmSnackBar.showError(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is ManageShopSettingsInitial || state is ManageShopSettingsLoading) {
            return ListView.builder(
              padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 100.h),
              itemCount: 2,
              itemBuilder: (context, index) => const ManagementCardShimmer(height: 120),
            );
          }

          if (state is ManageShopSettingsError && state is! ShopSettingsLoaded) {
            return ErrorStateWidget(
              message: state.message,
              onRetry: () => bloc.add(FetchShopSettingsEvent()),
            );
          }

          if (state is ShopSettingsLoaded) {
            final settings = state.settings;
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 12.h),
                    child: _buildModernHint(context),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = settings[index];
                        return _buildCleanActionCard(context, item, state);
                      },
                      childCount: settings.length,
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 40.h)),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildModernHint(BuildContext context) {
    final statusColors = StatusColors.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: statusColors.info.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: statusColors.info.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.tips_and_updates_rounded, color: statusColors.info, size: 22.sp),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  'تغییر وضعیت سرویس‌ها روی دسترسی تمامی کاربران اعمال می‌شود.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    height: 1.5,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCleanActionCard(BuildContext context, ShopSettingModel item, ShopSettingsLoaded state) {
    final colorScheme = Theme.of(context).colorScheme;
    final isProcessing = state.processingKey == item.key;
    final isActive = item.isActive ?? false;

    IconData iconData = Icons.storefront_rounded;
    Color themeColor = colorScheme.primary;

    if (item.key == 'admin_shop') {
      iconData = Icons.admin_panel_settings_rounded;
      themeColor = DashboardColors.of(context).adminTeal;
    } else if (item.key == 'repairers_shop') {
      iconData = Icons.handyman_rounded;
      themeColor = DashboardColors.of(context).adminIndigo;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Row(
          children: [
            // Icon section
            Container(
              width: 54.r,
              height: 54.r,
              decoration: BoxDecoration(
                color: themeColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(iconData, color: themeColor, size: 28.sp),
            ),
            SizedBox(width: 16.w),
            // Text info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.label ?? '',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w900,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Container(
                        width: 8.r,
                        height: 8.r,
                        decoration: BoxDecoration(
                          color: isActive ? StatusColors.of(context).success : colorScheme.outline,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        isActive ? 'در حال فعالیت' : 'غیرفعال شده',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: isActive ? StatusColors.of(context).success : colorScheme.onSurface.withValues(alpha: 0.4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Action switch
            isProcessing
                ? SizedBox(
                    width: 24.r,
                    height: 24.r,
                    child: CircularProgressIndicator(strokeWidth: 3, color: themeColor),
                  )
                : _buildCustomToggle(isActive, themeColor, () {
                    bloc.add(ChangeShopStatusEvent(item.key!));
                  }),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomToggle(bool isActive, Color activeColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 58.w,
        height: 32.h,
        padding: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
          color: isActive ? activeColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutBack,
          alignment: isActive ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 24.r,
            height: 24.r,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              isActive ? Icons.check_rounded : Icons.close_rounded,
              size: 14.sp,
              color: isActive ? activeColor : Colors.grey[400],
            ),
          ),
        ),
      ),
    );
  }
}
