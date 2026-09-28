import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../../core/services/locator.dart';
import '../../../../../../core/widgets/cstm_snakbar.dart';
import '../../domain/entity/manage_reminder_sub_item_entity.dart';
import '../base/base_manage_reminder_sub_items_stateful_widget_state.dart';
import '../bloc/manage_reminder_sub_items_bloc.dart';

class ScreenAddEditReminderSubItem extends StatefulWidget {
  final String? reminderTypeId;
  final ManageReminderSubItemEntity? subItem;

  const ScreenAddEditReminderSubItem({
    super.key,
    this.reminderTypeId,
    this.subItem,
  });

  @override
  State<ScreenAddEditReminderSubItem> createState() => _ScreenAddEditReminderSubItemState();
}

class _ScreenAddEditReminderSubItemState extends BaseManageReminderSubItemsStatefulWidgetState<ScreenAddEditReminderSubItem, ManageReminderSubItemsBloc> {
  _ScreenAddEditReminderSubItemState() : super(locator<ManageReminderSubItemsBloc>());

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  bool get isEdit => widget.subItem != null;

  final List<TextEditingController> _bulkControllers = [TextEditingController()];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.subItem?.title ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    for (var controller in _bulkControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addBulkField() {
    setState(() {
      _bulkControllers.add(TextEditingController());
    });
  }

  void _removeBulkField(int index) {
    if (_bulkControllers.length > 1) {
      setState(() {
        _bulkControllers[index].dispose();
        _bulkControllers.removeAt(index);
      });
    }
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocConsumer<ManageReminderSubItemsBloc, ManageReminderSubItemsState>(
        listener: (context, state) {
          if (state.submissionSuccess) {
            context.pop(true);
          }
          if (state.errorMessage != null) {
            CstmSnackBar.showError(context, state.errorMessage!);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(colorScheme),
                  SizedBox(height: 32.h),
                  _buildSectionHeader('اطلاعات زیرمجموعه', colorScheme),
                  SizedBox(height: 16.h),
                  if (isEdit)
                    _buildField(
                      controller: _titleController,
                      label: 'عنوان زیرمجموعه',
                      hint: 'مثلا: فیلتر روغن',
                      icon: Icons.title_rounded,
                      colorScheme: colorScheme,
                      validator: (value) => value!.isEmpty ? 'عنوان الزامی است' : null,
                    )
                  else
                    ...List.generate(_bulkControllers.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: _buildField(
                                controller: _bulkControllers[index],
                                label: 'عنوان ${index + 1}',
                                hint: 'مثلا: فیلتر هوا',
                                icon: Icons.title_rounded,
                                colorScheme: colorScheme,
                                validator: (value) => value!.isEmpty ? 'عنوان الزامی است' : null,
                              ),
                            ),
                            if (_bulkControllers.length > 1)
                              Padding(
                                padding: EdgeInsets.only(bottom: 4.h, right: 8.w),
                                child: IconButton(
                                  onPressed: () => _removeBulkField(index),
                                  icon: Icon(Icons.remove_circle_outline_rounded, color: colorScheme.error),
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
                  if (!isEdit) ...[
                    SizedBox(height: 12.h),
                    TextButton.icon(
                      onPressed: _addBulkField,
                      icon: const Icon(Icons.add_circle_outline_rounded),
                      label: const Text('افزودن مورد دیگر', style: TextStyle(fontFamily: 'BonyadeKoodak')),
                      style: TextButton.styleFrom(
                        foregroundColor: colorScheme.primary,
                        textStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, fontFamily: 'BonyadeKoodak'),
                      ),
                    ),
                  ],
                  SizedBox(height: 48.h),
                  _buildSubmitButton(context, state, colorScheme),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colorScheme.secondary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Icon(Icons.subdirectory_arrow_left_rounded, color: colorScheme.secondary, size: 24.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              'زیرمجموعه‌ها اقلامی هستند که در یک یادآور باید چک یا تعویض شوند (مثل فیلتر روغن در یادآور سرویس دوره‌ای).',
              style: TextStyle(
                fontSize: 12.sp,
                color: colorScheme.secondary,
                height: 1.5,
                fontFamily: 'BonyadeKoodak',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, ColorScheme colorScheme) {
    return Row(
      children: [
        Container(
          width: 4.w,
          height: 16.h,
          decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp, 
            fontWeight: FontWeight.w900, 
            color: colorScheme.onSurface,
            fontFamily: 'BonyadeKoodak',
          ),
        ),
      ],
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required ColorScheme colorScheme,
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
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87), fontFamily: 'BonyadeKoodak'),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, size: 20.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45)),
            hintText: hint,
            hintStyle: TextStyle(fontSize: 14.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.26), fontFamily: 'BonyadeKoodak'),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surfaceContainer,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
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

  Widget _buildSubmitButton(BuildContext context, ManageReminderSubItemsState state, ColorScheme colorScheme) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: state.isSubmitting
            ? null
            : () {
                if (_formKey.currentState!.validate()) {
                  if (isEdit) {
                    bloc.add(EditSubItemEvent(widget.subItem!.id, _titleController.text));
                  } else {
                    final titles = _bulkControllers
                        .map((e) => e.text.trim())
                        .where((e) => e.isNotEmpty)
                        .toList();
                    if (titles.isEmpty) {
                      CstmSnackBar.showError(context, 'حداقل یک عنوان وارد کنید');
                      return;
                    }
                    if (titles.length == 1) {
                      bloc.add(AddSubItemEvent(widget.reminderTypeId!, titles.first));
                    } else {
                      bloc.add(AddSubItemsBulkEvent(widget.reminderTypeId!, titles));
                    }
                  }
                }
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          elevation: 8,
          shadowColor: colorScheme.primary.withValues(alpha: 0.3),
        ),
        child: state.isSubmitting
            ? SizedBox(
                width: 24.sp, 
                height: 24.sp, 
                child: CircularProgressIndicator(color: colorScheme.onPrimary, strokeWidth: 2.5),
              )
            : Text(
                isEdit ? 'ذخیره تغییرات' : 'ثبت زیرمجموعه',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, fontFamily: 'BonyadeKoodak'),
              ),
      ),
    );
  }
}
