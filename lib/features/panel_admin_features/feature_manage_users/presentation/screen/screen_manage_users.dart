import 'dart:async';
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
import '../../../../../../core/widgets/management_card_shimmer.dart';
import '../../../../feature_home/domain/entity/users_filter_params.dart';
import '../../../../../../core/themes/theme_main.dart';
import '../base/base_manage_users_stateful_widget_state.dart';
import '../bloc/manage_users_bloc.dart';

class ScreenManageUsers extends StatefulWidget {
  const ScreenManageUsers({super.key});

  @override
  State<ScreenManageUsers> createState() => _ScreenManageUsersState();
}

class _ScreenManageUsersState extends BaseManageUsersStatefulWidgetState<ScreenManageUsers, ManageUsersBloc> {
  _ScreenManageUsersState() : super(locator<ManageUsersBloc>());

  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final DebounceService _debouncer = DebounceService();

  @override
  void initState() {
    super.initState();
    bloc.add(const FetchManageUsers(UsersFilterParams()));
    _scrollController.addListener(_onScroll);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _scrollController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    // Rebuild to update suffix icon visibility
    setState(() {});

    _debouncer.run(() {
      final query = _searchController.text.trim();
      
      if (query.isEmpty) {
        bloc.add(const FetchManageUsers(UsersFilterParams()));
        return;
      }

      final bool isMobile = RegExp(r'^[0-9]+$').hasMatch(query);
      
      bloc.add(FetchManageUsers(UsersFilterParams(
        mobile: isMobile ? query : null,
        firstName: isMobile ? null : query,
      )));
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.9) {
      bloc.add(const LoadMoreManageUsers());
    }
  }

  @override
  Widget buildManageUsersWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await context.pushNamed('add_user');
          if (result == true) {
            bloc.add(const FetchManageUsers(UsersFilterParams()));
          }
        },
        backgroundColor: colorScheme.primary,
        icon: Icon(Icons.person_add_rounded, color: colorScheme.surface),
        label: Text(
          'افزودن کاربر جدید',
          style: TextStyle(
            color: colorScheme.surface,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildSearchBar(colorScheme),
          Expanded(
            child: BlocConsumer<ManageUsersBloc, ManageUsersState>(
              listener: (context, state) {
                if (state is ManageUsersLoaded) {
                  if (state.successMessage != null) {
                    CstmSnackBar.showSuccess(context, state.successMessage!);
                  }
                  if (state.errorMessage != null) {
                    CstmSnackBar.showError(context, state.errorMessage!);
                  }
                }
              },
              builder: (context, state) {
                if (state is ManageUsersInitial || (state is ManageUsersLoading && state.filters.page == 1)) {
                  return ListView.builder(
                    padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 100.h),
                    itemCount: 5,
                    itemBuilder: (context, index) => const ManagementCardShimmer(height: 120),
                  );
                }

                if (state is ManageUsersFailed) {
                  return ErrorStateWidget(
                    message: state.message,
                    onRetry: () => bloc.add(FetchManageUsers(state.filters)),
                  );
                }

                if (state is ManageUsersLoaded || state is ManageUsersLoadingMore) {
                  final users = (state as dynamic).users;
                  final hasMore = (state as dynamic).hasMore;

                  if (users.isEmpty) {
                    return const EmptyStateWidget(
                      title: 'کاربری یافت نشد',
                      description: 'با فیلترهای فعلی هیچ کاربری پیدا نشد.',
                      icon: Icons.person_off_rounded,
                    );
                  }

                  return ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 100.h),
                    itemCount: users.length + (hasMore ? 1 : 0),
                    itemBuilder: (context, index) {
                        if (index == users.length) {
                          return const Center(child: Padding(padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()));
                        }
                        final user = users[index];
                        return _buildUserCard(user, colorScheme, state is ManageUsersLoaded ? state.processingId : null);
                      },
                    );
                  }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 16.h),
      color: Theme.of(context).colorScheme.surface,
      child: TextField(
        controller: _searchController,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          hintText: 'جستجو نام یا شماره موبایل...',
          hintStyle: TextStyle(fontSize: 13.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.38)),
          prefixIcon: Icon(Icons.search_rounded, size: 22.sp, color: colorScheme.primary),
          suffixIcon: _searchController.text.isNotEmpty 
            ? IconButton(
                icon: Icon(Icons.clear_rounded, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.26)),
                onPressed: () {
                  _searchController.clear();
                  _debouncer.dispose();
                  bloc.add(const FetchManageUsers(UsersFilterParams()));
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
    );
  }

  Widget _buildUserCard(dynamic user, ColorScheme colorScheme, String? processingId) {
    bool isProcessing = processingId == user.id;
    bool isRepairman = user.role == 'repairman';
    bool isActive = user.status == 'active';

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(Icons.person_rounded, color: colorScheme.primary, size: 22.sp),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.firstName ?? ''} ${user.lastName ?? ''}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w900,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      user.mobile ?? '',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: _getRoleColor(context, user.role).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  _getRoleName(user.role),
                  style: TextStyle(
                    color: _getRoleColor(context, user.role),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.05)),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Row(
                children: [
                  Icon(
                    isActive ? Icons.check_circle_rounded : Icons.cancel_rounded,
                    size: 16.sp,
                    color: isActive ? StatusColors.of(context).success : StatusColors.of(context).warning,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    isActive ? 'حساب فعال' : 'حساب غیرفعال',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: isActive ? StatusColors.of(context).success : StatusColors.of(context).warning,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  /*ElevatedButton.icon(
                    onPressed: isProcessing ? null : () async {
                       final result = await context.pushNamed('add_user', extra: user);
                       if (result == true) {
                         bloc.add(const FetchManageUsers(UsersFilterParams()));
                       }
                    },
                    icon: Icon(Icons.edit_outlined, size: 18.sp),
                    label: const Text('ویرایش'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary.withValues(alpha: isProcessing ? 0.05 : 0.1),
                      foregroundColor: colorScheme.primary,
                      disabledForegroundColor: colorScheme.primary.withValues(alpha: 0.5),
                      minimumSize: Size(80.w, 36.h),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                    ),
                  ),*/
                  if (isRepairman) ...[
                    SizedBox(width: 8.w),
                    isProcessing 
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: SizedBox(
                            width: 16.sp,
                            height: 16.sp,
                            child: CircularProgressIndicator(strokeWidth: 2, color: colorScheme.primary),
                          ),
                        )
                      : Switch(
                          value: isActive,
                          onChanged: isProcessing ? null : (_) => bloc.add(ChangeRepairmanStatus(user.id!)),
                          activeThumbColor: colorScheme.primary,
                          activeTrackColor: colorScheme.primary.withValues(alpha: 0.2),
                        ),
                  ],
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getRoleColor(BuildContext context, String? role) {
    switch (role) {
      case 'admin': return Theme.of(context).colorScheme.error;
      case 'repairman': return StatusColors.of(context).info;
      case 'coach': return DashboardColors.of(context).adminAccent;
      default: return Theme.of(context).colorScheme.outline;
    }
  }

  String _getRoleName(String? role) {
    switch (role) {
      case 'admin': return 'مدیر';
      case 'repairman': return 'تعمیرکار';
      case 'user': return 'کاربر';
      default: return role ?? 'نامشخص';
    }
  }
}
