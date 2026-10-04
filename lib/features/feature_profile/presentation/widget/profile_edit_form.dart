import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/jalali_date.dart';
import '../../../feature_reminders/presentation/widget/persian_calendar_view.dart';
import '../../domain/entity/profile_entity.dart';

class ProfileEditForm extends StatelessWidget {
  final ProfileEntity profile;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController birthdayController;
  final bool showDatePicker;
  final bool isLoading;
  final VoidCallback onToggleDatePicker;
  final Function(Jalali) onDateSelected;
  final VoidCallback onCancel;
  final VoidCallback onSave;

  const ProfileEditForm({
    super.key,
    required this.profile,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.birthdayController,
    required this.showDatePicker,
    required this.isLoading,
    required this.onToggleDatePicker,
    required this.onDateSelected,
    required this.onCancel,
    required this.onSave,
  });

  Jalali? _parseJalali(String jalaliStr) {
    try {
      final parts = jalaliStr.split('/');
      if (parts.length == 3) {
        return Jalali(
            int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
      }
    } catch (_) {}
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
            width: 1.5,
          ),
        ),
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            SizedBox(height: 100.r),
            _buildTextField(
                context, firstNameController, 'نام', Icons.person_outline),
            SizedBox(height: 16.h),
            _buildTextField(context, lastNameController, 'نام خانوادگی',
                Icons.person_outline),
            SizedBox(height: 16.h),
            _buildTextField(
                context, emailController, 'ایمیل', Icons.email_outlined),
            SizedBox(height: 16.h),
            _buildTextField(
              context,
              birthdayController,
              'تاریخ تولد',
              Icons.calendar_today_outlined,
              readOnly: true,
              onTap: onToggleDatePicker,
            ),
            if (showDatePicker) ...[
              SizedBox(height: 10.h),
              PersianCalendarView(
                initialDate: _parseJalali(birthdayController.text) ??
                    Jalali.fromDateTime(DateTime.now()),
                onDateSelected: onDateSelected,
              ),
            ],
            SizedBox(height: 32.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onCancel,
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(0, 45.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: const Text('انصراف'),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: isLoading ? null : onSave,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(0, 45.h),
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: isLoading
                        ? SizedBox(
                            height: 20.r,
                            width: 20.r,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: theme.colorScheme.onPrimary,
                            ),
                          )
                        : const Text('ذخیره'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context,
    TextEditingController controller,
    String label,
    IconData icon, {
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      style: TextStyle(fontSize: 14.sp),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon,
            size: 20.sp, color: Theme.of(context).colorScheme.primary),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
    );
  }
}
