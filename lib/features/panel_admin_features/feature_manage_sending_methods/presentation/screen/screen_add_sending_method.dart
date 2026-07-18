import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/services/locator.dart';
import '../../domain/repository/manage_sending_methods_repository.dart';
import '../../data/model/sending_method_model.dart';

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
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.methodId != null) {
      _loadMethod();
    }
  }

  Future<void> _loadMethod() async {
    setState(() => _isLoading = true);
    final repo = locator<ManageSendingMethodsRepository>();
    final dataState = await repo.getSendingMethod(widget.methodId!);
    if (dataState is DataSuccess) {
      final method = dataState.data!;
      _titleController.text = method.title ?? '';
      _priceController.text = method.price?.toString() ?? '';
      _locations = List.from(method.locations ?? []);
    }
    setState(() => _isLoading = false);
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.error ?? 'خطا در ثبت اطلاعات'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  void _addLocation() {
    setState(() {
      _locations.add(SendingMethodLocationModel(
        ostanId: 1,
        shahrestanId: 1,
        price: 0,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
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
                            icon: const Icon(Icons.add_location_alt_rounded,color: Colors.white,),
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
                            style: TextStyle(color: Colors.black26, fontSize: 12.sp),
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
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6F8),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'محدوده شماره ${index + 1}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
                ),
              ),
              IconButton(
                onPressed: () => setState(() => _locations.removeAt(index)),
                icon: const Icon(Icons.delete_sweep_rounded, color: Colors.redAccent),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: _buildSmallField(
                  label: 'کد استان',
                  initialValue: location.ostanId?.toString(),
                  onChanged: (v) => setState(() => location.ostanId = int.tryParse(v)),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildSmallField(
                  label: 'کد شهرستان',
                  initialValue: location.shahrestanId?.toString(),
                  onChanged: (v) => setState(() => location.shahrestanId = int.tryParse(v)),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          _buildSmallField(
            label: 'هزینه اختصاصی (تومان)',
            initialValue: location.price?.toString(),
            onChanged: (v) => setState(() => location.price = int.tryParse(v)),
          ),
        ],
      ),
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
            color: Colors.black87,
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

  Widget _buildSmallField({
    required String label,
    String? initialValue,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 10.sp, color: Colors.black45, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4.h),
        TextFormField(
          initialValue: initialValue,
          onChanged: onChanged,
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide.none),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          ),
        ),
      ],
    );
  }
}
