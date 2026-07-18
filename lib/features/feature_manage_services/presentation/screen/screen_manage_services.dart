import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../base/base_manage_services_stateful_widget_state.dart';
import '../bloc/manage_services_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/service_card.dart';
import '../widget/service_card_shimmer.dart';
import '../../../../core/widgets/empty_state_widget.dart';
import '../../../../core/widgets/error_state_widget.dart';

class ScreenManageServices extends StatefulWidget {
  const ScreenManageServices({super.key});

  @override
  State<ScreenManageServices> createState() => _ScreenManageServicesState();
}

class _ScreenManageServicesState extends BaseManageServicesStatefulWidgetState<ScreenManageServices, ManageServicesBloc> {
  _ScreenManageServicesState() : super(locator<ManageServicesBloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(FetchManageServicesDataEvent());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ElevatedButton(
            onPressed: () async {
              final result = await context.pushNamed('add_service');
              if (result == true) {
                bloc.add(FetchManageServicesDataEvent());
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3F51B5),
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
                  '+ افزودن خدمت +',
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
        SizedBox(height: 20.h),
        // Service List
        Expanded(
          child: BlocBuilder<ManageServicesBloc, ManageServicesState>(
            builder: (context, state) {
              if (state is ManageServicesLoading) {
                return ListView.builder(
                  itemCount: 5,
                  padding: EdgeInsets.only(bottom: 20.h),
                  itemBuilder: (context, index) => const ServiceCardShimmer(),
                );
              }
              if (state is ManageServicesError) {
                return ErrorStateWidget(
                  message: state.message,
                  onRetry: () => bloc.add(FetchManageServicesDataEvent()),
                );
              }
              if (state is ManageServicesLoaded) {
                if (state.services.isEmpty) {
                  return const EmptyStateWidget(
                    title: 'خدمتی یافت نشد',
                    description: 'هنوز هیچ خدمتی به لیست خود اضافه نکرده‌اید.',
                    icon: Icons.design_services_outlined,
                  );
                }
                return ListView.builder(
                  itemCount: state.services.length,
                  padding: EdgeInsets.only(bottom: 20.h),
                  itemBuilder: (context, index) {
                    return ServiceCard(
                      service: state.services[index],
                      onTap: () {
                        context.pushNamed(
                          'service_detail',
                          pathParameters: {'serviceId': state.services[index].id},
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
    );

  }
}
