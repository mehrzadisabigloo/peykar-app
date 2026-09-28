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
import '../../domain/entity/manage_reminder_sub_item_entity.dart';
import '../base/base_manage_reminder_sub_items_stateful_widget_state.dart';
import '../bloc/manage_reminder_sub_items_bloc.dart';
import '../widget/reminder_sub_item_card.dart';

class ScreenManageReminderSubItems extends StatefulWidget {
  final String reminderTypeId;
  final String reminderTypeTitle;

  const ScreenManageReminderSubItems({
    super.key,
    required this.reminderTypeId,
    required this.reminderTypeTitle,
  });

  @override
  State<ScreenManageReminderSubItems> createState() => _ScreenManageReminderSubItemsState();
}

class _ScreenManageReminderSubItemsState extends BaseManageReminderSubItemsStatefulWidgetState<ScreenManageReminderSubItems, ManageReminderSubItemsBloc> {
  _ScreenManageReminderSubItemsState() : super(locator<ManageReminderSubItemsBloc>());

  final TextEditingController _searchController = TextEditingController();
  final DebounceService _debouncer = DebounceService();

  @override
  void initState() {
    super.initState();
    bloc.add(FetchReminderSubItems(reminderTypeId: widget.reminderTypeId));
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await context.pushNamed(
            'add_reminder_sub_item',
            pathParameters: {'reminder_type_id': widget.reminderTypeId},
          );
          if (result == true) {
            bloc.add(FetchReminderSubItems(reminderTypeId: widget.reminderTypeId, isRefresh: true));
          }
        },
        backgroundColor: colorScheme.primary,
        icon: Icon(Icons.add_rounded, color: colorScheme.surface, size: 24.sp),
        label: Text(
          'افزودن زیرمجموعه',
          style: TextStyle(
            color: colorScheme.surface,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'BonyadeKoodak',
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 16.h),
            color: Theme.of(context).colorScheme.surface,
            child: TextField(
              controller: _searchController,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, fontFamily: 'BonyadeKoodak'),
              onChanged: (value) {
                _debouncer.run(() {
                  bloc.add(FetchReminderSubItems(reminderTypeId: widget.reminderTypeId, title: value, isRefresh: true));
                });
              },
              decoration: InputDecoration(
                hintText: 'جستجو در زیرمجموعه‌ها...',
                hintStyle: TextStyle(fontSize: 13.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.38), fontFamily: 'BonyadeKoodak'),
                prefixIcon: Icon(Icons.search_rounded, size: 22.sp, color: colorScheme.primary),
                suffixIcon: _searchController.text.isNotEmpty 
                  ? IconButton(
                      icon: Icon(Icons.clear_rounded, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.26)),
                      onPressed: () {
                        _searchController.clear();
                        bloc.add(FetchReminderSubItems(reminderTypeId: widget.reminderTypeId, isRefresh: true));
                        setState(() {});
                      },
                    )
                  : null,
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceContainer,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              ),
            ),
          ),
          Expanded(
            child: BlocConsumer<ManageReminderSubItemsBloc, ManageReminderSubItemsState>(
              listener: (context, state) {
                if (state.successMessage != null) {
                  CstmSnackBar.showSuccess(context, state.successMessage!);
                }
                if (state.errorMessage != null) {
                  CstmSnackBar.showError(context, state.errorMessage!);
                }
              },
              builder: (context, state) {
                if (state is ManageReminderSubItemsInitial || (state is ManageReminderSubItemsLoading && state.page == 1)) {
                  return ListView.builder(
                    padding: EdgeInsets.only(top: 10.h),
                    itemCount: 5,
                    itemBuilder: (context, index) => const ManagementCardShimmer(height: 100),
                  );
                }

                if (state is ManageReminderSubItemsFailed) {
                  return Center(
                    child: ErrorStateWidget(
                      message: state.message,
                      onRetry: () => bloc.add(FetchReminderSubItems(reminderTypeId: widget.reminderTypeId)),
                    ),
                  );
                }

                final items = state.subItems;
                final hasMore = state.hasMore;

                if (items.isEmpty) {
                  return const Center(
                    child: EmptyStateWidget(
                      title: 'زیرمجموعه‌ای یافت نشد',
                      description: 'در حال حاضر هیچ زیرمجموعه‌ای برای این نوع یادآور ثبت نشده است.',
                      icon: Icons.subdirectory_arrow_left_rounded,
                    ),
                  );
                }

                return WidgetInfiniteList(
                  bloc: bloc.listBloc,
                  items: items,
                  hasReachedTop: true,
                  hasReachedBottom: !hasMore,
                  isLoading: false,
                  hasErrorOccurred: false,
                  padding: EdgeInsets.only(top: 10.h, bottom: 100.h),
                  errorWidget: const SizedBox.shrink(),
                  loadingWidget: ListShimmer(height: 100, count: 1),
                  loadBottomData: () {
                    bloc.add(const LoadMoreReminderSubItems());
                  },
                  itemEquality: (f, s) {
                    if (f is ManageReminderSubItemEntity && s is ManageReminderSubItemEntity) {
                      return f.id == s.id;
                    }
                    return f == s;
                  },
                  builder: (context, item) {
                    final subItem = item as ManageReminderSubItemEntity;
                    return ReminderSubItemCard(
                      item: subItem,
                      isDeleting: state.deletingId == subItem.id,
                      isEditing: state.editingId == subItem.id,
                      isStatusChanging: state.processingId == subItem.id,
                      onStatusChanged: (value) {
                        bloc.add(ChangeSubItemStatus(subItem.id));
                      },
                      onDelete: () => _showDeleteConfirmation(subItem),
                      onEdit: () async {
                        final result = await context.pushNamed('edit_reminder_sub_item', extra: subItem);
                        if (result == true) {
                          bloc.add(FetchReminderSubItems(reminderTypeId: widget.reminderTypeId, isRefresh: true));
                        }
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

  void _showDeleteConfirmation(ManageReminderSubItemEntity item) {
    ConfirmationPopup.show(
      context,
      title: 'حذف زیرمجموعه',
      description: 'آیا از حذف "${item.title}" اطمینان دارید؟',
      confirmText: 'حذف',
      cancelText: 'انصراف',
      icon: Icons.delete_forever_rounded,
      onConfirm: () => bloc.add(DeleteSubItem(item.id)),
    );
  }
}
