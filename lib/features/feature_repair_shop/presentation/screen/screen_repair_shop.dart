import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../domain/entity/repair_shop_entity.dart';
import '../base/base_repair_shop_stateful_widget_state.dart';
import '../bloc/repair_shop_bloc.dart';
import '../../../feature_manage_products/presentation/widget/product_card.dart' as product_widget;
import '../../../feature_manage_services/presentation/widget/service_card.dart' as service_widget;

/// ============================================================================
///  WORKSHOP DETAIL SCREEN  —  صفحه جزئیات تعمیرگاه
/// ----------------------------------------------------------------------------
///  Refactored to be Theme-based and use Feature-State structure.
/// ============================================================================

// ─────────────────────────────────────────────────────────────────────────────
//  PERSIAN NUMBER / PRICE HELPERS
// ─────────────────────────────────────────────────────────────────────────────
class PersianFormatter {
  PersianFormatter._();

  static const List<String> _fa = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  static String digits(String input) {
    final buffer = StringBuffer();
    for (final rune in input.runes) {
      final char = String.fromCharCode(rune);
      final digit = int.tryParse(char);
      buffer.write(digit != null ? _fa[digit] : char);
    }
    return buffer.toString();
  }

  static String price(int value) {
    final raw = value.toString();
    final grouped = raw.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (m) => ',',
    );
    return digits(grouped);
  }
}

class ScreenRepairShop extends StatefulWidget {
  final String repairmanId;
  const ScreenRepairShop({super.key, required this.repairmanId});

  @override
  State<ScreenRepairShop> createState() => _ScreenRepairShopState();
}

class _ScreenRepairShopState extends BaseRepairShopStatefulWidgetState<ScreenRepairShop, RepairShopBloc> with SingleTickerProviderStateMixin {
  _ScreenRepairShopState() : super(locator<RepairShopBloc>());

