import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:chaharmahal_shop_front/core/widgets/empty_state_widget.dart';
import 'package:chaharmahal_shop_front/core/widgets/management_card_shimmer.dart';
import 'package:chaharmahal_shop_front/core/widgets/stylish_popup.dart';
import 'package:chaharmahal_shop_front/core/widgets/cstm_snakbar.dart';
import '../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../core/services/locator.dart';
import '../../../../../core/widgets/error_state_widget.dart';
import '../../../../../../core/themes/theme_main.dart';
import '../base/base_manage_bank_accounts_stateful_widget_state.dart';
import '../bloc/manage_bank_accounts_bloc.dart';

class ScreenManageBankAccounts extends StatefulWidget {
  const ScreenManageBankAccounts({super.key});

  @override
  State<ScreenManageBankAccounts> createState() => _ScreenManageBankAccountsState();
}

class _ScreenManageBankAccountsState extends BaseManageBankAccountsStatefulWidgetState<ScreenManageBankAccounts, ManageBankAccountsBloc> {
  _ScreenManageBankAccountsState() : super(locator<ManageBankAccountsBloc>());

  @override
  void initState() {
    super.initState();
    bloc.add(const FetchBankAccounts());
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceContainer,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await context.pushNamed('add_bank_account');
          if (result == true) {
            bloc.add(const FetchBankAccounts());
          }
        },
        backgroundColor: colorScheme.primary,
        icon: Icon(Icons.account_balance_rounded, color: colorScheme.surface),
        label: Text(
          'افزودن حساب جدید',
          style: TextStyle(
            color: colorScheme.surface,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'BonyadeKoodak',
          ),
        ),
      ),
      body: BlocConsumer<ManageBankAccountsBloc, ManageBankAccountsState>(
        listener: (context, state) {
          if (state is BankAccountActionSuccess) {
            CstmSnackBar.showSuccess(context, state.message);
            bloc.add(const FetchBankAccounts());
          }
          if (state is BankAccountsLoaded) {
            if (state.successMessage != null) {
              CstmSnackBar.showSuccess(context, state.successMessage!);
            }
            if (state.errorMessage != null) {
              CstmSnackBar.showError(context, state.errorMessage!);
            }
          }
        },
        builder: (context, state) {
          if (state is ManageBankAccountsInitial || state is ManageBankAccountsLoading) {
            return ListView.builder(
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
              itemCount: 5,
              itemBuilder: (context, index) => const ManagementCardShimmer(height: 180),
            );
          }

          if (state is ManageBankAccountsError) {
            return ErrorStateWidget(
              message: state.message,
              onRetry: () => bloc.add(const FetchBankAccounts()),
            );
          }

          if (state is BankAccountsLoaded) {
            final accounts = state.accounts;
            if (accounts.isEmpty) {
              return const EmptyStateWidget(
                title: 'هیچ حسابی ثبت نشده است',
                description: 'لیست حساب‌های بانکی شما در حال حاضر خالی است.',
                icon: Icons.account_balance_wallet_outlined,
              );
            }

            return ListView.builder(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
                itemCount: accounts.length,
                itemBuilder: (context, index) {
                  final account = accounts[index];
                  final isProcessing = state.processingId == account.id;
                  final isDeleting = isProcessing && state.isDeleting;
                  final isChangingStatus = isProcessing && !state.isDeleting;

                  return Container(
                    margin: EdgeInsets.only(bottom: 20.h),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(28.r),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withValues(alpha: 0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28.r),
                      child: Column(
                        children: [
                          // Card Header
                          Container(
                            padding: EdgeInsets.all(20.r),
                            decoration: BoxDecoration(
                              color: colorScheme.primary.withValues(alpha: 0.03),
                              border: Border(bottom: BorderSide(color: colorScheme.outlineVariant)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(12.r),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [colorScheme.primary, colorScheme.primary.withValues(alpha: 0.7)],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(16.r),
                                        boxShadow: [
                                          BoxShadow(
                                            color: colorScheme.primary.withValues(alpha: 0.3),
                                            blurRadius: 8,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: Icon(Icons.account_balance_wallet_rounded, color: colorScheme.surface, size: 24.sp),
                                    ),
                                    SizedBox(width: 16.w),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          account.bank?.name ?? 'بانک نامشخص',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w900,
                                            color: colorScheme.onSurface,
                                            fontFamily: 'BonyadeKoodak',
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        Text(
                                          'حساب بانکی تایید شده',
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            color: colorScheme.onSurface.withValues(alpha: 0.38),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'BonyadeKoodak',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                _buildStatusBadge(account.isActive),
                              ],
                            ),
                          ),
                          
                          // Card Body
                          Padding(
                            padding: EdgeInsets.all(20.r),
                            child: Column(
                              children: [
                                _buildInfoRow(Icons.person_outline_rounded, 'صاحب حساب', account.fullName, colorScheme),
                                _buildInfoRow(Icons.credit_card_rounded, 'شماره کارت', account.cardNumber, colorScheme),
                                _buildInfoRow(Icons.numbers_rounded, 'شماره حساب', account.accountNumber, colorScheme),
                                _buildInfoRow(Icons.account_balance_rounded, 'شماره شبا', account.shebaNumber, colorScheme),
                              ],
                            ),
                          ),
                          
                          // Card Footer / Actions
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainer,
                              border: Border(top: BorderSide(color: colorScheme.outlineVariant)),
                            ),
                            child: Row(
                              children: [
                                isChangingStatus 
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                                      child: SizedBox(
                                        width: 18.sp,
                                        height: 18.sp,
                                        child: CircularProgressIndicator(strokeWidth: 2.5, color: StatusColors.of(context).warning),
                                      ),
                                    )
                                  : TextButton.icon(
                                      onPressed: isProcessing ? null : () => bloc.add(ChangeBankAccountStatusEvent(account.id!)),
                                      icon: Icon(
                                        account.isActive ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                        size: 18.sp,
                                        color: account.isActive ? StatusColors.of(context).warning : StatusColors.of(context).success,
                                      ),
                                      label: Text(
                                        account.isActive ? 'غیرفعال‌سازی' : 'فعال‌سازی',
                                        style: TextStyle(
                                          color: account.isActive ? StatusColors.of(context).warning : StatusColors.of(context).success,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 12.sp,
                                          fontFamily: 'BonyadeKoodak',
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                                      ),
                                    ),
                                const Spacer(),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: isProcessing ? null : () => _showDeleteDialog(context, account.id!),
                                      icon: isDeleting
                                          ? SizedBox(
                                              width: 16.sp,
                                              height: 16.sp,
                                              child: CircularProgressIndicator(strokeWidth: 2, color: colorScheme.error),
                                            )
                                          : Icon(Icons.delete_outline_rounded, size: 22.sp, color: colorScheme.error),
                                      style: IconButton.styleFrom(
                                        backgroundColor: colorScheme.error.withValues(alpha: 0.1),
                                        padding: EdgeInsets.all(8.r),
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    ElevatedButton.icon(
                                      onPressed: isProcessing ? null : () async {
                                        final result = await context.pushNamed('edit_bank_account', pathParameters: {'id': account.id!}, extra: account);
                                        if (result == true) {
                                          bloc.add(const FetchBankAccounts());
                                        }
                                      },
                                      icon: Icon(Icons.edit_rounded, size: 18.sp),
                                      label: const Text('ویرایش'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: colorScheme.primary,
                                        foregroundColor: colorScheme.surface,
                                        elevation: 4,
                                        shadowColor: colorScheme.primary.withValues(alpha: 0.3),
                                        minimumSize: Size(90.w, 42.h),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                                        textStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, fontFamily: 'BonyadeKoodak'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildStatusBadge(bool isActive) {
    final statusColors = StatusColors.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isActive ? statusColors.success.withValues(alpha: 0.1) : statusColors.warning.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        isActive ? 'فعال' : 'غیرفعال',
        style: TextStyle(
          color: isActive ? statusColors.success : statusColors.warning,
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'BonyadeKoodak',
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String? value, ColorScheme colorScheme) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();
    
    // Formatting logic
    String formattedValue = value;
    if (label == 'شماره کارت' && value.length == 16) {
      final segments = [
        value.substring(0, 4),
        value.substring(4, 8),
        value.substring(8, 12),
        value.substring(12, 16),
      ];
      // Swap segments for RTL display
      formattedValue = segments.reversed.join(' - ');
    } else if (label == 'شماره شبا') {
      if (!value.startsWith('IR')) {
        formattedValue = 'IR - $value';
      } else {
        formattedValue = value.replaceFirst('IR', 'IR - ');
      }
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6.r),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(icon, size: 16.sp, color: colorScheme.primary),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: TextStyle(color: colorScheme.onSurface.withValues(alpha: 0.45), fontSize: 10.sp, fontWeight: FontWeight.bold, fontFamily: 'BonyadeKoodak')),
                  SizedBox(height: 2.h),
                  Text(
                    formattedValue,
                    textDirection: label.contains('شماره') ? TextDirection.ltr : null,
                    textAlign: label.contains('شماره') ? TextAlign.left : TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 13.sp,
                      letterSpacing: label.contains('شماره') ? 1.2 : 0,
                      color: colorScheme.onSurface,
                      fontFamily: 'BonyadeKoodak',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            IconButton(
              onPressed: () {
                // Future: Copy to clipboard
                CstmSnackBar.showSuccess(context, '$label کپی شد');
              },
              icon: Icon(Icons.copy_rounded, size: 16.sp, color: colorScheme.onSurface.withValues(alpha: 0.26)),
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, String id) {
    ConfirmationPopup.show(
      context,
      title: 'حذف حساب بانکی',
      description: 'آیا از حذف این حساب بانکی اطمینان دارید؟',
      confirmText: 'حذف',
      cancelText: 'انصراف',
      icon: Icons.delete_forever_rounded,
      onConfirm: () => bloc.add(DeleteBankAccountEvent(id)),
    );
  }
}
