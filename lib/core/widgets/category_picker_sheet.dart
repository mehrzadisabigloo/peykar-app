import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resturant_app/features/feature_manage_products/domain/entity/manage_products_entity.dart';

class CategoryPickerSheet extends StatefulWidget {
  final List<CategoryEntity> categories;
  final Function(CategoryEntity, String) onSelected;

  const CategoryPickerSheet({
    super.key,
    required this.categories,
    required this.onSelected,
  });

  @override
  State<CategoryPickerSheet> createState() => _CategoryPickerSheetState();
}

class _CategoryPickerSheetState extends State<CategoryPickerSheet> {
  late List<CategoryEntity> _currentList;
  final List<List<CategoryEntity>> _navigationStack = [];
  final List<String> _titleStack = [];

  @override
  void initState() {
    super.initState();
    _currentList = List.from(widget.categories)
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  }

  void _onCategoryTap(CategoryEntity category) {
    if (category.children.isNotEmpty) {
      setState(() {
        _navigationStack.add(_currentList);
        _titleStack.add(category.name);
        _currentList = List.from(category.children)
          ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
      });
    } else {
      widget.onSelected(category, category.name);
    }
  }

  void _goBack() {
    if (_navigationStack.isNotEmpty) {
      setState(() {
        _currentList = _navigationStack.removeLast();
        _titleStack.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final String displayTitle =
        _titleStack.isEmpty ? 'انتخاب دسته‌بندی' : _titleStack.last;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 12.h),
          Container(
            width: 50.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
            child: Row(
              children: [
                // Back Button or Spacer
                if (_navigationStack.isNotEmpty)
                  IconButton(
                    onPressed: _goBack,
                    icon: Icon(Icons.arrow_back_ios_new,
                        size: 20.sp, color: colorScheme.onSurface),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  )
                else
                  SizedBox(width: 24.sp),

                // Title and Subtitle
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        displayTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      if (_titleStack.isEmpty)
                        Text(
                          'لطفاً دسته‌بندی مورد نظر خود را انتخاب کنید',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                    ],
                  ),
                ),

                // Close Button
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close_rounded,
                      size: 24.sp, color: colorScheme.onSurfaceVariant),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          const Divider(thickness: 1, height: 1),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              itemCount: _currentList.length,
              itemBuilder: (context, index) {
                final category = _currentList[index];
                final bool hasChildren = category.children.isNotEmpty;

                return Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _onCategoryTap(category),
                      borderRadius: BorderRadius.circular(16.r),
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: colorScheme.outlineVariant),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 48.w,
                              height: 48.w,
                              decoration: BoxDecoration(
                                color: colorScheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: category.cover != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(12.r),
                                      child: Image.network(
                                        category.cover!,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Icon(Icons.category_outlined,
                                                    color:
                                                        colorScheme.onSurfaceVariant,
                                                    size: 24.sp),
                                      ),
                                    )
                                  : Icon(Icons.category_outlined,
                                      color: colorScheme.onSurfaceVariant,
                                      size: 24.sp),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    category.name,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      color: colorScheme.onSurface,
                                    ),
                                  ),
                                  if (category.description != null &&
                                      category.description!.isNotEmpty)
                                    Text(
                                      category.description!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            if (hasChildren)
                              Icon(Icons.chevron_right,
                                  color: colorScheme.onSurfaceVariant, size: 20.sp),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

}