  static const List<String> _tabs = ['اطلاعات', 'نظرات', 'محصولات', 'خدمات'];
  late TabController _tabController;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this, initialIndex: 3);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {});
      }
    });
    bloc.add(FetchRepairShopDataEvent(widget.repairmanId));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final theme = Theme.of(context);

    return BlocBuilder<RepairShopBloc, RepairShopState>(
      builder: (context, state) {
        if (state is RepairShopLoading) {
          return Scaffold(
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        if (state is RepairShopError) {
          return Scaffold(
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
            body: ErrorStateWidget(
              message: state.message,
              onRetry: () => bloc.add(FetchRepairShopDataEvent(widget.repairmanId)),
            ),
          );
        }
        if (state is RepairShopLoaded) {
          final workshop = state.entity;

          return Stack(
            children: [
              CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  // 1. Hero Image as SliverAppBar
                  SliverAppBar(
                    expandedHeight: 300.h,
                    automaticallyImplyLeading: false,
                    backgroundColor: theme.colorScheme.surface,
                    flexibleSpace: FlexibleSpaceBar(
                      background: _buildHeroImage(workshop),
                    ),
                    // Overlay container for rounded corners
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(32.h),
                      child: Container(
                        height: 32.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F9FB),
                          borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
                        ),
                        child: Container(
                          width: 40.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.outline,
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 2. Main Content
                  SliverToBoxAdapter(
                    child: Container(
                      color: const Color(0xFFF8F9FB),
                      child: Column(
                        children: [
                          _buildShopHeaderCard(workshop),
                          SizedBox(height: 16.h),
                          _buildTabBar(),
                          SizedBox(height: 16.h),
                          _buildTabContent(workshop),
                          SizedBox(height: 120.h), // Space for bottom bar
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // 3. Fixed Bottom Bar
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _buildBottomBar(),
              ),

              // 4. Back Button (Standard style)
              // Positioned(
              //   top: MediaQuery.of(context).padding.top + 12.h,
              //   right: 16.w,
              //   child: _CircularIconButton(
              //     icon: Icons.arrow_forward_ios_rounded, // RTL Back
              //     onTap: () => context.pop(),
              //     backgroundColor: Colors.white.withValues(alpha: 0.9),
              //   ),
              // ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  //  1) HERO IMAGE  +  FAVORITE BUTTON
  // ───────────────────────────────────────────────────────────────────────────
  Widget _buildHeroImage(RepairShopEntity workshop) {
    final topInset = MediaQuery.of(context).padding.top;
    final theme = Theme.of(context);

    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: workshop.imageUrl,
          width: double.infinity,
          height: 320.h + topInset,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            width: double.infinity,
            height: 320.h + topInset,
            color: theme.colorScheme.surfaceContainerHighest,
            child: const Center(child: CircularProgressIndicator()),
          ),
          errorWidget: (_, _, _) => Container(
            width: double.infinity,
            height: 320.h + topInset,
            color: theme.colorScheme.primary.withAlpha(204), // 0.8 * 255 = 204
            alignment: Alignment.center,
            child: Icon(
              Icons.car_repair_rounded,
              color: Colors.white.withValues(alpha: 0.35),
              size: 64.sp,
            ),
          ),
        ),

        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: IgnorePointer(
            child: Container(
              height: topInset + 56.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.35),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ),

        Positioned(
          top: topInset + 12.h,
          left: 16.w,
          child: _FavoriteButton(
            isFavorite: _isFavorite,
            onTap: () {
              setState(() => _isFavorite = !_isFavorite);
              // TODO: bloc.add(ToggleFavoriteEvent(workshop.id));
            },
          ),
        ),
      ],
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  //  2) SHOP HEADER CARD
  // ───────────────────────────────────────────────────────────────────────────
  Widget _buildShopHeaderCard(RepairShopEntity w) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withAlpha(20), // 0.08 * 255 = 20
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 64.w,
                height: 64.w,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Icon(
                  Icons.directions_car_filled_rounded,
                  color: theme.colorScheme.onPrimary,
                  size: 32.sp,
                ),
              ),
              SizedBox(width: 12.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4.h),
                    Text(
                      w.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontSize: 17.sp,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        Text(
                          PersianFormatter.digits(w.rating.toStringAsFixed(1)),
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Icon(
                          Icons.thumb_up_alt_rounded,
                          size: 13.sp,
                          color: theme.colorScheme.primary,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          '(${PersianFormatter.digits(w.reviewsCount.toString())} نظر)',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 14.h),

          Row(
            children: [
              Icon(
                Icons.star_rounded,
                size: 20.sp,
                color: Colors.amber,
              ),
              SizedBox(width: 4.w),
              Text(
                PersianFormatter.digits(w.rating.toStringAsFixed(1)),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withAlpha(20),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: theme.colorScheme.primary.withAlpha(46), // 0.18 * 255 = 46
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  size: 16.sp,
                  color: theme.colorScheme.primary,
                ),
                SizedBox(width: 6.w),
                Text(
                  '${PersianFormatter.digits(w.distance.toString())} کیلومتر',
                  style: TextStyle(
                    fontSize: 12.5.sp,
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  //  3) TAB BAR
  // ───────────────────────────────────────────────────────────────────────────
  Widget _buildTabBar() {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      height: 48.h,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withAlpha(15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        unselectedLabelColor: theme.colorScheme.onSurface.withAlpha(150),
        labelStyle: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w800,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: theme.colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withAlpha(60),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        tabs: _tabs.map((t) => Tab(text: t)).toList(),
      ),
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  //  4) TAB CONTENT
  // ───────────────────────────────────────────────────────────────────────────
  Widget _buildTabContent(RepairShopEntity workshop) {
    switch (_tabController.index) {
      case 0:
        return _buildInfoTab(workshop);
      case 2:
        return _buildProductsList(workshop);
      case 3:
        return _buildServicesList(workshop);
      default:
        return _buildPlaceholderTab(_tabs[_tabController.index]);
    }
  }

  Widget _buildInfoTab(RepairShopEntity workshop) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withAlpha(20),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow(Icons.phone_rounded, 'شماره تماس', workshop.mobile ?? '—'),
          SizedBox(height: 16.h),
          _buildInfoRow(Icons.location_on_rounded, 'آدرس', workshop.address ?? '—'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, size: 20.sp, color: theme.colorScheme.primary),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: theme.textTheme.bodySmall),
            SizedBox(height: 4.h),
            Text(value, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  Widget _buildServicesList(RepairShopEntity workshop) {
    if (workshop.servicesError != null) {
      return ErrorStateWidget(
        message: workshop.servicesError!,
        onRetry: () => bloc.add(FetchRepairShopDataEvent(widget.repairmanId)),
      );
    }

    final services = workshop.activeServices;

    if (services.isEmpty) {
      return const EmptyStateWidget(
        title: 'سرویسی یافت نشد',
        description: 'در حال حاضر سرویسی برای این تعمیرگاه ثبت نشده است.',
        icon: Icons.build_circle_outlined,
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: services.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        return service_widget.ServiceCard(
          service: services[index],
          onTap: () => context.pushNamed(
            'service_detail',
            pathParameters: {'serviceId': services[index].id},
          ),
        );
      },
    );
  }

  Widget _buildProductsList(RepairShopEntity workshop) {
    if (workshop.productsError != null) {
      return ErrorStateWidget(
        message: workshop.productsError!,
        onRetry: () => bloc.add(FetchRepairShopDataEvent(widget.repairmanId)),
      );
    }

    final products = workshop.products;

    if (products.isEmpty) {
      return const EmptyStateWidget(
        title: 'محصولی یافت نشد',
        description: 'در حال حاضر محصولی برای این تعمیرگاه ثبت نشده است.',
        icon: Icons.shopping_bag_outlined,
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: products.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        return product_widget.ProductCard(
          product: products[index],
          onTap: () {
            context.pushNamed(
              'product_detail',
              pathParameters: {'productId': products[index].id},
            );
          },
        );
      },
    );
  }

  Widget _buildPlaceholderTab(String title) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 48.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withAlpha(20), // 0.08 * 255 = 20
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.inbox_rounded,
              size: 40.sp,
              color: theme.colorScheme.outline,
            ),
            SizedBox(height: 12.h),
            Text(
              'محتوای بخش «$title» به‌زودی اضافه می‌شود',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.textTheme.bodySmall?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  //  5) BOTTOM CTA
  // ───────────────────────────────────────────────────────────────────────────
  Widget _buildBottomBar() {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.fromLTRB(
        16.w,
        12.h,
        16.w,
        12.h + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FB),
        border: Border(
          top: BorderSide(color: theme.colorScheme.outline.withAlpha(51), width: 1), // 0.2 * 255 = 51
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 54.h,
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed('booking');
          },
          child: Text(
            'رزرو نوبت',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onTap;

  const _FavoriteButton({required this.isFavorite, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(14.r),
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14.r),
        child: Container(
          width: 44.w,
          height: 44.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, anim) =>
                ScaleTransition(scale: anim, child: child),
            child: Icon(
              isFavorite
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              key: ValueKey(isFavorite),
              size: 22.sp,
              color: isFavorite ? Colors.redAccent : theme.colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

class _CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? backgroundColor;

  const _CircularIconButton({
    required this.icon,
    required this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: backgroundColor ?? Colors.transparent,
      borderRadius: BorderRadius.circular(12.r),
      elevation: backgroundColor != null ? 2 : 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          width: 40.w,
          height: 40.w,
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: 20.sp,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
