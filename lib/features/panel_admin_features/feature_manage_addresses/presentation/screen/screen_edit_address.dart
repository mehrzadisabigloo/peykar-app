import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../../core/services/locator.dart';
import '../../../../../core/widgets/cstm_snakbar.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_sending_methods/data/model/location_model.dart';
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
  
  List<OstanModel> _ostans = [];
  List<ShahrestanModel> _shahrestans = [];
  int? _selectedOstanId;
  int? _selectedShahrestanId;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchInitialData();
  }

  Future<void> _fetchInitialData() async {
    setState(() => _isLoading = true);
    try {
      await _fetchOstans();
      if (widget.addressId != null) {
        await _loadAddress();
      } else {
        // Default values for new address: Zanjan
        _selectedOstanId = 14;
        _selectedShahrestanId = 221;
        await _fetchShahrestans(14);
      }
    } catch (e) {
      if (mounted) CstmSnackBar.showError(context, 'خطا در دریافت اطلاعات اولیه');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _fetchOstans() async {
    final repo = locator<ManageAddressesRepository>();
    final result = await repo.fetchOstans();
    if (result is DataSuccess) {
      _ostans = result.data ?? [];
    }
  }

  Future<void> _fetchShahrestans(int ostanId) async {
    final repo = locator<ManageAddressesRepository>();
    final result = await repo.fetchShahrestans(ostanId);
    if (result is DataSuccess) {
      setState(() {
        _shahrestans = result.data ?? [];
      });
    }
  }

  Future<void> _loadAddress() async {
    final repo = locator<ManageAddressesRepository>();
    final dataState = await repo.getAddress(widget.addressId!);
    if (dataState is DataSuccess) {
      final addr = dataState.data!;
      _fullAddressController.text = addr.fullAddress ?? '';
      _pelakController.text = addr.pelak ?? '';
      _vahedController.text = addr.vahed ?? '';
      _postalCodeController.text = addr.postalCode ?? '';
      _selectedOstanId = addr.ostanId;
      _selectedShahrestanId = addr.shahrestanId;
      
      if (_selectedOstanId != null) {
        await _fetchShahrestans(_selectedOstanId!);
      }
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    
    if (_selectedOstanId == null || _selectedShahrestanId == null) {
      CstmSnackBar.showError(context, 'لطفا استان و شهرستان را انتخاب کنید');
      return;
    }

    setState(() => _isLoading = true);
    final repo = locator<ManageAddressesRepository>();
    final address = AddressModel(
      fullAddress: _fullAddressController.text,
      pelak: _pelakController.text,
      vahed: _vahedController.text,
      postalCode: _postalCodeController.text,
      ostanId: _selectedOstanId,
      shahrestanId: _selectedShahrestanId,
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
        CstmSnackBar.showError(context, result.error ?? 'خطا در ثبت اطلاعات');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
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
                          fontFamily: 'BonyadeKoodak',
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
                Row(
                  children: [
                    Expanded(
                      child: _buildLocationDropdown<int>(
                        label: 'استان',
                        value: _selectedOstanId,
                        items: _ostans.map((o) => DropdownMenuItem(value: o.id, child: Text(o.name ?? '', style: const TextStyle(fontFamily: 'BonyadeKoodak')))).toList(),
                        onChanged: (v) {
                          setState(() {
                            _selectedOstanId = v;
                            _selectedShahrestanId = null;
                            _shahrestans = [];
                          });
                          if (v != null) _fetchShahrestans(v);
                        },
                        hint: 'انتخاب استان',
                        icon: Icons.map_outlined,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: _buildLocationDropdown<int>(
                        label: 'شهرستان',
                        value: _selectedShahrestanId,
                        items: _shahrestans.map((s) => DropdownMenuItem(value: s.id, child: Text(s.name ?? '', style: const TextStyle(fontFamily: 'BonyadeKoodak')))).toList(),
                        onChanged: (v) => setState(() => _selectedShahrestanId = v),
                        hint: 'انتخاب شهرستان',
                        icon: Icons.location_city_rounded,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
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
                      foregroundColor: colorScheme.surface,
                      elevation: 8,
                      shadowColor: colorScheme.primary.withValues(alpha: 0.3),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                    ),
                    child: _isLoading
                        ? SizedBox(
                            width: 24.sp,
                            height: 24.sp,
                            child: CircularProgressIndicator(
                              color: colorScheme.surface,
                              strokeWidth: 2.5,
                            ),
                          )
                        : Text(
                            widget.addressId == null ? 'ثبت آدرس جدید' : 'ذخیره تغییرات',
                            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, fontFamily: 'BonyadeKoodak'),
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

  Widget _buildLocationDropdown<T>({
    required String label,
    required T? value,
    required List<DropdownMenuItem<T>> items,
    required Function(T?) onChanged,
    String? hint,
    IconData? icon,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w, bottom: 8.h),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13.sp, 
              color: colorScheme.onSurface.withValues(alpha: 0.54), 
              fontWeight: FontWeight.bold,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        DropdownButtonFormField<T>(
          value: items.any((item) => item.value == value) ? value : null,
          items: items,
          onChanged: onChanged,
          hint: hint != null ? Text(hint, style: TextStyle(fontSize: 12.sp, color: colorScheme.onSurface.withValues(alpha: 0.26), fontFamily: 'BonyadeKoodak')) : null,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: colorScheme.primary, size: 20.sp),
          decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(icon, size: 20.sp, color: colorScheme.onSurface.withValues(alpha: 0.45)) : null,
            filled: true,
            fillColor: colorScheme.surfaceContainer,
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
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          ),
          style: TextStyle(
            fontSize: 14.sp, 
            fontWeight: FontWeight.w600, 
            color: colorScheme.onSurface.withValues(alpha: 0.87), 
            fontFamily: 'BonyadeKoodak',
          ),
          dropdownColor: colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
        ),
      ],
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
    final colorScheme = Theme.of(context).colorScheme;
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
                      color: colorScheme.onSurface.withValues(alpha: 0.54),
                      fontFamily: 'BonyadeKoodak',
                    ),
                  ),
                ),
                TextFormField(
                  controller: controller,
                  keyboardType: keyboardType,
                  maxLines: maxLines,
                  validator: validator,
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, fontFamily: 'BonyadeKoodak'),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, size: 20.sp, color: colorScheme.onSurface.withValues(alpha: 0.45)),
            filled: true,
            fillColor: colorScheme.surfaceContainer,
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
              borderSide: BorderSide(color: colorScheme.error, width: 1),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: maxLines > 1 ? 12.h : 16.h),
          ),
        ),
      ],
    );
  }
}
