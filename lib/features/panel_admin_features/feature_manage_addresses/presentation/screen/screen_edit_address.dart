import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../../core/services/locator.dart';
import '../../domain/repository/manage_addresses_repository.dart';
import '../../data/model/address_model.dart';

class ScreenEditAddress extends StatefulWidget {
  final String? addressId;
  const ScreenEditAddress({super.key, this.addressId});

  @override
  State<ScreenEditAddress> createState() => _ScreenEditAddressState();
}

class _ScreenEditAddressState extends State<ScreenEditAddress> {
  final _formKey = GlobalKey<FormState>();
  final _fullAddressController = TextEditingController();
  final _pelakController = TextEditingController();
  final _vahedController = TextEditingController();
  final _postalCodeController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.addressId != null) {
      _loadAddress();
    }
  }

  Future<void> _loadAddress() async {
    setState(() => _isLoading = true);
    final repo = locator<ManageAddressesRepository>();
    final dataState = await repo.getAddress(widget.addressId!);
    if (dataState is DataSuccess) {
      final addr = dataState.data!;
      _fullAddressController.text = addr.fullAddress ?? '';
      _pelakController.text = addr.pelak ?? '';
      _vahedController.text = addr.vahed ?? '';
      _postalCodeController.text = addr.postalCode ?? '';
    }
    setState(() => _isLoading = false);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    final repo = locator<ManageAddressesRepository>();
    final address = AddressModel(
      fullAddress: _fullAddressController.text,
      pelak: _pelakController.text,
      vahed: _vahedController.text,
      postalCode: _postalCodeController.text,
      ostanId: 1, // Default values
      shahrestanId: 15,
      latitude: 35.6892,
      longitude: 51.389,
    );

    DataState<bool> result;
    if (widget.addressId != null) {
      result = await repo.editAddress(widget.addressId!, address);
    } else {
      result = await repo.addAddress(address);
    }

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
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline_rounded, color: colorScheme.primary, size: 24.sp),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        'لطفا مشخصات دقیق آدرس را برای ثبت در سیستم وارد نمایید.',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: colorScheme.primary,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              if (_isLoading && widget.addressId != null && _fullAddressController.text.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: CircularProgressIndicator(),
                  ),
                )
              else ...[
                _buildField(
                  controller: _fullAddressController,
                  label: 'نشانی دقیق (خیابان، کوچه و ...)',
                  icon: Icons.map_rounded,
                  maxLines: 3,
                  validator: (v) => v!.isEmpty ? 'وارد کردن نشانی اجباری است' : null,
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: _buildField(
                        controller: _pelakController,
                        label: 'پلاک',
                        icon: Icons.tag_rounded,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: _buildField(
                        controller: _vahedController,
                        label: 'واحد',
                        icon: Icons.apartment_rounded,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                _buildField(
                  controller: _postalCodeController,
                  label: 'کد پستی ',
                  icon: Icons.local_post_office_rounded,
                  keyboardType: TextInputType.number,
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
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                        : Text(
                            widget.addressId == null ? 'ثبت آدرس جدید' : 'ذخیره تغییرات',
                            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ],
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
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
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, size: 20.sp, color: Colors.black45),
            filled: true,
            fillColor: const Color(0xFFF5F6F8),
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
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: maxLines > 1 ? 12.h : 16.h),
          ),
        ),
      ],
    );
  }
}
