import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../core/resources/consts.dart';
import '../../../../../core/services/locator.dart';
import '../../../../../core/widgets/cstm_snakbar.dart';
import '../../domain/entity/manage_bank_accounts_entity.dart';
import '../base/base_manage_bank_accounts_stateful_widget_state.dart';
import '../bloc/manage_bank_accounts_bloc.dart';

class ScreenAddBankAccount extends StatefulWidget {
  final BankAccountEntity? account;
  const ScreenAddBankAccount({super.key, this.account});

  @override
  State<ScreenAddBankAccount> createState() => _ScreenAddBankAccountState();
}

class _ScreenAddBankAccountState extends BaseManageBankAccountsStatefulWidgetState<ScreenAddBankAccount, ManageBankAccountsBloc> {
  _ScreenAddBankAccountState() : super(locator<ManageBankAccountsBloc>());

  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _cardController;
  late final TextEditingController _accountController;
  late final TextEditingController _shebaController;
  int? _selectedBankId;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.account?.fullName);
    _cardController = TextEditingController(text: widget.account?.cardNumber);
    _accountController = TextEditingController(text: widget.account?.accountNumber);
    _shebaController = TextEditingController(text: widget.account?.shebaNumber);
    _selectedBankId = widget.account?.bankId ?? widget.account?.bank?.id;
    bloc.add(const FetchBanksEvent());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _cardController.dispose();
    _accountController.dispose();
    _shebaController.dispose();
    super.dispose();
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocBuilder<ManageBankAccountsBloc, ManageBankAccountsState>(
        builder: (context, state) {
          final isActionLoading = (state is BanksLoaded && state.isActionLoading) || 
                                 (state is BankAccountsLoaded && state.isActionLoading) ||
                                 (state is ManageBankAccountsError && state.isActionLoading);
          final isLoading = (state is ManageBankAccountsLoading) || isActionLoading;
          final banks = state is BanksLoaded ? state.banks : <BankEntity>[];
          final isBanksLoading = (state is ManageBankAccountsLoading) && banks.isEmpty;

          return BlocListener<ManageBankAccountsBloc, ManageBankAccountsState>(
            listener: (context, state) {
              if (state is BankAccountActionSuccess) {
                context.pop(true);
              }
              if (state is BanksLoaded) {
                if (_selectedBankId == null && state.banks.isNotEmpty) {
                  setState(() {
                    _selectedBankId = state.banks.first.id;
                  });
                }
              }
              if (state is ManageBankAccountsError) {
                CstmSnackBar.showError(context, state.message);
              }
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.w),
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(colorScheme),
                    SizedBox(height: 32.h),
                    _buildSectionHeader('اطلاعات بانکی', colorScheme),
                    SizedBox(height: 16.h),
                    
                    _buildBankDropdown(colorScheme, isBanksLoading, banks),
                    SizedBox(height: 16.h),
                    _buildSectionHeader('اطلاعات صاحب حساب', colorScheme),
                    SizedBox(height: 16.h),
                    _buildField(
                      controller: _nameController,
                      label: 'نام و نام خانوادگی',
                      icon: Icons.person_outline_rounded,
                      validator: (v) => v!.isEmpty ? 'وارد کردن نام الزامی است' : null,
                      colorScheme: colorScheme,
                    ),
                    SizedBox(height: 24.h),
                    _buildSectionHeader('جزئیات حساب', colorScheme),
                    SizedBox(height: 16.h),
                    _buildField(
                      controller: _cardController,
                      label: 'شماره کارت',
                      icon: Icons.credit_card_rounded,
                      keyboardType: TextInputType.number,
                      maxLength: 16,
                      colorScheme: colorScheme,
                    ),
                    SizedBox(height: 16.h),
                    _buildField(
                      controller: _accountController,
                      label: 'شماره حساب',
                      icon: Icons.numbers_rounded,
                      keyboardType: TextInputType.number,
                      colorScheme: colorScheme,
                    ),
                    SizedBox(height: 16.h),
                    _buildField(
                      controller: _shebaController,
                      label: 'شماره شبا (با IR)',
                      icon: Icons.account_balance_rounded,
                      keyboardType: TextInputType.text,
                      maxLength: 26,
                      colorScheme: colorScheme,
                    ),
                    SizedBox(height: 48.h),
                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : () => _save(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                          elevation: 8,
                          shadowColor: colorScheme.primary.withValues(alpha: 0.3),
                          textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, fontFamily: 'BonyadeKoodak'),
                        ),
                        child: isLoading
                            ? SizedBox(width: 24.sp, height: 24.sp, child: CircularProgressIndicator(color: colorScheme.onPrimary, strokeWidth: 2.5))
                            : Text(
                                widget.account == null ? 'ثبت حساب بانکی' : 'ذخیره تغییرات',
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, fontFamily: 'BonyadeKoodak'),
                              ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Icon(Icons.account_balance_rounded, color: colorScheme.primary, size: 24.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              'لطفا اطلاعات بانکی خود را با دقت وارد نمایید. این اطلاعات برای تسویه حساب‌های مالی استفاده خواهد شد.',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorScheme.primary,
                height: 1.5,
                fontFamily: 'BonyadeKoodak',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _save(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;
    
    if (_cardController.text.isEmpty && _accountController.text.isEmpty && _shebaController.text.isEmpty) {
      CstmSnackBar.showError(context, 'حداقل یکی از موارد شماره کارت، شماره حساب یا شماره شبا باید وارد شود.');
      return;
    }

    final account = BankAccountEntity(
      fullName: _nameController.text,
      cardNumber: _cardController.text,
      accountNumber: _accountController.text,
      shebaNumber: _shebaController.text,
      bankId: _selectedBankId,
    );

    if (widget.account != null) {
      bloc.add(UpdateBankAccountEvent(widget.account!.id!, account));
    } else {
      bloc.add(AddBankAccountEvent(account));
    }
  }

  Widget _buildSectionHeader(String title, ColorScheme colorScheme) {
    return Row(
      children: [
        Container(
          width: 4.w,
          height: 16.h,
          decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        SizedBox(width: 8.w),
        Text(title, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w900, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87), fontFamily: 'BonyadeKoodak')),
      ],
    );
  }

  Widget _buildBankDropdown(ColorScheme colorScheme, bool isLoading, List<BankEntity> banks) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w, bottom: 8.h),
          child: Text(
            'انتخاب بانک',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.54),
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: DropdownMenu<int>(
              key: ValueKey('bank_dropdown_${banks.length}'),
              initialSelection: _selectedBankId,
              width: 1.sw - 48.w,
              menuHeight: 300.h,
              enableSearch: false,
              hintText: isLoading ? 'در حال دریافت لیست بانک‌ها...' : 'بانک خود را انتخاب کنید',
              selectedTrailingIcon: Icon(Icons.check_circle_rounded, color: colorScheme.primary, size: 20.sp),
              textStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
                fontFamily: 'BonyadeKoodak',
              ),
              menuStyle: MenuStyle(
                backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.surface),
                elevation: WidgetStateProperty.all(15),
                shadowColor: WidgetStateProperty.all(Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2)),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceContainer,
                hoverColor: Colors.transparent,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
                ),
              ),
              dropdownMenuEntries: banks.map((BankEntity bank) {
                final bool isSelected = bank.id == _selectedBankId;
                return DropdownMenuEntry<int>(
                  value: bank.id!,
                  label: bank.name ?? '',
                  style: MenuItemButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    backgroundColor: isSelected ? colorScheme.primary.withValues(alpha: 0.05) : Colors.transparent,
                    foregroundColor: isSelected ? colorScheme.primary : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
                  ),
                  labelWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          if (bank.logo != null && bank.logo!.isNotEmpty) ...[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4.r),
                              child: CachedNetworkImage(
                                imageUrl: bank.logo!.startsWith('http') ? bank.logo! : '${Consts.baseFileUrl}${bank.logo}',
                                width: 24.sp,
                                height: 24.sp,
                                placeholder: (context, url) => Container(color: Theme.of(context).colorScheme.surfaceContainerHighest),
                                errorWidget: (context, url, error) => Icon(Icons.account_balance_rounded, size: 20.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.26)),
                              ),
                            ),
                            SizedBox(width: 12.w),
                          ],
                          Text(
                            bank.name ?? '',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? colorScheme.primary : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
                              fontFamily: 'BonyadeKoodak',
                            ),
                          ),
                        ],
                      ),
                      if (isSelected)
                        Icon(
                          Icons.check_circle_rounded,
                          color: colorScheme.primary,
                          size: 18.sp,
                        ),
                    ],
                  ),
                );
              }).toList(),
              onSelected: isLoading
                  ? null
                  : (value) {
                      setState(() {
                        _selectedBankId = value;
                      });
                    },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    int? maxLength,
    String? Function(String?)? validator,
    required ColorScheme colorScheme,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w, bottom: 8.h),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.54),
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLength: maxLength,
          validator: validator,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, fontFamily: 'BonyadeKoodak'),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, size: 20.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45)),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surfaceContainer,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 1),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            counterText: '',
          ),
        ),
      ],
    );
  }
}
