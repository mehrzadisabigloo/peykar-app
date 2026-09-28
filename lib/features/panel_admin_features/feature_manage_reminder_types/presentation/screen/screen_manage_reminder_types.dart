import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../../core/services/locator.dart';
import '../../../../../../core/services/debounce_service.dart';
import '../../../../../../core/widgets/cstm_snakbar.dart';
import '../../../../../../core/widgets/empty_state_widget.dart';
import '../../../../../../core/widgets/error_state_widget.dart';
import '../../../../../../core/widgets/stylish_popup.dart';
import '../../../../../../core/widgets/widget_infinite_list.dart';
import '../../../../../core/widgets/list_shimmer.dart';
import '../../../../../core/widgets/management_card_shimmer.dart';
import '../bloc/manage_reminder_types_bloc.dart';
import '../widget/reminder_type_card.dart';
import '../../domain/entity/manage_reminder_types_entity.dart';
import '../base/base_manage_reminder_types_stateful_widget_state.dart';

class ScreenManageReminderTypes extends StatefulWidget {
  const ScreenManageReminderTypes({super.key});

  @override
  State<ScreenManageReminderTypes> createState() => _ScreenManageReminderTypesState();
}

class _ScreenManageReminderTypesState extends BaseManageReminderTypesStatefulWidgetState<ScreenManageReminderTypes, ManageReminderTypesBloc> {
  _ScreenManageReminderTypesState() : super(locator<ManageReminderTypesBloc>());

  final TextEditingController _searchController = TextEditingController();
  final DebounceService _debouncer = DebounceService();

  @override
  void initState() {
    super.initState();
    bloc.add(const FetchReminderTypes());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Container(
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: LinearGradient(
            colors: [colorScheme.primary, colorScheme.primary.withValues(alpha: 0.85)],
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withValues(alpha: 0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          onPressed: () async {
            final result = await context.pushNamed('add_reminder_type');
            if (result == true) {
              bloc.add(const FetchReminderTypes(isRefresh: true));
            }
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          highlightElevation: 0,
          icon: Icon(Icons.add_circle_outline_rounded, color: colorScheme.surface, size: 24.sp),
          label: Text(
            'افزودن نوع جدید',
            style: TextStyle(
              color: colorScheme.surface,
              fontSize: 14.sp,
              fontWeight: FontWeight.w900,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          _buildTopBar(colorScheme),
          Expanded(
            child: BlocConsumer<ManageReminderTypesBloc, ManageReminderTypesState>(
              listener: (context, state) {
                if (state.successMessage != null) {
                  CstmSnackBar.showSuccess(context, state.successMessage!);
                }
                if (state.errorMessage != null) {
                  CstmSnackBar.showError(context, state.errorMessage!);
                }
              },
              builder: (context, state) {
                if (state is ManageReminderTypesInitial || (state is ManageReminderTypesLoading && state.page == 1)) {
                  return ListView.builder(
                    padding: EdgeInsets.only(top: 10.h),
                    itemCount: 5,
                    itemBuilder: (context, index) => const ManagementCardShimmer(height: 120),
                  );
                }

                if (state is ManageReminderTypesFailed) {
                  return Center(
                    child: ErrorStateWidget(
                      message: state.message,
                      onRetry: () => bloc.add(const FetchReminderTypes()),
                    ),
                  );
                }

                final types = state.reminderTypes;
                final hasMore = state.hasMore;

                if (types.isEmpty) {
                  return const Center(
                    child: EmptyStateWidget(
                      title: 'موردی یافت نشد',
                      description: 'در حال حاضر هیچ نوع یادآوری در سیستم ثبت نشده است.',
                      icon: Icons.notifications_off_rounded,
                    ),
                  );
                }

                return WidgetInfiniteList(
                  bloc: bloc.listBloc,
                  items: types,
                  hasReachedTop: true,
                  hasReachedBottom: !hasMore,
                  isLoading: false,
                  hasErrorOccurred: false,
                  padding: EdgeInsets.only(top: 10.h, bottom: 100.h),
                  errorWidget: const SizedBox.shrink(),
                  loadingWidget: ListShimmer(height: 120, count: 1),
                  loadBottomData: () {
                    bloc.add(const LoadMoreReminderTypes());
                  },
                  itemEquality: (f, s) {
                    if (f is ManageReminderTypeEntity && s is ManageReminderTypeEntity) {
                      return f.id == s.id;
                    }
                    return f == s;
                  },
                  builder: (context, item) {
                    final type = item as ManageReminderTypeEntity;
                    return ReminderTypeCard(
                      type: type,
                      isDeleting: state.deletingId == type.id,
                      isEditing: state.editingId == type.id,
                      isStatusChanging: state.processingId == type.id,
                      onStatusChanged: (value) {
                        bloc.add(ChangeReminderTypeStatus(type.id));
                      },
                      onDelete: () => _showDeleteConfirmation(type),
                      onEdit: () async {
                        final result = await context.pushNamed('edit_reminder_type', extra: type);
                        if (result == true) {
                          bloc.add(const FetchReminderTypes(isRefresh: true));
                        }
                      },
                      onManageSubItems: () {
                        context.pushNamed(
                          'manage_reminder_sub_items',
                          pathParameters: {
                            'reminder_type_id': type.id,
                            'reminder_type_title': type.title,
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700, fontFamily: 'BonyadeKoodak'),
              onChanged: (value) {
                _debouncer.run(() {
                  bloc.add(FetchReminderTypes(title: value, isRefresh: true));
                });
              },
              decoration: InputDecoration(
                hintText: 'جستجو در دسته‌بندی‌ها...',
                hintStyle: TextStyle(fontSize: 13.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.26), fontFamily: 'BonyadeKoodak', fontWeight: FontWeight.normal),
                prefixIcon: Icon(Icons.search_rounded, size: 24.sp, color: colorScheme.primary),
                suffixIcon: _searchController.text.isNotEmpty 
                  ? IconButton(
                      icon: Icon(Icons.cancel_rounded, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.26), size: 20.sp),
                      onPressed: () {
                        _searchController.clear();
                        bloc.add(const FetchReminderTypes(isRefresh: true));
                        setState(() {});
                      },
                    )
                  : null,
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceContainer,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(ManageReminderTypeEntity type) {
    ConfirmationPopup.show(
      context,
      title: 'حذف نوع یادآور',
      description: 'آیا از حذف "${type.title}" اطمینان دارید؟ تمامی زیرمجموعه‌ها نیز حذف خواهند شد.',
      confirmText: 'حذف',
      cancelText: 'انصراف',
      icon: Icons.delete_forever_rounded,
      onConfirm: () => bloc.add(DeleteReminderType(type.id)),
    );
  }
}
