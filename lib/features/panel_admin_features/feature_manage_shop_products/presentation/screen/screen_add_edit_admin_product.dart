import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../core/services/locator.dart';
import '../../../../../core/widgets/cstm_snakbar.dart';
import '../../../../../core/widgets/category_picker_sheet.dart';
import '../../../../feature_manage_products/domain/entity/manage_products_entity.dart';
import '../../../../feature_manage_products/presentation/widget/image_upload_slot.dart';
import '../../domain/entity/admin_product_entity.dart';
import '../base/base_manage_shop_products_stateful_widget_state.dart';
import '../bloc/manage_shop_products_bloc.dart';
import '../bloc/manage_shop_products_event.dart';
import '../bloc/manage_shop_products_state.dart';

class ScreenAddEditAdminProduct extends StatefulWidget {
  final AdminProductEntity? product;
  const ScreenAddEditAdminProduct({super.key, this.product});

  @override
  State<ScreenAddEditAdminProduct> createState() => _ScreenAddEditAdminProductState();
}

class _ScreenAddEditAdminProductState extends BaseManageShopProductsStatefulWidgetState<ScreenAddEditAdminProduct, ManageShopProductsBloc> {
  _ScreenAddEditAdminProductState() : super(locator<ManageShopProductsBloc>());

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  final _minPurchaseController = TextEditingController();
  final _maxPurchaseController = TextEditingController();
  final _keywordsController = TextEditingController();

  List<String> keywords = [];
  final Map<int, String?> _uploadedImageIds = {};
  String? _selectedCategoryId;
  String? _selectedCategoryTitle;
  List<CategoryEntity> _categories = [];
  bool get isEdit => widget.product != null;

