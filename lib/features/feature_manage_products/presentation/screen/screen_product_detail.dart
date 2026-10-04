import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../domain/entity/manage_products_entity.dart';
import '../base/base_manage_products_stateful_widget_state.dart';
import '../bloc/product_detail/product_detail_bloc.dart';
import '../widget/product_attributes_grid.dart';
import '../widget/product_comments_section.dart';
import '../widget/product_creator_tile.dart';
import '../widget/product_description_section.dart';
import '../widget/product_detail_bottom_bar.dart';
import '../widget/product_detail_header.dart';
import '../widget/product_detail_hero_images.dart';
import '../widget/product_detail_shimmer.dart';

class PersianFormatter {
  PersianFormatter._();
  static const List<String> _fa = [
    '۰',
    '۱',
    '۲',
    '۳',
    '۴',
    '۵',
    '۶',
    '۷',
    '۸',
    '۹'
  ];
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
    extends BaseManageProductsStatefulWidgetState<ScreenProductDetail,
        ProductDetailBloc> {
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
  Widget buildNinoWidget(
      BuildContext context, ErrorState errorState, AppBlocState appState) {
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
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: 420.h,
                      child: ProductDetailHeroImages(
                        product: product,
                        pageController: _pageController,
                      ),
                    ),
                    DraggableScrollableSheet(
                      initialChildSize: 0.6,
                      minChildSize: 0.6,
                      maxChildSize: 0.95,
                      builder: (context, scrollController) {
                        return Container(
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(36.r)),
                            boxShadow: [
                              BoxShadow(
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.05),
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
                                  padding: EdgeInsets.fromLTRB(
                                      24.w, 12.h, 24.w, 120.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ProductDetailHeader(product: product),
                                      SizedBox(height: 24.h),
                                      ProductCreatorTile(
                                        creator: product.repairman ??
                                            product.admin,
                                      ),
                                      SizedBox(height: 32.h),
                                      ProductDescriptionSection(
                                        product: product,
                                      ),
                                      SizedBox(height: 32.h),
                                      ProductAttributesGrid(product: product),
                                      SizedBox(height: 32.h),
                                      ProductCommentsSection(product: product),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ProductDetailBottomBar(
                        product: product,
                        isLoading: state is AddToCartLoading,
                        onAddToCart: () => bloc.add(
                          AddToCartEvent(
                            productId: product.id,
                            quantity: 1,
                          ),
                        ),
                      ),
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
}

extension ColorBrightness on Color {
  Color darken([int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var f = 1 - percent / 100;
    return Color.fromARGB(
      (a * 255).toInt(),
      ((r * 255) * f).toInt(),
      ((g * 255) * f).toInt(),
      ((b * 255) * f).toInt(),
    );
  }
}
