import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/services/locator.dart';
import '../../../../../../core/widgets/cstm_snakbar.dart';
import '../../domain/repository/manage_sending_methods_repository.dart';
import '../../data/model/sending_method_model.dart';
import '../../data/model/location_model.dart';

class ScreenAddSendingMethod extends StatefulWidget {
  final String? methodId;
  const ScreenAddSendingMethod({super.key, this.methodId});

  @override
  State<ScreenAddSendingMethod> createState() => _ScreenAddSendingMethodState();
}

class _ScreenAddSendingMethodState extends State<ScreenAddSendingMethod> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  
  List<SendingMethodLocationModel> _locations = [];
  List<OstanModel> _ostans = [];
  final Map<int, List<ShahrestanModel>> _shahrestansMap = {}; // ostanId -> List<ShahrestanModel>
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
      if (widget.methodId != null) {
        await _loadMethod();
      }
    } catch (e) {
      if (mounted) CstmSnackBar.showError(context, 'خطا در دریافت اطلاعات اولیه');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _fetchOstans() async {
    final repo = locator<ManageSendingMethodsRepository>();
    final result = await repo.fetchOstans();
    if (result is DataSuccess) {
      _ostans = result.data ?? [];
    }
  }

  Future<void> _fetchShahrestans(int ostanId) async {
    if (_shahrestansMap.containsKey(ostanId)) return;
    final repo = locator<ManageSendingMethodsRepository>();
    final result = await repo.fetchShahrestans(ostanId);
    if (result is DataSuccess) {
      setState(() {
        _shahrestansMap[ostanId] = result.data ?? [];
      });
    }
  }

  Future<void> _loadMethod() async {
    final repo = locator<ManageSendingMethodsRepository>();
    final dataState = await repo.getSendingMethod(widget.methodId!);
    if (dataState is DataSuccess) {
      final method = dataState.data!;
      _titleController.text = method.title ?? '';
      _priceController.text = method.price?.toString() ?? '';
      _locations = List.from(method.locations ?? []);
      
      // Fetch shahrestans for existing locations
      for (var loc in _locations) {
        if (loc.ostanId != null) {
          await _fetchShahrestans(loc.ostanId!);
        }
      }
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    final repo = locator<ManageSendingMethodsRepository>();
    
    final method = SendingMethodModel(
      title: _titleController.text,
      price: int.tryParse(_priceController.text),
      status: 'Active',
      locations: _locations,
    );

    DataState<bool> result;
    if (widget.methodId != null) {
      result = await repo.updateSendingMethod(widget.methodId!, method);
    } else {
      result = await repo.addSendingMethod(method);
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

  void _addLocation() {
    setState(() {
      _locations.add(SendingMethodLocationModel(
        ostanId: _ostans.isNotEmpty ? _ostans.first.id : null,
        shahrestanId: null,
        price: 0,
      ));
    });
    if (_ostans.isNotEmpty && _ostans.first.id != null) {
      _fetchShahrestans(_ostans.first.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: _isLoading && widget.methodId != null && _titleController.text.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                              'لطفا اطلاعات روش ارسال را برای ثبت در سیستم وارد نمایید.',
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
                    _buildSectionHeader('اطلاعات پایه'),
                    _buildField(
                      controller: _titleController,
                      label: 'عنوان روش ارسال (مثال: تیپاکس)',
                      icon: Icons.title_rounded,
                      validator: (v) => v!.isEmpty ? 'الزامی' : null,
                    ),
                    SizedBox(height: 20.h),
                    _buildField(
                      controller: _priceController,
                      label: 'هزینه پایه (تومان)',
                      icon: Icons.payments_rounded,
                      keyboardType: TextInputType.number,
                      validator: (v) => v!.isEmpty ? 'الزامی' : null,
                    ),
                    SizedBox(height: 32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSectionHeader('محدوده‌های قیمت اختصاصی'),
                        Container(
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: IconButton(
                            onPressed: _addLocation,
                            icon: Icon(Icons.add_location_alt_rounded,color: colorScheme.surface,),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    ..._locations.asMap().entries.map((entry) => _buildLocationCard(entry.key, entry.value)),
                    if (_locations.isEmpty)
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: Text(
                            'هیچ محدوده اختصاصی ثبت نشده است',
                            style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.26), fontSize: 12.sp),
                          ),
                        ),
                      ),
                    SizedBox(height: 48.h),
                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _save,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                          elevation: 8,
                          shadowColor: colorScheme.primary.withValues(alpha: 0.3),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                        ),
                        child: _isLoading
                            ? SizedBox(
                                width: 24.sp,
                                height: 24.sp,
                                child: CircularProgressIndicator(color: colorScheme.onPrimary, strokeWidth: 2.5),
                              )
                            : Text(
                                widget.methodId == null ? 'ایجاد روش ارسال' : 'ذخیره تغییرات',
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

  Widget _buildLocationCard(int index, SendingMethodLocationModel location) {
    final List<ShahrestanModel> shahrestans = _shahrestansMap[location.ostanId] ?? [];
    final colorScheme = Theme.of(context).colorScheme;
    final double dropdownWidth = (1.sw - 88.w - 12.w) / 2;

    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  'محدوده شماره ${index + 1}',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 12.sp,
                    color: colorScheme.primary,
                    fontFamily: 'BonyadeKoodak',
                  ),
                ),
              ),
              IconButton(
                onPressed: () => setState(() => _locations.removeAt(index)),
                icon: Icon(Icons.delete_outline_rounded, color: colorScheme.error, size: 22.sp),
                style: IconButton.styleFrom(
                  backgroundColor: colorScheme.error.withValues(alpha: 0.05),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: _buildLocationDropdown<int>(
                  label: 'استان',
                  value: location.ostanId,
                  items: _ostans.map((o) => DropdownMenuItem(value: o.id, child: Text(o.name ?? ''))).toList(),
                  onChanged: (v) {
                    setState(() {
                      location.ostanId = v;
                      location.shahrestanId = null;
                    });
                    if (v != null) _fetchShahrestans(v);
                  },
                  hint: 'انتخاب استان',
                  icon: Icons.map_outlined,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildLocationDropdown<int>(
                  label: 'شهرستان',
                  value: location.shahrestanId,
                  items: shahrestans.map((s) => DropdownMenuItem(value: s.id, child: Text(s.name ?? ''))).toList(),
                  onChanged: (v) => setState(() => location.shahrestanId = v),
                  hint: 'انتخاب شهرستان',
                  icon: Icons.location_city_rounded,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildSmallField(
            label: 'هزینه اختصاصی (تومان)',
            initialValue: location.price?.toString(),
            onChanged: (v) => setState(() => location.price = int.tryParse(v)),
          ),
        ],
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
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.54), 
              fontWeight: FontWeight.bold,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        DropdownButtonFormField<T>(
          value: items.any((item) => item.value == value) ? value : null,
          items: items,
          onChanged: onChanged,
          hint: hint != null ? Text(hint, style: TextStyle(fontSize: 12.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.26), fontFamily: 'BonyadeKoodak')) : null,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: colorScheme.primary, size: 20.sp),
          decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(icon, size: 20.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45)) : null,
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
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          ),
          style: TextStyle(
            fontSize: 14.sp, 
            fontWeight: FontWeight.w600, 
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87), 
            fontFamily: 'BonyadeKoodak',
          ),
          dropdownColor: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
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
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
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
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.54),
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
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
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 1),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          ),
        ),
      ],
    );
  }

  Widget _buildSmallField({
    required String label,
    String? initialValue,
    required Function(String) onChanged,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w, bottom: 6.h),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11.sp, 
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.54), 
              fontWeight: FontWeight.bold,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        TextFormField(
          initialValue: initialValue,
          onChanged: onChanged,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700, fontFamily: 'BonyadeKoodak'),
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.surfaceContainer,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r), 
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r), 
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r), 
              borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            prefixIcon: Icon(Icons.payments_outlined, size: 18.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.38)),
          ),
        ),
      ],
    );
  }
}
