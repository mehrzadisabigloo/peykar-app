import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../base/base_shop_stateful_widget_state.dart';
import '../bloc/shop_bloc.dart';
import '../widget/product_card.dart';
import '../widget/shop_banner.dart';

class ScreenShop extends StatefulWidget {
  const ScreenShop({super.key});

  @override
  State<ScreenShop> createState() => _ScreenShopState();
}

class _ScreenShopState extends BaseShopStatefulWidgetState<ScreenShop, ShopBloc> {
  _ScreenShopState() : super(locator<ShopBloc>());

  final TextEditingController _searchController = TextEditingController();
  int _selectedCategoryIndex = 0;
  final List<String> _categories = ['همه', 'روغن موتور', 'فیلتر', 'لوازم یدکی', 'لاستیک', 'باتری'];

  @override
  void initState() {
    super.initState();
    bloc.add(FetchShopDataEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: BlocBuilder<ShopBloc, ShopState>(
        builder: (context, state) {
          if (state is ShopLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ShopError) {
            return Center(child: Text(state.message));
          }
          if (state is ShopLoaded) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    _buildSearchBar(),
                    SizedBox(height: 20.h),
                    const ShopBanner(),
                    SizedBox(height: 24.h),
                    _buildCategoryList(),
                    SizedBox(height: 24.h),
                    _buildSectionHeader('محصولات پیشنهادی'),
                    SizedBox(height: 16.h),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.entity.products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: state.entity.products[index]);
                      },
                    ),
                    SizedBox(height: 100.h), // Space for bottom nav
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

  Widget _buildSearchBar() {
    return Row(
      children: [
        // Filter Button
        GestureDetector(
          onTap: () {
            // TODO: Open filter bottom sheet
          },
          child: Container(
            height: 50.h,
            width: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              Icons.tune_rounded,
              color: Colors.black87,
              size: 24.sp,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        // Search Input
        Expanded(
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'جستجو در محصولات',
                hintStyle: TextStyle(
                  color: Colors.grey.withValues(alpha: 0.7),
                  fontSize: 14.sp,
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: Colors.grey.withValues(alpha: 0.7),
                  size: 22.sp,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12.h),
              ),
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black87,
              ),
              textAlignVertical: TextAlignVertical.center,
              cursorColor: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(_categories.length, (index) {
          final isSelected = _selectedCategoryIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected ? Colors.transparent : Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  if (!isSelected)
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _categories[index],
                    style: TextStyle(
                      color: isSelected ? const Color(0xFF3F51B5) : Colors.grey,
                      fontSize: 14.sp,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      fontFamily: 'BonyadeKoodak',
                    ),
                  ),
                  if (isSelected)
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      height: 2.h,
                      width: 20.w,
                      color: const Color(0xFF3F51B5),
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          'مشاهده همه',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
