import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../../core/services/locator.dart';
import '../../../../../core/widgets/category_picker_sheet.dart';
import '../../../../../core/widgets/cstm_snakbar.dart';
import '../../../../feature_manage_products/domain/entity/manage_products_entity.dart';
import '../../../../feature_manage_products/presentation/widget/image_upload_slot.dart';
import '../../../feature_manage_shop_products/domain/repository/manage_shop_products_repository.dart';
import '../../domain/entity/banner_entity.dart';
import '../../domain/repository/banner_repository.dart';
import '../widget/product_picker_sheet.dart';

class ScreenAddEditBanner extends StatefulWidget {
  final BannerEntity? banner;
  const ScreenAddEditBanner({super.key, this.banner});

  @override
  State<ScreenAddEditBanner> createState() => _ScreenAddEditBannerState();
}

class _ImageFieldState {
  String? imageId;
  String? type;
  String? targetId;
  String? targetTitle;
  String? categoryId;
  String? categoryTitle;

  _ImageFieldState({
    this.imageId,
    this.type,
    this.targetId,
    this.targetTitle,
    this.categoryId,
    this.categoryTitle,
  });

  void dispose() {
  }
}

class _ScreenAddEditBannerState extends State<ScreenAddEditBanner> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedPlace;
  final List<_ImageFieldState> _imageFields = [];
  bool _isLoading = false;

  List<CategoryEntity> _shopCategories = [];

  final List<Map<String, dynamic>> _places = [
    {'value': 'shop', 'label': 'فروشگاه', 'icon': Icons.storefront_rounded},
    {'value': 'service_provider', 'label': 'خدمات دهنده', 'icon': Icons.handyman_rounded},
    {'value': 'customer', 'label': 'مشتری', 'icon': Icons.person_rounded},
  ];

  @override
  void initState() {
    super.initState();
    _fetchRequiredData();
    if (widget.banner != null) {
      _selectedPlace = widget.banner!.place;
      widget.banner!.images?.forEach((key, value) {
        if (value is Map) {
          _imageFields.add(_ImageFieldState(
            type: key,
            imageId: value['image']?.toString(),
            targetId: value['id']?.toString(),
          ));
        } else {
          _imageFields.add(_ImageFieldState(
            type: key,
            imageId: value?.toString(),
          ));
        }
      });
    }
    if (_imageFields.isEmpty) {
      _addImageField();
    }
  }

  Future<void> _fetchRequiredData() async {
    final productRepo = locator<ManageShopProductsRepository>();
    final result = await productRepo.fetchCategories();

    setState(() {
      if (result is DataSuccess) {
        _shopCategories = result.data ?? [];
      }
    });
  }

  void _addImageField() {
    setState(() {
      _imageFields.add(_ImageFieldState());
    });
  }

  void _removeImageField(int index) {
    setState(() {
      _imageFields[index].dispose();
      _imageFields.removeAt(index);
    });
  }

  @override
  void dispose() {
    for (var field in _imageFields) {
      field.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate() || _selectedPlace == null) return;

    setState(() => _isLoading = true);
    final repo = locator<BannerRepository>();

    final Map<String, dynamic> images = {};
    for (var field in _imageFields) {
      if (field.type != null && field.imageId != null) {
        if (field.type == 'product') {
          images[field.type!] = {
            'id': field.targetId,
            'image': field.imageId,
          };
        } else {
          images[field.type!] = field.imageId;
        }
      }
    }

    final params = {
      'place': _selectedPlace,
      'images': images,
    };

    DataState<BannerEntity> result;
    if (widget.banner == null) {
      result = await repo.addBanner(params);
    } else {
      result = await repo.editBanner(widget.banner!.id!, params);
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
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoSection(colorScheme),
              SizedBox(height: 24.h),
              _buildSectionHeader('تنظیمات کلی'),
              _buildPlaceDropdown(colorScheme),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSectionHeader('تصاویر و پیکربندی'),
                  TextButton.icon(
                    onPressed: _addImageField,
                    icon: Icon(Icons.add_circle_outline, size: 20.sp),
                    label: Text('افزودن تصویر', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold)),
                    style: TextButton.styleFrom(
                      foregroundColor: colorScheme.primary,
                      backgroundColor: colorScheme.primary.withValues(alpha: 0.05),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              ...List.generate(_imageFields.length, (index) => _buildImageField(index, colorScheme)),
              SizedBox(height: 40.h),
              _buildSaveButton(colorScheme),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection(ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.1), width: 1),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.tips_and_updates_rounded, color: colorScheme.primary, size: 20.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              'اطلاعات بنر را برای نمایش در بخش‌های مختلف اپلیکیشن مدیریت کنید.',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton(ColorScheme colorScheme) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _save,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 4,
          shadowColor: colorScheme.primary.withValues(alpha: 0.4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
        ),
        child: _isLoading
            ? SizedBox(
                width: 24.sp,
                height: 24.sp,
                child: CircularProgressIndicator(color: colorScheme.onPrimary, strokeWidth: 2.5),
              )
            : Text(
                widget.banner == null ? 'ثبت بنر جدید' : 'ذخیره تغییرات',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900, letterSpacing: 0.5),
              ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Container(
            width: 4.w,
            height: 14.h,
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

  Widget _buildPlaceDropdown(ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.02),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: FormField<String>(
        initialValue: _selectedPlace,
        validator: (value) => _selectedPlace == null ? 'لطفا محل نمایش را انتخاب کنید' : null,
        builder: (FormFieldState<String> state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  return DropdownMenu<String>(
                    initialSelection: _selectedPlace,
                    width: constraints.maxWidth,
                    hintText: 'انتخاب محل نمایش بنر',
                    textStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87)),
                    menuStyle: MenuStyle(
                      backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.surface),
                      elevation: WidgetStateProperty.all(12),
                      shadowColor: WidgetStateProperty.all(colorScheme.primary.withValues(alpha: 0.2)),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                      ),
                    ),
                    inputDecorationTheme: InputDecorationTheme(
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    ),
                    trailingIcon: Icon(Icons.keyboard_arrow_down_rounded, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45)),
                    onSelected: (value) {
                      setState(() {
                        _selectedPlace = value;
                        state.didChange(value);
                      });
                    },
                    dropdownMenuEntries: _places.map((place) {
                      final isSelected = _selectedPlace == place['value'];
                      return DropdownMenuEntry<String>(
                        value: place['value'],
                        label: place['label']!,
                        leadingIcon: Icon(
                          place['icon'],
                          size: 20.sp,
                          color: isSelected ? colorScheme.primary : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
              if (state.hasError)
                Padding(
                  padding: EdgeInsets.only(top: 8.h, right: 16.w),
                  child: Text(
                    state.errorText!,
                    style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 11.sp, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildImageField(int index, ColorScheme colorScheme) {
    final field = _imageFields[index];
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.03),
              borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    'بنر شماره ${index + 1}',
                    style: TextStyle(fontSize: 11.sp, color: colorScheme.onPrimary, fontWeight: FontWeight.w900),
                  ),
                ),
                const Spacer(),
                if (_imageFields.length > 1)
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _removeImageField(index),
                      borderRadius: BorderRadius.circular(12.r),
                      child: Container(
                        padding: EdgeInsets.all(8.r),
                        child: Icon(Icons.delete_sweep_rounded, color: colorScheme.error, size: 22.sp),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSubLabel('تصویر بنر'),
                Container(
                  padding: EdgeInsets.all(4.r),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.03)),
                  ),
                  child: ImageUploadSlot(
                    index: index,
                    width: double.infinity,
                    height: 180.h,
                    fit: BoxFit.fill,
                    onUploadSuccess: (imageId) {
                      setState(() {
                        field.imageId = imageId;
                      });
                    },
                    imageType: 'banner',
                    initialImageId: field.imageId,
                  ),
                ),
                SizedBox(height: 24.h),
                _buildActivitySelector(index, colorScheme),
                if (field.type == 'product') ...[
                  SizedBox(height: 24.h),
                  _buildProductPicker(index, colorScheme),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivitySelector(int index, ColorScheme colorScheme) {
    final field = _imageFields[index];
    final List<Map<String, dynamic>> types = [
      {'value': 'info', 'label': 'اطلاعیه', 'icon': Icons.campaign_rounded, 'desc': 'نمایش پیام خبری'},
      {'value': 'product', 'label': 'محصول', 'icon': Icons.inventory_2_rounded, 'desc': 'لینک به محصول'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubLabel('نوع فعالیت بنر'),
        SizedBox(height: 8.h),
        Row(
          children: types.map((type) {
            final isSelected = field.type == type['value'];
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    field.type = type['value'];
                    field.targetId = null;
                    field.targetTitle = null;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    color: isSelected ? colorScheme.primary : Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(18.r),
                    border: Border.all(
                      color: isSelected ? colorScheme.primary : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
                      width: 1.5,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: colorScheme.primary.withValues(alpha: 0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            )
                          ]
                        : null,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        type['icon'],
                        color: isSelected ? colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45),
                        size: 24.sp,
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        type['label'],
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w900,
                          color: isSelected ? colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        if (field.type == null)
          Padding(
            padding: EdgeInsets.only(top: 8.h, right: 8.w),
            child: Text(
              'لطفا نوع فعالیت را انتخاب کنید',
              style: TextStyle(color: colorScheme.error, fontSize: 10.sp, fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }

  Widget _buildProductPicker(int index, ColorScheme colorScheme) {
    final field = _imageFields[index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubLabel('انتخاب محصول مقصد'),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => ProductPickerSheet(
                onSelected: (product) {
                  setState(() {
                    field.targetId = product.id;
                    field.targetTitle = product.title;
                  });
                  Navigator.pop(context);
                },
              ),
            );
          },
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: field.targetId != null ? colorScheme.primary : Colors.transparent,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.inventory_2_rounded, size: 20.sp, color: field.targetId != null ? colorScheme.primary : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45)),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    field.targetTitle ?? 'محصول را انتخاب کنید',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: field.targetId != null ? FontWeight.bold : FontWeight.normal,
                      color: field.targetId != null ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87) : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.38),
                    ),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded, size: 20.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryPicker(int index, ColorScheme colorScheme) {
    final field = _imageFields[index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubLabel('دسته بندی مرتبط'),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => CategoryPickerSheet(
                categories: _shopCategories,
                onSelected: (cat, path) {
                  setState(() {
                    field.categoryId = cat.id;
                    field.categoryTitle = path;
                  });
                  Navigator.pop(context);
                },
              ),
            );
          },
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: field.categoryId != null ? colorScheme.primary : Colors.transparent,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.category_rounded, size: 20.sp, color: field.categoryId != null ? colorScheme.primary : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45)),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    field.categoryTitle ?? 'انتخاب دسته بندی',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: field.categoryId != null ? FontWeight.bold : FontWeight.normal,
                      color: field.categoryId != null ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87) : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.38),
                    ),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded, size: 20.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(right: 4.w, bottom: 8.h),
      child: Text(
        label,
        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w800, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.54)),
      ),
    );
  }

  InputDecoration _getInputDecoration({required String hint, IconData? icon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(fontSize: 12.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.38)),
      prefixIcon: icon != null ? Icon(icon, size: 18.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45)) : null,
      filled: true,
      fillColor: Theme.of(context).colorScheme.surfaceContainer,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubLabel(label),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87)),
          decoration: _getInputDecoration(hint: hint, icon: icon),
        ),
      ],
    );
  }
}

