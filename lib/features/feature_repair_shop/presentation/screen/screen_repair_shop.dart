import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/services/shop_settings_holder.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../features/feature_home/presentation/bloc/main_home_page_bloc.dart';
import '../base/base_repair_shop_stateful_widget_state.dart';
import '../bloc/repair_shop_bloc.dart';
import '../widget/workshop_booking_button.dart';
import '../widget/workshop_call_bottom_bar.dart';
import '../widget/workshop_floating_buttons.dart';
import '../widget/workshop_header.dart';
import '../widget/workshop_hero_image.dart';
import '../widget/workshop_products_section.dart';
import '../widget/workshop_reservations_section.dart';
import '../widget/workshop_reviews_section.dart';
import '../widget/workshop_section_header.dart';

class ScreenRepairShop extends StatefulWidget {
  final String repairmanId;
  const ScreenRepairShop({super.key, required this.repairmanId});

  @override
  State<ScreenRepairShop> createState() => _ScreenRepairShopState();
}

class _ScreenRepairShopState extends BaseRepairShopStatefulWidgetState<ScreenRepairShop, RepairShopBloc> {
  _ScreenRepairShopState() : super(locator<RepairShopBloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(FetchRepairShopDataEvent(widget.repairmanId));
    bloc.add(FetchRepairmanRatingsEvent(widget.repairmanId));
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocBuilder<RepairShopBloc, RepairShopState>(
      builder: (context, state) {
        if (state.repairShopStatus == RepairShopStatus.loading) {
          return Scaffold(
            backgroundColor: colorScheme.surface,
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        if (state.repairShopStatus == RepairShopStatus.error) {
          return Scaffold(
            backgroundColor: colorScheme.surface,
            body: ErrorStateWidget(
              message: state.repairShopError ?? "خطا در دریافت اطلاعات",
              onRetry: () => bloc.add(FetchRepairShopDataEvent(widget.repairmanId)),
            ),
          );
        }
        if (state.repairShopStatus == RepairShopStatus.loaded) {
          final workshop = state.repairShop!;

          return BlocProvider.value(
            value: bloc,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                backgroundColor: colorScheme.surface,
                body: Stack(
                  children: [
                    // 1. Background Hero Image
                    SizedBox(
                      height: 350.h,
                      width: double.infinity,
                      child: WorkshopHeroImage(workshop: workshop),
                    ),

                    // 2. Floating Buttons
                    WorkshopFloatingButtons(onFavoriteTap: () {}),

                    // 3. Overlapping Bottom Sheet Content (Draggable)
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
                                color: theme.shadowColor.withValues(alpha: 0.1),
                                blurRadius: 30,
                                offset: const Offset(0, -10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              _buildModalHandle(),
                              Expanded(
                                child: SingleChildScrollView(
                                  controller: scrollController,
                                  physics: const BouncingScrollPhysics(),
                                  padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 120.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      WorkshopHeader(
                                        workshop: workshop,
                                        onOpenMap: () => _openMap(lat: workshop.lat, lng: workshop.lng),
                                        onMakePhoneCall: _makePhoneCall,
                                      ),
                                      SizedBox(height: 32.h),
                                      const WorkshopSectionHeader(
                                        title: 'خدمات',
                                        onSeeAll: _dummyCallback,
                                        showSeeAll: false,
                                      ),
                                      SizedBox(height: 16.h),
                                      WorkshopBookingButton(
                                        onTap: () => context.pushNamed(
                                          'booking',
                                          pathParameters: {'repairman_id': widget.repairmanId},
                                          queryParameters: {'shop_name': workshop.name},
                                        ),
                                      ),
                                      SizedBox(height: 32.h),
                                      WorkshopReservationsSection(
                                        workshop: workshop,
                                        onSeeAll: () {
                                          if (workshop.userReservations.isNotEmpty) {
                                            final firstRes = workshop.userReservations.first;
                                            context.pushNamed(
                                              'appointments',
                                              queryParameters: {
                                                'repairman_id': widget.repairmanId,
                                                if (firstRes.jalaliDate != null) 'initial_date': firstRes.jalaliDate!,
                                              },
                                            );
                                          }
                                        },
                                      ),
                                      if (workshop.userReservations.isNotEmpty) SizedBox(height: 32.h),

                                      // Products Section with Visibility Logic
                                      Builder(
                                        builder: (context) {
                                          final role = context.read<MainHomePageBloc>().state.role;
                                          final isRepairShopActive = locator<ShopSettingsHolder>().isRepairShopActive;

                                          if (role == 'user' && !isRepairShopActive) {
                                            return const SizedBox.shrink();
                                          }
                                          return Column(
                                            children: [
                                              WorkshopProductsSection(
                                                workshop: workshop,
                                                onSeeAll: () {
                                                  context.pushNamed(
                                                    'all_repair_shop_products',
                                                    pathParameters: {'repairman_id': widget.repairmanId},
                                                    extra: workshop.products,
                                                  );
                                                },
                                                onProductTap: (productId) {
                                                  context.pushNamed(
                                                    'product_detail',
                                                    pathParameters: {'productId': productId},
                                                  );
                                                },
                                              ),
                                              SizedBox(height: 24.h),
                                            ],
                                          );
                                        },
                                      ),

                                      WorkshopReviewsSection(
                                        repairmanId: widget.repairmanId,
                                        workshopName: workshop.name,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    // 4. Fixed Bottom Bar
                    Positioned(
                      bottom: 24.h,
                      left: 24.w,
                      right: 24.w,
                      child: WorkshopCallBottomBar(
                        workshop: workshop,
                        onOpenMap: () => _openMap(lat: workshop.lat, lng: workshop.lng),
                        onMakePhoneCall: () => _makePhoneCall(workshop.mobile),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  static void _dummyCallback() {}

  Widget _buildModalHandle() {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: 12.h, bottom: 16.h),
      width: 36.w,
      height: 4.h,
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }

  Future<void> _makePhoneCall(String? phoneNumber) async {
    if (phoneNumber == null || phoneNumber.isEmpty) return;
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  Future<void> _openMap({double? lat, double? lng}) async {
    if (lat == null || lng == null) return;
    Uri googleMapsUrl = Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat,$lng");
    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    }
  }
}