  @override
  void initState() {
    super.initState();
    bloc.add(const FetchAdminProductCategories());
    if (isEdit) {
      _titleController.text = widget.product!.title;
      _descriptionController.text = widget.product!.description;
      _priceController.text = widget.product!.price.toInt().toString();
      _stockController.text = widget.product!.stock.toString();
      _minPurchaseController.text = widget.product!.minPurchaseQuantity.toString();
      _maxPurchaseController.text = widget.product!.maxPurchaseQuantity.toString();
      keywords = List.from(widget.product!.keywords);
      _selectedCategoryId = (widget.product!.categoryId?.isNotEmpty == true) ? widget.product!.categoryId : null;
      _selectedCategoryTitle = widget.product!.category?.title;
      
      for (int i = 0; i < widget.product!.images.length; i++) {
        _uploadedImageIds[i] = widget.product!.images[i];
      }
    } else {
      _minPurchaseController.text = '1';
      _maxPurchaseController.text = '0';
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _minPurchaseController.dispose();
    _maxPurchaseController.dispose();
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocListener<ManageShopProductsBloc, ManageShopProductsState>(
        listener: (context, state) {
          if (state is AdminProductActionSuccess) {
            CstmSnackBar.showSuccess(context, state.message);
            context.pop(true);
          }
          if (state is ManageShopProductsError) {
            CstmSnackBar.showError(context, state.message);
          }
          if (state is AdminProductCategoriesLoaded) {
            setState(() {
              _categories = state.categories;
            });
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline_rounded, color: Theme.of(context).colorScheme.primary, size: 24.sp),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            'لطفا مشخصات محصول را برای ثبت در سیستم وارد نمایید.',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Theme.of(context).colorScheme.primary,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),
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
                    hint: 'مثلا: فیلتر روغن پراید',
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
                  _buildCategoryPicker(),
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
                          label: 'موجودی کل',
                          hint: '0',
                          icon: Icons.inventory,
                          keyboardType: TextInputType.number,
                          validator: (v) => v!.isEmpty ? 'موجودی الزامی است' : null,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(
                          controller: _minPurchaseController,
                          label: 'حداقل تعداد خرید',
                          hint: '1',
                          icon: Icons.remove_circle_outline,
                          keyboardType: TextInputType.number,
                          validator: (v) => v!.isEmpty ? 'الزامی است' : null,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: _buildTextField(
                          controller: _maxPurchaseController,
                          label: 'حداکثر تعداد خرید',
                          hint: '0 برای نامحدود',
                          icon: Icons.add_circle_outline,
                          keyboardType: TextInputType.number,
                          validator: (v) => v!.isEmpty ? 'الزامی است' : null,
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
                  _buildSubmitButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
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
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryPicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w, bottom: 8.h),
          child: Text(
            'دسته‌بندی',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.54),
            ),
          ),
        ),
        GestureDetector(
          onTap: _showCategoryPicker,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: [
                Icon(Icons.category_rounded, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45), size: 20.sp),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    _selectedCategoryTitle ?? 'انتخاب دسته‌بندی',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: _selectedCategoryTitle != null ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87) : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45),
                    ),
                  ),
                ),
                Icon(Icons.arrow_drop_down_rounded, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showCategoryPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CategoryPickerSheet(
        categories: _categories,
        onSelected: (cat, path) {
          setState(() {
            _selectedCategoryId = cat.id;
            _selectedCategoryTitle = path;
          });
          Navigator.pop(context);
        },
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
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, size: 20.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45)),
            hintText: hint,
            hintStyle: TextStyle(fontSize: 14.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.26)),
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
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: maxLines > 1 ? 12.h : 16.h),
          ),
        ),
      ],
    );
  }

  Widget _buildKeywordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w, bottom: 8.h),
          child: Text(
            'کلمات کلیدی',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.54),
            ),
          ),
        ),
        TextFormField(
          controller: _keywordsController,
          onFieldSubmitted: _addKeyword,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: 'کلمه کلیدی را تایپ کرده و اضافه کنید',
            hintStyle: TextStyle(fontSize: 14.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.26)),
            prefixIcon: Icon(Icons.tag_rounded, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45), size: 20.sp),
            suffixIcon: IconButton(
              icon: Icon(Icons.add_circle_rounded, color: Theme.of(context).colorScheme.primary),
              onPressed: () => _addKeyword(_keywordsController.text),
            ),
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
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          ),
        ),
      ],
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(fontSize: 12.sp, color: Theme.of(context).colorScheme.surface),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      deleteIcon: Icon(Icons.close, size: 14.sp, color: Theme.of(context).colorScheme.surface),
      onDeleted: () {
        setState(() {
          keywords.remove(label);
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return BlocBuilder<ManageShopProductsBloc, ManageShopProductsState>(
      builder: (context, state) {
        final isLoading = state is AdminProductActionLoading;
        return SizedBox(
          width: double.infinity,
          height: 55.h,
          child: ElevatedButton(
            onPressed: isLoading
                ? null
                : () {
                    if (_validateForm()) {
                      final images = _uploadedImageIds.values.where((id) => id != null).cast<String>().toList();
                      final product = AdminProductEntity(
                        id: widget.product?.id,
                        title: _titleController.text,
                        description: _descriptionController.text,
                        images: images,
                        keywords: keywords,
                        price: double.parse(_priceController.text),
                        stock: int.parse(_stockController.text),
                        minPurchaseQuantity: int.parse(_minPurchaseController.text),
                        maxPurchaseQuantity: int.parse(_maxPurchaseController.text),
                        categoryId: _selectedCategoryId,
                      );

                      if (isEdit) {
                        bloc.add(EditAdminProduct(widget.product!.id!, product));
                      } else {
                        bloc.add(AddAdminProduct(product));
                      }
                    }
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.surface,
              elevation: 8,
              shadowColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
            ),
            child: isLoading
                ? SizedBox(
                    width: 24.sp,
                    height: 24.sp,
                    child: CircularProgressIndicator(color: Theme.of(context).colorScheme.surface, strokeWidth: 2.5),
                  )
                : Text(
                    isEdit ? 'بروزرسانی محصول' : 'ثبت محصول',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
          ),
        );
      },
    );
  }

  bool _validateForm() {
    if (!_formKey.currentState!.validate()) return false;
    if (_selectedCategoryId == null) {
      CstmSnackBar.showError(context, 'لطفاً دسته‌بندی محصول را انتخاب کنید');
      return false;
    }
    return true;
  }
}
