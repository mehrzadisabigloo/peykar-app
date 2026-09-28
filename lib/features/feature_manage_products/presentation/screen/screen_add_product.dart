import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../domain/entity/manage_products_entity.dart';
import '../base/base_manage_products_stateful_widget_state.dart';
import '../bloc/add_product/add_product_bloc.dart';
import '../widget/image_upload_slot.dart';
import '../../../../core/widgets/category_picker_sheet.dart';
import '../../../../core/themes/theme_main.dart';

class ScreenAddProduct extends StatefulWidget {
  const ScreenAddProduct({super.key});

  @override
  State<ScreenAddProduct> createState() => _ScreenAddProductState();
}

class _ScreenAddProductState
    extends BaseManageProductsStatefulWidgetState<ScreenAddProduct, AddProductBloc> {
  _ScreenAddProductState() : super(locator<AddProductBloc>());

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  final _maxPurchaseController = TextEditingController();
  final _keywordsController = TextEditingController();
  final _categoryController = TextEditingController();

  List<String> keywords = [];
  final Map<int, String?> _uploadedImageIds = {};

  CategoryEntity? _selectedCategory;
  List<CategoryEntity> _allCategories = [];

  @override
  void initState() {
    super.initState();
    bloc.add(const FetchCategoriesEvent());
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _maxPurchaseController.dispose();
    _keywordsController.dispose();
    _categoryController.dispose();
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

  void _showCategoryPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CategoryPickerSheet(
        categories: _allCategories,
        onSelected: (cat, path) {
          setState(() {
            _selectedCategory = cat;
            _categoryController.text = path;
          });
          context.pop();
        },
      ),
    );
  }

  @override
  Widget buildNinoWidget(
      BuildContext context, ErrorState errorState, AppBlocState appState) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      body: BlocConsumer<AddProductBloc, AddProductState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is AddProductSuccess) {
            CstmSnackBar.showSuccess(context, 'محصول با موفقیت اضافه شد');
            context.pop(true);
          } else if (state is AddProductError) {
            CstmSnackBar.showError(context, state.message);
          } else if (state is CategoriesLoaded) {
            _allCategories = state.categories;
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
                    _buildSectionTitle('تصاویر محصول'),
                    SizedBox(height: 12.h),
                    Wrap(
                      spacing: 12.w,
                      runSpacing: 12.h,
                      children: List.generate(5, (index) {
                        return ImageUploadSlot(
                          index: index,
                          imageType: 'product',
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
                      label: 'نام محصول',
                      hint: 'مثلا: روغن موتور بهران',
                      icon: Icons.title,
                      validator: (v) => v!.isEmpty ? 'نام محصول الزامی است' : null,
                    ),
                    SizedBox(height: 16.h),
                    _buildTextField(
                      controller: _descriptionController,
                      label: 'توضیحات',
                      hint: 'توضیحات محصول را اینجا بنویسید...',
                      icon: Icons.description,
                      maxLines: 3,
                      validator: (v) => v!.isEmpty ? 'توضیحات الزامی است' : null,
                    ),
                    SizedBox(height: 16.h),
                    _buildCategoryField(),
                    SizedBox(height: 24.h),
                    _buildSectionTitle('قیمت و موجودی'),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            controller: _priceController,
                            label: 'قیمت (تومان)',
                            hint: '0',
                            icon: Icons.attach_money,
                            keyboardType: TextInputType.number,
                            validator: (v) => v!.isEmpty ? 'قیمت الزامی است' : null,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildTextField(
                            controller: _stockController,
                            label: 'موجودی',
                            hint: '0',
                            icon: Icons.inventory,
                            keyboardType: TextInputType.number,
                            validator: (v) => v!.isEmpty ? 'موجودی الزامی است' : null,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    _buildTextField(
                      controller: _maxPurchaseController,
                      label: 'حداکثر تعداد خرید',
                      hint: 'مثلا: 10',
                      icon: Icons.shopping_cart,
                      keyboardType: TextInputType.number,
                      validator: (v) => v!.isEmpty ? 'این فیلد الزامی است' : null,
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
        color: DashboardColors.of(context).adminIndigo,
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
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
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
          prefixIcon: Icon(icon, color: DashboardColors.of(context).adminIndigo, size: 20.sp),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          labelStyle: TextStyle(fontSize: 14.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
          hintStyle: TextStyle(fontSize: 12.sp, color: Theme.of(context).colorScheme.outline),
        ),
      ),
    );
  }

  Widget _buildCategoryField() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextFormField(
        controller: _categoryController,
        readOnly: true,
        onTap: _showCategoryPicker,
        validator: (v) => _selectedCategory == null ? 'انتخاب دسته‌بندی الزامی است' : null,
        decoration: InputDecoration(
          labelText: 'دسته‌بندی',
          hintText: 'انتخاب دسته‌بندی',
          prefixIcon: Icon(Icons.category_rounded,
              color: DashboardColors.of(context).adminIndigo, size: 20.sp),
          suffixIcon: Icon(Icons.arrow_drop_down_rounded, color: Theme.of(context).colorScheme.outline),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          labelStyle: TextStyle(fontSize: 14.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
          hintStyle: TextStyle(fontSize: 12.sp, color: Theme.of(context).colorScheme.outline),
        ),
      ),
    );
  }

  Widget _buildKeywordField() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
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
          prefixIcon: Icon(Icons.tag, color: DashboardColors.of(context).adminIndigo, size: 20.sp),
          suffixIcon: IconButton(
            icon: Icon(Icons.add_circle, color: DashboardColors.of(context).adminIndigo),
            onPressed: () => _addKeyword(_keywordsController.text),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          hintStyle: TextStyle(fontSize: 12.sp, color: Theme.of(context).colorScheme.outline),
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(fontSize: 12.sp, color: Theme.of(context).colorScheme.surface),
      ),
      backgroundColor: DashboardColors.of(context).adminIndigo,
      deleteIcon: Icon(Icons.close, size: 14.sp, color: Theme.of(context).colorScheme.surface),
      onDeleted: () {
        setState(() {
          keywords.remove(label);
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
    );
  }

  Widget _buildSubmitButton(BuildContext context, AddProductState state) {
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: ElevatedButton(
        onPressed: state is AddProductLoading
            ? null
            : () {
                if (_formKey.currentState!.validate()) {
                  final images = _uploadedImageIds.values
                      .where((id) => id != null)
                      .cast<String>()
                      .toList();
                  bloc.add(AddProductSubmitEvent(
                    title: _titleController.text,
                    description: _descriptionController.text,
                    images: images,
                    keywords: keywords,
                    price: double.parse(_priceController.text),
                    stock: int.parse(_stockController.text),
                    maxPurchaseQuantity: int.parse(_maxPurchaseController.text),
                    categoryId: _selectedCategory?.id,
                  ));
                }
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: DashboardColors.of(context).adminIndigo,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          elevation: 0,
        ),
        child: state is AddProductLoading
            ? CircularProgressIndicator(color: Theme.of(context).colorScheme.surface)
            : Text(
                'ثبت محصول',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
      ),
    );
  }
}


