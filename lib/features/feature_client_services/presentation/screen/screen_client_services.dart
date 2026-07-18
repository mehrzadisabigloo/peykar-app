import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../base/base_client_services_stateful_widget_state.dart';
import '../bloc/client_services_bloc.dart';
import '../widget/category_item.dart';
import '../widget/repair_shop_card.dart';

class ScreenClientServices extends StatefulWidget {
  const ScreenClientServices({super.key});

  @override
  State<ScreenClientServices> createState() => _ScreenClientServicesState();
}

class _ScreenClientServicesState extends BaseClientServicesStatefulWidgetState<ScreenClientServices, ClientServicesBloc> {
  _ScreenClientServicesState() : super(locator<ClientServicesBloc>());

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc.add(FetchClientServicesDataEvent());
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
      body: BlocBuilder<ClientServicesBloc, ClientServicesState>(
        builder: (context, state) {
          if (state is ClientServicesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ClientServicesError) {
            return Center(child: Text(state.message));
          }
          if (state is ClientServicesLoaded) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  _buildSearchBar(),
                  SizedBox(height: 24.h),
                  _buildCategoryGrid(state.entity.categories),
                  SizedBox(height: 32.h),
                  _buildSectionHeader('تعمیرگاه های برتر'),
                  SizedBox(height: 16.h),
                  ...state.entity.topRepairShops.map((shop) => RepairShopCard(shop: shop)),
                  SizedBox(height: 80.h), // Space for bottom nav
                ],
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
                hintText: 'جستجو در خدمات',
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

  Widget _buildCategoryGrid(List categories) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 0.75,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryItem(category: categories[index]);
      },
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
        GestureDetector(
          onTap: () => context.pushNamed('all_top_repair_shops'),
          child: Text(
            'مشاهده همه',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
