import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/resources/consts.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/themes/theme_main.dart';
import '../../domain/entity/manage_products_entity.dart';
import '../../domain/entity/repairman_entity.dart';
import '../base/base_manage_products_stateful_widget_state.dart';
import '../bloc/product_detail/product_detail_bloc.dart';
import '../widget/product_detail_shimmer.dart';

/// ============================================================================
///  PRODUCT DETAIL SCREEN  —  صفحه جزئیات محصول
/// ----------------------------------------------------------------------------
///  Professional design strictly following the project's theme and patterns.
/// ============================================================================

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
  static String price(num value) {
    final raw = value.toInt().toString();
    final grouped = raw.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (m) => ',',
    );
    return digits(grouped);
  }
}

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

    return BlocListener<ProductDetailBloc, ProductDetailState>(
      listener: (context, state) {
        if (state is AddToCartSuccess) {
          CstmSnackBar.showInfo(context, state.message);
        }
        if (state is AddToCartError) {
          CstmSnackBar.showError(context, state.message);
        }
      },
      child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoaded) {
            _loadedProduct = state.product;
          }

          if (state is ProductDetailLoading && _loadedProduct == null) {
            return const ProductDetailShimmer();
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
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                backgroundColor: colorScheme.surface,
                body: Stack(
                  children: [
                    // 1. Hero Image Background
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: 420.h,
                      child: _buildHeroImages(context, product),
                    ),

                    // 2. Main Content
                    DraggableScrollableSheet(
                      initialChildSize: 0.6,
                      minChildSize: 0.6,
                      maxChildSize: 0.95,
                      builder: (context, scrollController) {
                        return Container(
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(36.r)),
                            boxShadow: [
                              BoxShadow(
                                color: colorScheme.onSurface.withValues(alpha: 0.05),
                                blurRadius: 30,
                                offset: const Offset(0, -10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              _buildModalHandle(context),
                              Expanded(
                                child: SingleChildScrollView(
                                  controller: scrollController,
                                  physics: const BouncingScrollPhysics(),
                                  padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 120.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _buildHeader(context, product, theme),
                                      SizedBox(height: 24.h),
                                      _buildCreatorTile(product.repairman ?? product.admin, theme),
                                      SizedBox(height: 32.h),
                                      _buildDescription(product, theme),
                                      if (product.keywords.isNotEmpty) ...[
                                        SizedBox(height: 24.h),
                                        _buildKeywords(product.keywords, colorScheme),
                                      ],
                                      SizedBox(height: 32.h),
                                      _buildAttributesGrid(context, product, colorScheme),
                                      SizedBox(height: 32.h),
                                      _buildCommentsSection(context, product, theme),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    // 3. Navigation
                    // _buildNavButtons(context),

                    // 4. Fixed Action Bar
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: _buildBottomBar(product, state, colorScheme),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  //  1) VISUAL COMPONENTS
  // ───────────────────────────────────────────────────────────────────────────

  Widget _buildHeroImages(BuildContext context, ManageProductsEntity product) {
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      fit: StackFit.expand,
      children: [
        product.images.isNotEmpty
            ? PageView.builder(
                controller: _pageController,
                itemCount: product.images.length,
                itemBuilder: (context, index) => Hero(
                  tag: 'prod_img_${product.id}_$index',
                  child: CachedNetworkImage(
                    imageUrl: product.images[index],
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => _buildPlaceholder(context),
                  ),
                ),
              )
            : _buildPlaceholder(context),
        // Gradient Scrim
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [colorScheme.onSurface.withValues(alpha: 0.4), Colors.transparent],
                stops: const [0.0, 0.25],
              ),
            ),
          ),
        ),
        // Page Indicator
        if (product.images.length > 1)
          Positioned(
            bottom: 50.h,
            right: 24.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: colorScheme.onSurface.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ListenableBuilder(
                listenable: _pageController,
                builder: (context, child) {
                  int currentPage = _pageController.hasClients ? (_pageController.page?.round() ?? 0) : 0;
                  return Text(
                    PersianFormatter.digits('${currentPage + 1} از ${product.images.length}'),
                    style: TextStyle(color: colorScheme.surface, fontSize: 10.sp, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildModalHandle(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14.h, bottom: 18.h),
      width: 40.w,
      height: 4.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.outlineVariant,
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ManageProductsEntity product, ThemeData theme) {
    final colorScheme = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (product.status.toLowerCase() == 'active')
                    Container(
                      margin: EdgeInsets.only(bottom: 8.h),
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: StatusColors.of(context).success.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        'موجود در انبار',
                        style: TextStyle(color: StatusColors.of(context).success, fontSize: 10.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  Text(
                    product.title,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900,
                      color: colorScheme.onSurface.withValues(alpha: 0.9),
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            _buildRatingBadge(context),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            if (product.hasDiscount) ...[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: colorScheme.error,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  '${PersianFormatter.digits(product.discountPercentage.toString())}% تخفیف',
                  style: TextStyle(color: colorScheme.surface, fontSize: 11.sp, fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(width: 12.w),
            ],
            Icon(Icons.category_rounded, size: 14.sp, color: theme.colorScheme.primary.withValues(alpha: 0.6)),
            SizedBox(width: 6.w),
            Text(
              product.category?.title ?? 'دسته‌بندی نشده',
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 16.w),
            Icon(Icons.branding_watermark_rounded, size: 14.sp, color: colorScheme.outline),
            SizedBox(width: 6.w),
            Text(
              'برند: ${product.repairman?.brand ?? "زینو"}',
              style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingBadge(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: StatusColors.of(context).warning.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded, color: StatusColors.of(context).warning, size: 18.sp),
          SizedBox(width: 4.w),
          Text(
            PersianFormatter.digits('4.8'),
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }

  Widget _buildCreatorTile(RepairmanEntity? creator, ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final String? avatar = creator?.profileImageId != null
        ? '${Consts.baseFileUrl}${creator!.profileImageId}'
        : null;

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(2.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: colorScheme.primary.withValues(alpha: 0.2), width: 2),
            ),
            child: CircleAvatar(
              radius: 24.r,
              backgroundColor: colorScheme.primary.withValues(alpha: 0.05),
              backgroundImage: avatar != null ? CachedNetworkImageProvider(avatar) : null,
              child: avatar == null ? Icon(Icons.storefront_rounded, color: colorScheme.primary, size: 24.sp) : null,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      creator?.fullName ?? 'تامین‌کننده تایید شده',
                      style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900, fontSize: 14.sp),
                    ),
                    // SizedBox(width: 6.w),
                    // Icon(Icons.verified_rounded, size: 14.sp, color: Colors.blue.shade600),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.phone_android, size: 16.sp, color: colorScheme.primary),
                    SizedBox(width: 6.w),
                    Text(
                      creator?.mobile ?? '',
                      style: theme.textTheme.bodySmall?.copyWith(fontSize: 11.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Material(
            color: colorScheme.primary.withValues(alpha: 0.1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
            child: InkWell(
              onTap: () => _makeCall(creator?.mobile),
              borderRadius: BorderRadius.circular(14.r),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                child: Row(
                  children: [
                    Icon(Icons.call_rounded, size: 16.sp, color: colorScheme.primary),
                    SizedBox(width: 6.w),
                    Text('تماس', style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 12.sp)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(ManageProductsEntity product, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('توضیحات کالا', style: theme.textTheme.headlineSmall?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w900)),
        SizedBox(height: 12.h),
        Text(
          product.description.isNotEmpty ? product.description : 'توضیحات تکمیلی برای این محصول ثبت نشده است.',
          style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant, height: 1.7),
        ),
      ],
    );
  }

  Widget _buildKeywords(List<String> keywords, ColorScheme colorScheme) {
    return Wrap(
      spacing: 10.w,
      runSpacing: 10.h,
      children: keywords.map((k) => Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: colorScheme.primary.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Text(
          k,
          style: TextStyle(color: colorScheme.primary, fontSize: 11.sp, fontWeight: FontWeight.w900),
        ),
      )).toList(),
    );
  }

  Widget _buildAttributesGrid(BuildContext context, ManageProductsEntity product, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('مشخصات فنی', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w900)),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            children: [
              // _buildAttrRow(Icons.access_time_filled_rounded, 'زمان تحویل', 'فوری (حدود ۳۰ دقیقه)', colorScheme),
              // _buildDivider(context),
              // _buildAttrRow(Icons.verified_user_rounded, 'گارانتی و ضمانت', 'تضمین اصالت کالا توسط زینو', colorScheme),
              // _buildDivider(context),
              _buildAttrRow(Icons.shopping_bag_rounded, 'حداقل خرید', '${PersianFormatter.digits(product.minPurchaseQuantity.toString())} عدد', colorScheme),
              _buildDivider(context),
              _buildAttrRow(Icons.shopping_bag_outlined, 'حداکثر خرید', '${PersianFormatter.digits(product.maxPurchaseQuantity.toString())} عدد', colorScheme),
              _buildDivider(context),
              _buildAttrRow(Icons.inventory_2_rounded, 'موجودی انبار', '${PersianFormatter.digits(product.stock.toString())} عدد', colorScheme),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAttrRow(IconData icon, String label, String value, ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Icon(icon, size: 20.sp, color: colorScheme.primary.withValues(alpha: 0.7)),
          SizedBox(width: 12.w),
          Text(label, style: TextStyle(fontSize: 13.sp, color: colorScheme.outline)),
          const Spacer(),
          Text(value, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: colorScheme.onSurface.withValues(alpha: 0.87))),
        ],
      ),
    );
  }

  Widget _buildDivider(BuildContext context) => Divider(height: 20.h, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05), thickness: 1);

  Widget _buildCommentsSection(BuildContext context, ManageProductsEntity product, ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final List<Map<String, dynamic>> mockComments = [
      {
        'name': 'علی محمدی',
        'date': '۱۴۰۲/۰۶/۱۲',
        'rating': 5.0,
        'comment': 'واقعا محصول با کیفیتی بود، پیشنهاد می‌کنم حتما بخرید. ارسال هم خیلی سریع انجام شد.',
        'verified': true,
      },
      {
        'name': 'مریم رضایی',
        'date': '۱۴۰۲/۰۶/۱۰',
        'rating': 4.0,
        'comment': 'بسیار کاربردی و عالی. فقط کاش بسته‌بندی کمی محکم‌تر بود.',
        'verified': true,
      },
      {
        'name': 'رضا علوی',
        'date': '۱۴۰۲/۰۶/۰۸',
        'rating': 5.0,
        'comment': 'عالی بود، دقیقاً همانی که در تصاویر می‌بینید. ممنون از تیم زینو.',
        'verified': false,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('نظرات کاربران', style: theme.textTheme.headlineSmall?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w900)),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Icon(Icons.star_rounded, color: StatusColors.of(context).warning, size: 16.sp),
                    SizedBox(width: 4.w),
                    Text(
                      PersianFormatter.digits('۴.۸ از ۵'),
                      style: TextStyle(fontSize: 12.sp, color: colorScheme.outline, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '(${PersianFormatter.digits('۱۲۴')} نظر)',
                      style: TextStyle(fontSize: 11.sp, color: colorScheme.outline),
                    ),
                  ],
                ),
              ],
            ),
            TextButton(
              onPressed: () => context.pushNamed('product_all_comments', pathParameters: {'productId': product.id}),
              child: Text('مشاهده همه', style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.w900)),
            ),
          ],
        ),
        SizedBox(height: 18.h),
        if (mockComments.isEmpty)
          _buildEmptyComments(colorScheme)
        else
          SizedBox(
            height: 185.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: mockComments.length,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              separatorBuilder: (context, index) => SizedBox(width: 16.w),
              itemBuilder: (context, index) => SizedBox(
                width: 300.w,
                child: _buildCommentItem(context, mockComments[index], theme),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildEmptyComments(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Icon(Icons.chat_bubble_outline_rounded, size: 40.sp, color: colorScheme.outlineVariant),
          SizedBox(height: 12.h),
          Text(
            'هنوز نظری برای این محصول ثبت نشده است.',
            style: TextStyle(color: colorScheme.outline, fontSize: 13.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            'شما می‌توانید اولین نفر باشید!',
            style: TextStyle(color: colorScheme.primary, fontSize: 12.sp, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentItem(BuildContext context, Map<String, dynamic> data, ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final bool isVerified = data['verified'] ?? false;
    final double rating = data['rating'] ?? 0.0;

    return Container(
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.02),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: colorScheme.primary.withValues(alpha: 0.1), width: 1.5),
                ),
                padding: EdgeInsets.all(2.r),
                child: CircleAvatar(
                  radius: 18.r,
                  backgroundColor: colorScheme.primary.withValues(alpha: 0.05),
                  child: Text(
                    data['name'].substring(0, 1),
                    style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w900, color: colorScheme.primary),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['name'],
                      style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900, fontSize: 14.sp),
                    ),
                    if (isVerified)
                      Row(
                        children: [
                          Icon(Icons.verified_user_rounded, size: 10.sp, color: StatusColors.of(context).success),
                          SizedBox(width: 4.w),
                          Text('خریدار محصول', style: TextStyle(fontSize: 9.sp, color: StatusColors.of(context).success, fontWeight: FontWeight.bold)),
                        ],
                      ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    PersianFormatter.digits(data['date']),
                    style: theme.textTheme.bodySmall?.copyWith(fontSize: 10.sp, color: colorScheme.outline),
                  ),
                  SizedBox(height: 5.h,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: StatusColors.of(context).warning.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star_rounded, color: StatusColors.of(context).warning, size: 14.sp),
                        SizedBox(width: 4.w),
                        Text(
                          PersianFormatter.digits(rating.toString()),
                          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w900, color: StatusColors.of(context).warning),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: Text(
              data['comment'],
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.7),
                height: 1.6,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  //  2) OVERLAYS & ACTIONS
  // ───────────────────────────────────────────────────────────────────────────

  Widget _buildNavButtons(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Positioned(
      top: top + 16.h,
      left: 20.w,
      right: 20.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCircleButton(context, Icons.arrow_back_ios_new_rounded, () => Navigator.pop(context)),
          Row(
            children: [
              _buildCircleButton(context, Icons.share_rounded, () {}),
              SizedBox(width: 12.w),
              _buildCircleButton(context, Icons.favorite_border_rounded, () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton(BuildContext context, IconData icon, VoidCallback onTap) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: colorScheme.surface,
      shape: const CircleBorder(),
      elevation: 4,
      shadowColor: colorScheme.onSurface.withValues(alpha: 0.12),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Icon(icon, color: colorScheme.onSurface.withValues(alpha: 0.87), size: 20.sp),
        ),
      ),
    );
  }

  Widget _buildBottomBar(ManageProductsEntity product, ProductDetailState state, ColorScheme colorScheme) {
    final isLoading = state is AddToCartLoading;
    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 32.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'قیمت مصرف‌کننده',
                  style: TextStyle(color: colorScheme.outline, fontSize: 11.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      PersianFormatter.price(product.hasDiscount ? product.finalPrice : product.price),
                      style: TextStyle(color: colorScheme.primary, fontSize: 22.sp, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'تومان',
                      style: TextStyle(color: colorScheme.primary, fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                if (product.hasDiscount)
                  Row(
                    children: [
                      Text(
                        PersianFormatter.price(product.price),
                        style: TextStyle(color: colorScheme.outlineVariant, fontSize: 13.sp, decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                        decoration: BoxDecoration(color: colorScheme.error.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(4.r)),
                        child: Text(
                          '${PersianFormatter.digits(product.discountPercentage.toString())}%-',
                          style: TextStyle(color: colorScheme.error, fontSize: 10.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: ElevatedButton(
              onPressed: isLoading ? null : () => bloc.add(AddToCartEvent(productId: product.id, quantity: 1)),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.surface,
                minimumSize: Size(double.infinity, 58.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
                elevation: 0,
              ),
              child: isLoading
                  ? SizedBox(height: 24, width: 24, child: CircularProgressIndicator(strokeWidth: 2.5, color: colorScheme.surface))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_checkout_rounded, size: 20.sp),
                        SizedBox(width: 8.w),
                        Text('افزودن به سبد', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900)),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.outlineVariant,
      alignment: Alignment.center,
      child: Icon(Icons.shopping_bag_outlined, color: colorScheme.outline, size: 64.sp),
    );
  }

  Future<void> _makeCall(String? num) async {
    if (num == null) return;
    final uri = Uri(scheme: 'tel', path: num);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }
}

// Extension to help with theme colors
extension ColorBrightness on Color {
  Color darken([int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var f = 1 - percent / 100;
    return Color.fromARGB(
      a.toInt(),
      (r * f).toInt(),
      (g * f).toInt(),
      (b * f).toInt(),
    );
  }
}
