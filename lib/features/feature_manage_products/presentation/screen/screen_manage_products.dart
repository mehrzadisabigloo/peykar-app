import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../base/base_manage_products_stateful_widget_state.dart';
import '../bloc/manage_products_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/product_card.dart';
import '../widget/product_card_shimmer.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/error_state_widget.dart';

class ScreenManageProducts extends StatefulWidget {
  const ScreenManageProducts({super.key});

  @override
  State<ScreenManageProducts> createState() => _ScreenManageProductsState();
}

class _ScreenManageProductsState extends BaseManageProductsStatefulWidgetState<ScreenManageProducts, ManageProductsBloc> {
  _ScreenManageProductsState() : super(locator<ManageProductsBloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(FetchManageProductsDataEvent());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // SizedBox(height: 20.h),
            // // Header
            // Text(
            //   'مدیریت محصولات',
            //   style: TextStyle(
            //     fontSize: 18.sp,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black,
            //   ),
            // ),
            SizedBox(height: 20.h),
            // Add Product Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ElevatedButton(
                onPressed: () async {
                  final result = await context.pushNamed('add_product');
                  if (result == true) {
                    bloc.add(FetchManageProductsDataEvent());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3F51B5), // Blue color from image
                  minimumSize: Size(double.infinity, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+ افزودن محصول +',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h),
            // Product List
            Expanded(
              child: BlocBuilder<ManageProductsBloc, ManageProductsState>(
                builder: (context, state) {
                  if (state is ManageProductsLoading) {
                    return ListView.builder(
                      itemCount: 5,
                      padding: EdgeInsets.only(bottom: 20.h),
                      itemBuilder: (context, index) => const ProductCardShimmer(),
                    );
                  }
                  if (state is ManageProductsError) {
                    return ErrorStateWidget(
                      message: state.message,
                      onRetry: () => bloc.add(FetchManageProductsDataEvent()),
                    );
                  }
                  if (state is ManageProductsLoaded) {
                    if (state.products.isEmpty) {
                      return const EmptyStateWidget(
                        title: 'محصولی یافت نشد',
                        description: 'هنوز هیچ محصولی به لیست خود اضافه نکرده‌اید.',
                      );
                    }
                    return ListView.builder(
                      itemCount: state.products.length,
                      padding: EdgeInsets.only(bottom: 20.h),
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return ProductCard(
                          product: product,
                          onTap: () {
                            context.pushNamed(
                              'product_detail',
                              pathParameters: {'productId': product.id},
                            );
                          },
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
