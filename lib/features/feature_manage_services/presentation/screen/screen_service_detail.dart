import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/themes/theme_main.dart';
import '../base/base_manage_services_stateful_widget_state.dart';
import '../bloc/service_detail/service_detail_bloc.dart';
import '../../../feature_manage_products/presentation/widget/product_detail_shimmer.dart';
import '../widget/service_creator_row.dart';
import '../widget/service_detail_header.dart';
import '../widget/service_slide_action_bar.dart';
import '../widget/service_stats_box.dart';
import '../widget/service_tabs_section.dart';

class ScreenServiceDetail extends StatefulWidget {
  final String serviceId;

  const ScreenServiceDetail({
    super.key,
    required this.serviceId,
  });

  @override
  State<ScreenServiceDetail> createState() => _ScreenServiceDetailState();
}

class _ScreenServiceDetailState
    extends BaseManageServicesStatefulWidgetState<ScreenServiceDetail,
        ServiceDetailBloc> {
  _ScreenServiceDetailState() : super(locator<ServiceDetailBloc>());

  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    bloc.add(FetchServiceDetail(widget.serviceId));
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
    final colorScheme = theme.colorScheme.copyWith(
      primary: DashboardColors.of(context).adminTeal,
      onPrimary: theme.colorScheme.surface,
      primaryContainer: theme.colorScheme.primaryContainer,
      onPrimaryContainer: theme.colorScheme.onPrimaryContainer,
    );

    return Theme(
      data: theme.copyWith(colorScheme: colorScheme),
      child: BlocBuilder<ServiceDetailBloc, ServiceDetailState>(
        builder: (context, state) {
          if (state is ServiceDetailLoading) {
            return Scaffold(
              backgroundColor: colorScheme.surface,
              body: const ProductDetailShimmer(),
            );
          }
          if (state is ServiceDetailError) {
            return Scaffold(
              backgroundColor: colorScheme.surface,
              body: ErrorStateWidget(
                message: state.message,
                onRetry: () => bloc.add(FetchServiceDetail(widget.serviceId)),
              ),
            );
          }
          if (state is ServiceDetailLoaded) {
            final service = state.service;

            return Scaffold(
              backgroundColor: colorScheme.surface,
              body: Stack(
                children: [
                  ServiceDetailHeader(
                    service: service,
                    pageController: _pageController,
                  ),
                  DraggableScrollableSheet(
                    initialChildSize: 0.61,
                    minChildSize: 0.61,
                    maxChildSize: 0.9,
                    builder: (context, scrollController) {
                      return Container(
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(36.r)),
                          boxShadow: [
                            BoxShadow(
                              color: theme.shadowColor.withValues(
                                  alpha: theme.brightness == Brightness.dark
                                      ? 0.5
                                      : 0.1),
                              blurRadius: 30,
                              offset: const Offset(0, -10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(top: 12.h, bottom: 16.h),
                              width: 36.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                controller: scrollController,
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.fromLTRB(
                                    24.w, 8.h, 24.w, 120.h),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    ServiceCreatorRow(
                                      repairman: service.repairman,
                                    ),
                                    SizedBox(height: 24.h),
                                    ServiceStatsBox(service: service),
                                    SizedBox(height: 20.h),
                                    ServiceTabsSection(service: service),
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
                    bottom: 30.h,
                    left: 24.w,
                    right: 24.w,
                    child: const ServiceSlideActionBar(),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
