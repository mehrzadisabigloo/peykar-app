import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../../core/services/locator.dart';
import '../../../../../../core/widgets/cstm_snakbar.dart';
import '../../domain/entity/manage_reminder_types_entity.dart';
import '../base/base_manage_reminder_types_stateful_widget_state.dart';
import '../bloc/manage_reminder_types_bloc.dart';

class ScreenAddEditReminderType extends StatefulWidget {
  final ManageReminderTypeEntity? reminderType;
  const ScreenAddEditReminderType({super.key, this.reminderType});

  @override
  State<ScreenAddEditReminderType> createState() => _ScreenAddEditReminderTypeState();
}

class _ScreenAddEditReminderTypeState extends BaseManageReminderTypesStatefulWidgetState<ScreenAddEditReminderType, ManageReminderTypesBloc> {
  _ScreenAddEditReminderTypeState() : super(locator<ManageReminderTypesBloc>());

  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  bool get isEdit => widget.reminderType != null;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.reminderType?.title ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocConsumer<ManageReminderTypesBloc, ManageReminderTypesState>(
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
                  _buildSectionHeader('اطلاعات نوع یادآور', colorScheme),
                  SizedBox(height: 16.h),
                  _buildField(
                    controller: _titleController,
                    label: 'عنوان دسته‌بندی',
                    icon: Icons.title_rounded,
                    hint: 'مثلا: سرویس دوره‌ای',
                    colorScheme: colorScheme,
                    validator: (value) => value!.isEmpty ? 'عنوان الزامی است' : null,
                  ),
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
        color: colorScheme.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline_rounded, color: colorScheme.primary, size: 24.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              'نوع یادآور به عنوان دسته‌بندی اصلی (مثل روغن، لاستیک و ...) عمل می‌کند که زیرمجموعه‌های مختلفی در دل خود دارد.',
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

  Widget _buildSubmitButton(BuildContext context, ManageReminderTypesState state, ColorScheme colorScheme) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: state.isSubmitting
            ? null
            : () {
                if (_formKey.currentState!.validate()) {
                  if (isEdit) {
                    bloc.add(EditReminderTypeEvent(widget.reminderType!.id, _titleController.text));
                  } else {
                    bloc.add(AddReminderTypeEvent(_titleController.text));
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
                isEdit ? 'ذخیره تغییرات' : 'ثبت نوع یادآور',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, fontFamily: 'BonyadeKoodak'),
              ),
      ),
    );
  }
}
