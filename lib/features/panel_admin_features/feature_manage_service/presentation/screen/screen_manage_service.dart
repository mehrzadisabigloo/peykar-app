import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../../core/services/locator.dart';
import '../../../../../../core/widgets/cstm_snakbar.dart';
import '../../../../../../core/widgets/empty_state_widget.dart';
import '../../../../../../core/widgets/error_state_widget.dart';
import '../../../../../../core/widgets/stylish_popup.dart';
import '../../../../../../core/widgets/widget_infinite_list.dart';
import '../base/base_manage_service_stateful_widget_state.dart';
import '../bloc/manage_service_bloc.dart';
import '../widget/service_card.dart';
import '../widget/service_card_shimmer.dart';
import '../../domain/entity/manage_service_entity.dart';

class ScreenManageService extends StatefulWidget {
  const ScreenManageService({super.key});

  @override
  State<ScreenManageService> createState() => _ScreenManageServiceState();
}

class _ScreenManageServiceState extends BaseManageServiceStatefulWidgetState<ScreenManageService, ManageServiceBloc> {
  _ScreenManageServiceState() : super(locator<ManageServiceBloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(const FetchManageServices());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await context.pushNamed('add_service');
          if (result == true) {
            bloc.add(const FetchManageServices(isRefresh: true));
          }
        },
        backgroundColor: colorScheme.primary,
        icon: Icon(Icons.add_rounded, color: colorScheme.surface),
        label: Text(
          'افزودن سرویس جدید',
          style: TextStyle(
            color: colorScheme.surface,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'BonyadeKoodak',
          ),
        ),
      ),
      body: BlocConsumer<ManageServiceBloc, ManageServiceState>(
        listener: (context, state) {
          if (state.successMessage != null) {
            CstmSnackBar.showSuccess(context, state.successMessage!);
          }
          if (state.errorMessage != null) {
            CstmSnackBar.showError(context, state.errorMessage!);
          }
        },
        builder: (context, state) {
          if (state is ManageServiceInitial || (state is ManageServiceLoading && state.page == 1)) {
            return ListView.builder(
              padding: EdgeInsets.only(top: 10.h),
              itemCount: 5,
              itemBuilder: (context, index) => const ServiceCardShimmer(),
            );
          }

          if (state is ManageServiceFailed) {
            return Center(
              child: ErrorStateWidget(
                message: state.message,
                onRetry: () => bloc.add(const FetchManageServices()),
              ),
            );
          }

          final services = state.services;
          final hasMore = state.hasMore;

          if (services.isEmpty) {
            return const Center(
              child: EmptyStateWidget(
                title: 'سرویسی یافت نشد',
                description: 'در حال حاضر هیچ سرویسی در سیستم ثبت نشده است.',
                icon: Icons.miscellaneous_services_rounded,
              ),
            );
          }

          return WidgetInfiniteList(
            bloc: bloc.listBloc,
            items: services,
            hasReachedTop: true,
            hasReachedBottom: !hasMore,
            isLoading: false,
            hasErrorOccurred: false,
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
            errorWidget: const SizedBox.shrink(),
            loadingWidget: const ServiceCardShimmer(),

            loadBottomData: () {
               bloc.add(const LoadMoreManageServices());
            },
            itemEquality: (f, s) {
              if (f is ManageServiceEntity && s is ManageServiceEntity) {
                return f.id == s.id;
              }
              return f == s;
            },
            builder: (context, item) {
              final service = item as ManageServiceEntity;
              return ServiceCard(
                service: service,
                isProcessing: state.processingId == service.id && !state.isDeleting,
                isDeleting: state.processingId == service.id && state.isDeleting,
                onStatusChanged: (value) {
                  bloc.add(ChangeServiceStatus(service.id, value ? 'Active' : 'DeactiveAdmin'));
                },
                onDelete: () => _showDeleteConfirmation(service),
                onEdit: () async {
                   final result = await context.pushNamed('add_service', extra: service);
                   if (result == true) {
                     bloc.add(const FetchManageServices(isRefresh: true));
                   }
                },
              );
            },
          );
        },
      ),
    );
  }

  void _showDeleteConfirmation(ManageServiceEntity service) {
    ConfirmationPopup.show(
      context,
      title: 'حذف سرویس',
      description: 'آیا از حذف سرویس "${service.title}" اطمینان دارید؟ این عمل غیرقابل بازگشت است.',
      confirmText: 'حذف',
      cancelText: 'انصراف',
      icon: Icons.delete_forever_rounded,
      onConfirm: () => bloc.add(DeleteService(service.id)),
    );
  }
}
