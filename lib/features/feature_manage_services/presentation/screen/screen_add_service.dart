import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../base/base_manage_services_stateful_widget_state.dart';
import '../bloc/add_service/add_service_bloc.dart';
import 'package:resturant_app/features/feature_manage_products/presentation/widget/image_upload_slot.dart';

class ScreenAddService extends StatefulWidget {
  const ScreenAddService({super.key});

  @override
  State<ScreenAddService> createState() => _ScreenAddServiceState();
}

class _ScreenAddServiceState extends BaseManageServicesStatefulWidgetState<ScreenAddService, AddServiceBloc> {
  _ScreenAddServiceState() : super(locator<AddServiceBloc>());

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceMinController = TextEditingController();
  final _priceMaxController = TextEditingController();
  final _keywordsController = TextEditingController();

  List<String> keywords = [];
  final Map<int, String?> _uploadedImageIds = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceMinController.dispose();
    _priceMaxController.dispose();
    _keywordsController.dispose();
    super.dispose();
  }

  void _addKeyword(String value) {
    if (value.trim().isNotEmpty && !keywords.contains(value.trim())) {
      setState(() {
        keywords.add(value.trim());
        _keywordsController.clear();
      });
    }
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: BlocConsumer<AddServiceBloc, AddServiceState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is AddServiceSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('خدمت با موفقیت اضافه شد'), backgroundColor: Colors.green),
            );
            context.pop(true);
          } else if (state is AddServiceError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('تصاویر خدمت'),
                    SizedBox(height: 12.h),
                    Wrap(
                      spacing: 12.w,
                      runSpacing: 12.h,
                      children: List.generate(5, (index) {
                        return ImageUploadSlot(
                          index: index,
                          imageType: 'service',
                          initialImageId: _uploadedImageIds[index],
                          onUploadSuccess: (imageId) {
                            setState(() {
                              _uploadedImageIds[index] = imageId;
                            });
                          },
                        );
                      }),
                    ),
                    SizedBox(height: 24.h),
                    _buildSectionTitle('اطلاعات اصلی'),
                    SizedBox(height: 12.h),
                    _buildTextField(
                      controller: _titleController,
                      label: 'نام خدمت',
                      hint: 'مثلا: تعویض روغن در محل',
                      icon: Icons.title,
                      validator: (v) => v!.isEmpty ? 'نام خدمت الزامی است' : null,
                    ),
                    SizedBox(height: 16.h),
                    _buildTextField(
                      controller: _descriptionController,
                      label: 'توضیحات',
                      hint: 'توضیحات خدمت را اینجا بنویسید...',
                      icon: Icons.description,
                      maxLines: 3,
                      validator: (v) => v!.isEmpty ? 'توضیحات الزامی است' : null,
                    ),
                    SizedBox(height: 24.h),
                    _buildSectionTitle('محدوده قیمت'),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            controller: _priceMinController,
                            label: 'حداقل قیمت (تومان)',
                            hint: '0',
                            icon: Icons.attach_money,
                            keyboardType: TextInputType.number,
                            validator: (v) => v!.isEmpty ? 'حداقل قیمت الزامی است' : null,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildTextField(
                            controller: _priceMaxController,
                            label: 'حداکثر قیمت (تومان)',
                            hint: '0',
                            icon: Icons.attach_money,
                            keyboardType: TextInputType.number,
                            validator: (v) => v!.isEmpty ? 'حداکثر قیمت الزامی است' : null,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    _buildSectionTitle('کلمات کلیدی'),
                    SizedBox(height: 12.h),
                    _buildKeywordField(),
                    SizedBox(height: 12.h),
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      children: keywords.map((k) => _buildChip(k)).toList(),
                    ),
                    SizedBox(height: 40.h),
                    _buildSubmitButton(context, state),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF3F51B5),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon, color: const Color(0xFF3F51B5), size: 20.sp),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          labelStyle: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
          hintStyle: TextStyle(fontSize: 12.sp, color: Colors.grey[400]),
        ),
      ),
    );
  }

  Widget _buildKeywordField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        controller: _keywordsController,
        onFieldSubmitted: _addKeyword,
        decoration: InputDecoration(
          hintText: 'کلمه کلیدی را تایپ کرده و اینتر بزنید',
          prefixIcon: Icon(Icons.tag, color: const Color(0xFF3F51B5), size: 20.sp),
          suffixIcon: IconButton(
            icon: const Icon(Icons.add_circle, color: Color(0xFF3F51B5)),
            onPressed: () => _addKeyword(_keywordsController.text),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          hintStyle: TextStyle(fontSize: 12.sp, color: Colors.grey[400]),
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(fontSize: 12.sp, color: Colors.white),
      ),
      backgroundColor: const Color(0xFF3F51B5),
      deleteIcon: Icon(Icons.close, size: 14.sp, color: Colors.white),
      onDeleted: () {
        setState(() {
          keywords.remove(label);
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
    );
  }

  Widget _buildSubmitButton(BuildContext context, AddServiceState state) {
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: ElevatedButton(
        onPressed: state is AddServiceLoading
            ? null
            : () {
                if (_formKey.currentState!.validate()) {
                  final images = _uploadedImageIds.values.where((id) => id != null).cast<String>().toList();
                  bloc.add(AddServiceSubmitEvent(
                    title: _titleController.text,
                    description: _descriptionController.text,
                    images: images,
                    keywords: keywords,
                    priceMin: double.parse(_priceMinController.text),
                    priceMax: double.parse(_priceMaxController.text),
                  ));
                }
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3F51B5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          elevation: 0,
        ),
        child: state is AddServiceLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                'ثبت خدمت',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
