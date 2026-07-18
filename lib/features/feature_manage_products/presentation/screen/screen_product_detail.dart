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
import '../../domain/entity/manage_products_entity.dart';
import '../../domain/entity/repairman_entity.dart';
import '../base/base_manage_products_stateful_widget_state.dart';
import '../bloc/product_detail/product_detail_bloc.dart';
import '../widget/product_detail_shimmer.dart';

class ScreenProductDetail extends StatefulWidget {
  final String productId;

  const ScreenProductDetail({
    super.key,
    required this.productId,
  });

  @override
  State<ScreenProductDetail> createState() => _ScreenProductDetailState();
}

class _ScreenProductDetailState
    extends BaseManageProductsStatefulWidgetState<ScreenProductDetail, ProductDetailBloc> {
  _ScreenProductDetailState() : super(locator<ProductDetailBloc>());

  final PageController _pageController = PageController();
  double _slideValue = 0.0;
  int _selectedTabIndex = 0;
  ManageProductsEntity? _loadedProduct;

  @override
  void initState() {
    super.initState();
    bloc.add(FetchProductDetail(widget.productId));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return BlocListener<ProductDetailBloc, ProductDetailState>(
      listener: (context, state) {
        if (state is AddToCartSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            CstmSnackBar().snackBar(
              state.message,
              colorScheme.primary,
            ),
          );
          setState(() {
            _slideValue = 0.0;
          });
        }
        if (state is AddToCartError) {
          ScaffoldMessenger.of(context).showSnackBar(
            CstmSnackBar().snackBar(
              state.message,
              colorScheme.error,
            ),
          );
          setState(() {
            _slideValue = 0.0;
          });
        }
      },
      child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoaded) {
            _loadedProduct = state.product;
          }

          if (state is ProductDetailLoading && _loadedProduct == null) {
            return Scaffold(
              backgroundColor: colorScheme.surface,
              body: const ProductDetailShimmer(),
            );
          }
          if (state is ProductDetailError && _loadedProduct == null) {
            return Scaffold(
              backgroundColor: colorScheme.surface,
              body: ErrorStateWidget(
                message: state.message,
                onRetry: () => bloc.add(FetchProductDetail(widget.productId)),
              ),
            );
          }
          
          final product = _loadedProduct;
          if (product != null) {
            final formatter = intl.NumberFormat('#,###');

            return Stack(
              children: [
                // 1. Background Image Layer (PageView)
                SizedBox(
                  height: 300.h,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      product.images.isNotEmpty
                          ? PageView.builder(
                        controller: _pageController,
                        itemCount: product.images.length,
                        itemBuilder: (context, index) {
                          return CachedNetworkImage(
                            imageUrl: product.images[index],
                            fit: BoxFit.contain,
                            errorWidget: (_, _, _) => _buildDetailPlaceholder(colorScheme),
                            placeholder: (_, _) => const ProductDetailShimmer(),
                          );
                        },
                      )
                          : _buildDetailPlaceholder(colorScheme),
                      if (product.images.length > 1)
                        Positioned(
                          top: 35.h,
                          right: 25.w,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: product.images.asMap().entries.map((entry) {
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

                // 2. Top Navigation Bar (Floating)
                Positioned(
                  top:  20.h,
                  left: 20.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // _buildCircleButton(Icons.arrow_back_ios_new_rounded, theme, () => Navigator.pop(context)),
                      Row(
                        children: [
                          _buildCircleButton(Icons.favorite_border_rounded, theme, () {}),
                          SizedBox(width: 12.w),
                          _buildCircleButton(
                            Icons.call_rounded,
                            theme,
                                () async {
                              final phoneNumber = product.repairman?.mobile ??
                                  (product.repairman?.phoneNumbers?.isNotEmpty == true
                                      ? product.repairman!.phoneNumbers!.first
                                      : null);
                              if (phoneNumber != null) {
                                final Uri launchUri = Uri(
                                  scheme: 'tel',
                                  path: phoneNumber,
                                );
                                try {
                                  // For Android 11+, package visibility is handled in AndroidManifest.xml
                                  // We use launchUrl directly to attempt opening the dialer.
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
                                product.title,
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
                                  product.hasDiscount ? 'قیمت با تخفیف' : 'قیمت فعلی',
                                  style: TextStyle(
                                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Row(
                                  children: [
                                    if (product.hasDiscount) ...[
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(8.r),
                                        ),
                                        child: Text(
                                          '${product.discountPercentage}٪',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                    ],
                                    Text(
                                      '${formatter.format(product.hasDiscount ? product.finalPrice : product.price)} تومان',
                                      style: TextStyle(
                                        color: colorScheme.onSurface,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                if (product.hasDiscount)
                                  Text(
                                    formatter.format(product.price),
                                    style: TextStyle(
                                      color: colorScheme.onSurface.withValues(alpha: 0.4),
                                      fontSize: 12.sp,
                                      decoration: TextDecoration.lineThrough,
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

                // 4. Overlapping Bottom Sheet Content (Draggable)
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
                          // Pull Tab Indicator
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
                                  _buildCreatorRow(product.repairman, theme),
                                  SizedBox(height: 24.h),

                                  // Stats Container
                                  _buildStatsBox(product, theme),
                                  SizedBox(height: 20.h),

                                  // Tabs
                                  _buildTabsSection(theme),
                                  SizedBox(height: 20.h),

                                  // Tab Content
                                  if (_selectedTabIndex == 0)
                                  // Description Text
                                    Text(
                                      product.description.isNotEmpty
                                          ? product.description
                                          : 'توضیحات محصول به زودی اضافه خواهد شد. این محصول از بهترین کیفیت برخوردار است.',
                                      style: TextStyle(
                                        color: textTheme.bodySmall?.color ?? colorScheme.onSurfaceVariant,
                                        fontSize: 13.sp,
                                        height: 1.6,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  else if (_selectedTabIndex == 1)
                                  // Specifications Placeholder
                                    Column(
                                      children: [
                                        _buildSpecItem('ابعاد', '۱۰x۲۰x۳۰ سانتی‌متر', theme),
                                        _buildSpecItem('وزن', '۵۰۰ گرم', theme),
                                        _buildSpecItem('جنس', 'پلاستیک فشرده', theme),
                                        _buildSpecItem('گارانتی', '۱۲ ماهه زینو', theme),
                                      ],
                                    )
                                  else
                                  // Reviews Placeholder
                                    Column(
                                      children: [
                                        _buildReviewItem('علی محمدی', 'واقعا عالی بود، پیشنهاد می‌کنم.', 5, theme),
                                        _buildReviewItem('مریم رضایی', 'کیفیت ساخت بالایی داره.', 4, theme),
                                      ],
                                    ),

                                  SizedBox(height: 20.h),

                                  // Bids List Item
                                  _buildInfoListItem(theme),
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
                  child: _buildFloatingActionBar(theme, product),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  // --- WIDGET BUILDERS ---

  Widget _buildDetailPlaceholder(ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFE8EAF6), // Light indigo
            colorScheme.surfaceContainerHighest,
          ],
        ),
      ),
      child: Center(
        child: Icon(
          Icons.inventory_2_outlined,
          color: Colors.indigo.withValues(alpha: 0.15),
          size: 64.sp,
        ),
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, ThemeData theme, VoidCallback onTap) {
    final colorScheme = theme.colorScheme;

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

  Widget _buildCreatorRow(RepairmanEntity? repairman, ThemeData theme) {
    final title = repairman?.fullName.isNotEmpty == true ? repairman!.fullName : 'نام فروشگاه';
    final subtitle = repairman?.brand?.isNotEmpty == true ? repairman!.brand! : 'توضیحات کوتاه';
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        Container(
          width: 44.r,
          height: 44.r,
          decoration: BoxDecoration(
            color: colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.storefront_outlined, color: colorScheme.surface, size: 20.sp),
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
                  color: theme.textTheme.bodySmall?.color ?? colorScheme.onSurfaceVariant,
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
              Icon(Icons.favorite, color: colorScheme.primary, size: 14.sp),
              SizedBox(width: 6.w),
              Text(
                '۲.۴ هزار',
                style: TextStyle(color: colorScheme.primary, fontSize: 12.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildStatsBox(dynamic product, ThemeData theme) {
    final colorScheme = theme.colorScheme;

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
                  'موجودی',
                  style: TextStyle(color: theme.textTheme.bodySmall?.color ?? colorScheme.onSurfaceVariant, fontSize: 12.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  '${product.stock} عدد',
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
                  'وضعیت',
                  style: TextStyle(color: theme.textTheme.bodySmall?.color ?? colorScheme.onSurfaceVariant, fontSize: 12.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  product.status == 'active' ? 'موجود' : 'ناموجود',
                  style: TextStyle(
                      color: product.status == 'active' ? Colors.green : Colors.red,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabsSection(ThemeData theme) {
    final tabs = ['توضیحات', 'مشخصات', 'نظرات'];
    final colorScheme = theme.colorScheme;

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
                color: isActive ? colorScheme.surface : (theme.textTheme.bodySmall?.color ?? colorScheme.onSurfaceVariant),
                fontSize: 14.sp,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSpecItem(String label, String value, ThemeData theme) {
    final colorScheme = theme.colorScheme;
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

  Widget _buildReviewItem(String name, String comment, int rating, ThemeData theme) {
    final colorScheme = theme.colorScheme;
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

  Widget _buildInfoListItem(ThemeData theme) {
    final colorScheme = theme.colorScheme;

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
            child: Icon(Icons.info_outline, color: colorScheme.primary, size: 20.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ارسال سریع',
                    style: TextStyle(color: colorScheme.onSurface, fontSize: 14.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 4.h),
                Text('تحویل در کمتر از ۲ ساعت',
                    style: TextStyle(
                        color: theme.textTheme.bodySmall?.color ?? colorScheme.onSurfaceVariant, fontSize: 11.sp)),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios_rounded,
              color: theme.textTheme.bodySmall?.color ?? colorScheme.onSurfaceVariant, size: 14.sp),
        ],
      ),
    );
  }

  Widget _buildFloatingActionBar(ThemeData theme, dynamic product) {
    final colorScheme = theme.colorScheme;

    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        return Container(
          height: 64.h,
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(40.r),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withValues(alpha: theme.brightness == Brightness.dark ? 0.2 : 0.1),
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
                  // Background Indicators
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

                  // Background Text
                  Center(
                    child: Opacity(
                      opacity: (1 - (_slideValue / maxSlide)).clamp(0.2, 1.0),
                      child: Text(
                        state is AddToCartLoading ? 'در حال افزودن...' : 'افزودن به سبد خرید',
                        style: TextStyle(
                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  // Draggable Handle
                  AnimatedPositioned(
                    duration: _slideValue == 0 || _slideValue == maxSlide ? const Duration(milliseconds: 300) : Duration.zero,
                    curve: Curves.easeOut,
                    right: 6.r + _slideValue,
                    top: 6.r,
                    bottom: 6.r,
                    child: GestureDetector(
                      onHorizontalDragUpdate: state is AddToCartLoading ? null : (details) {
                        setState(() {
                          // RTL: Dragging left (negative delta) means increasing slide value
                          _slideValue -= details.primaryDelta!;
                          _slideValue = _slideValue.clamp(0.0, maxSlide);
                        });
                      },
                      onHorizontalDragEnd: state is AddToCartLoading ? null : (details) {
                        if (_slideValue >= maxSlide * 0.8) {
                          setState(() {
                            _slideValue = maxSlide;
                          });
                          // Action
                          context.read<ProductDetailBloc>().add(AddToCartEvent(
                            productId: product.id,
                            quantity: 1, // Default quantity
                          ));
                        } else {
                          setState(() {
                            _slideValue = 0.0;
                          });
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
                          child: state is AddToCartLoading
                              ? SizedBox(
                                  width: 20.r,
                                  height: 20.r,
                                  child: CircularProgressIndicator(
                                    color: colorScheme.surface,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shopping_cart_outlined,
                                      color: colorScheme.surface,
                                      size: 20.sp,
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ),
                  
                  // Success Text (Shown when slide completed)
                  if (_slideValue >= maxSlide * 0.9 && state is AddToCartSuccess)
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
      },
    );
  }
}
