import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:resturant_app/core/widgets/empty_state_widget.dart';
import 'package:resturant_app/core/widgets/list_shimmer.dart';
import 'package:resturant_app/core/widgets/stylish_popup.dart';
import '../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../core/services/locator.dart';
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
      backgroundColor: const Color(0xFFF8F9FB),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await context.pushNamed('add_bank_account');
          if (result == true) {
            bloc.add(const FetchBankAccounts());
          }
        },
        backgroundColor: colorScheme.primary,
        icon: const Icon(Icons.account_balance_rounded, color: Colors.white),
        label: Text(
          'افزودن حساب جدید',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocConsumer<ManageBankAccountsBloc, ManageBankAccountsState>(
        listener: (context, state) {
          if (state is BankAccountActionSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.green),
            );
            bloc.add(const FetchBankAccounts());
          }
        },
        builder: (context, state) {
          if (state is ManageBankAccountsLoading) {
            return const ListShimmer(height: 180);
          }

          if (state is ManageBankAccountsError) {
            return EmptyStateWidget(
              title: 'خطا در بارگذاری',
              description: state.message,
              icon: Icons.error_outline_rounded,
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

            return RefreshIndicator(
              onRefresh: () async => bloc.add(const FetchBankAccounts()),
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 100.h),
                itemCount: accounts.length,
                itemBuilder: (context, index) {
                  final account = accounts[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    padding: EdgeInsets.all(20.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.03),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10.r),
                                  decoration: BoxDecoration(
                                    color: colorScheme.primary.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Icon(Icons.person_outline_rounded, color: colorScheme.primary, size: 22.sp),
                                ),
                                SizedBox(width: 14.w),
                                Text(
                                  account.fullName ?? 'نامشخص',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w900,
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                            _buildStatusBadge(account.isActive),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        _buildInfoRow(Icons.credit_card_rounded, 'شماره کارت', account.cardNumber, colorScheme),
                        _buildInfoRow(Icons.numbers_rounded, 'شماره حساب', account.accountNumber, colorScheme),
                        _buildInfoRow(Icons.account_balance_rounded, 'شماره شبا', account.shebaNumber, colorScheme),
                        SizedBox(height: 20.h),
                        Divider(color: Colors.grey.withValues(alpha: 0.05)),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                bloc.add(ChangeBankAccountStatusEvent(account.id!));
                              },
                              child: Text(
                                account.isActive ? 'غیرفعال‌سازی' : 'فعال‌سازی',
                                style: TextStyle(
                                  color: account.isActive ? Colors.orange : Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => _showDeleteDialog(context, account.id!),
                                  icon: Icon(Icons.delete_sweep_rounded, color: colorScheme.error, size: 24.sp),
                                ),
                                SizedBox(width: 8.w),
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    final result = await context.pushNamed('edit_bank_account', pathParameters: {'id': account.id!}, extra: account);
                                    if (result == true) {
                                      bloc.add(const FetchBankAccounts());
                                    }
                                  },
                                  icon: Icon(Icons.edit_note_rounded, size: 20.sp),
                                  label: const Text('ویرایش'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: colorScheme.primary.withValues(alpha: 0.1),
                                    foregroundColor: colorScheme.primary,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildStatusBadge(bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isActive ? Colors.green.withValues(alpha: 0.1) : Colors.orange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        isActive ? 'فعال' : 'غیرفعال',
        style: TextStyle(
          color: isActive ? Colors.green : Colors.orange,
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String? value, ColorScheme colorScheme) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Icon(icon, size: 16.sp, color: colorScheme.onSurface.withValues(alpha: 0.4)),
          SizedBox(width: 10.w),
          Text('$label: ', style: TextStyle(color: Colors.black54, fontSize: 12.sp)),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13.sp,
              letterSpacing: 1.1,
              color: colorScheme.onSurface,
            ),
          ),
        ],
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
