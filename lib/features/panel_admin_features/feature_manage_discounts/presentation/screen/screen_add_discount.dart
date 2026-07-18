import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../../core/services/locator.dart';
import '../../domain/repository/manage_discounts_repository.dart';
import '../../data/model/discount_model.dart';

class ScreenAddDiscount extends StatefulWidget {
  const ScreenAddDiscount({super.key});

  @override
  State<ScreenAddDiscount> createState() => _ScreenAddDiscountState();
}

class _ScreenAddDiscountState extends State<ScreenAddDiscount> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  final _expiryController = TextEditingController();
  final _useNumberController = TextEditingController();
  final _percentageController = TextEditingController();
  final _amountController = TextEditingController();
  
  String _discountType = 'percentage';
  bool _isLoading = false;

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    final repo = locator<ManageDiscountsRepository>();
    
    final discount = DiscountModel(
      discountCode: _codeController.text,
      discountCodeExpiresAt: _expiryController.text,
      discountCodeUseNumber: int.tryParse(_useNumberController.text),
      discountType: _discountType,
      discountPercentage: _discountType == 'percentage' ? int.tryParse(_percentageController.text) : 0,
      discountAmount: _discountType == 'fixed_amount' ? int.tryParse(_amountController.text) : 0,
      role: ['user'], // Default roles for now
    );

    final result = await repo.addDiscount(discount);
    setState(() => _isLoading = false);

    if (result is DataSuccess) {
      if (mounted) context.pop(true);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.error ?? 'خطا در ثبت اطلاعات'),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('اطلاعات پایه'),
              _buildField(
                controller: _codeController,
                label: 'کد تخفیف (مثال: ZINO2024)',
                icon: Icons.qr_code_rounded,
                validator: (v) => v!.isEmpty ? 'وارد کردن کد الزامی است' : null,
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: _buildField(
                      controller: _expiryController,
                      label: 'تاریخ انقضا (YYYY-MM-DD)',
                      icon: Icons.calendar_today_rounded,
                      validator: (v) => v!.isEmpty ? 'الزامی' : null,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: _buildField(
                      controller: _useNumberController,
                      label: 'تعداد دفعات استفاده',
                      icon: Icons.numbers_rounded,
                      keyboardType: TextInputType.number,
                      validator: (v) => v!.isEmpty ? 'الزامی' : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              _buildSectionHeader('نوع و مقدار تخفیف'),
              _buildTypeSelector(),
              SizedBox(height: 20.h),
              if (_discountType == 'Percentage')
                _buildField(
                  controller: _percentageController,
                  label: 'درصد تخفیف (0-100)',
                  icon: Icons.percent_rounded,
                  keyboardType: TextInputType.number,
                  validator: (v) => v!.isEmpty ? 'الزامی' : null,
                )
              else
                _buildField(
                  controller: _amountController,
                  label: 'مبلغ تخفیف (تومان)',
                  icon: Icons.payments_rounded,
                  keyboardType: TextInputType.number,
                  validator: (v) => v!.isEmpty ? 'الزامی' : null,
                ),
              SizedBox(height: 48.h),
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: Colors.white,
                    elevation: 8,
                    shadowColor: colorScheme.primary.withValues(alpha: 0.3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                  ),
                  child: _isLoading
                      ? SizedBox(
                          width: 24.sp,
                          height: 24.sp,
                          child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                        )
                      : Text(
                          'ایجاد کد تخفیف',
                          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Container(
            width: 4.w,
            height: 16.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w900,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeSelector() {
    return Container(
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6F8),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          _buildTypeOption('درصدی', 'percentage'),
          _buildTypeOption('مبلغ ثابت', 'fixed_amount'),
        ],
      ),
    );
  }

  Widget _buildTypeOption(String label, String type) {
    final isSelected = _discountType == type;
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _discountType = type),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: isSelected
                ? [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]
                : null,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? colorScheme.primary : Colors.black45,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w, bottom: 8.h),
          child: Text(
            label,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: Colors.black54),
          ),
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, size: 20.sp, color: Colors.black45),
            filled: true,
            fillColor: const Color(0xFFF5F6F8),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.5),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          ),
        ),
      ],
    );
  }
}
