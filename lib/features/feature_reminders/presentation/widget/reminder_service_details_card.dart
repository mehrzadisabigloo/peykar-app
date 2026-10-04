import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/reminder_type_entity.dart';

class ReminderServiceDetailsCard extends StatelessWidget {
  final Color activeColor;
  final List<ReminderTypeEntity> reminderTypes;
  final String? selectedServiceTypeId;
  final List<String> selectedSubServiceIds;
  final ValueChanged<String?> onServiceTypeChanged;
  final Function(String subServiceId) onSubServiceToggled;
  final bool isLoading;
  final VoidCallback? onRetry;
  final int dropdownResetKey;

  const ReminderServiceDetailsCard({
    super.key,
    required this.activeColor,
    required this.reminderTypes,
    required this.selectedServiceTypeId,
    required this.selectedSubServiceIds,
    required this.onServiceTypeChanged,
    required this.onSubServiceToggled,
    this.isLoading = false,
    this.onRetry,
    required this.dropdownResetKey,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final selectedType = reminderTypes.firstWhere(
      (e) => e.id == selectedServiceTypeId,
      orElse: () => ReminderTypeEntity(id: '', title: '', subItems: []),
    );
    final selectedTitle = selectedType.id.isNotEmpty ? selectedType.title : null;

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildDropdownField(
            theme,
            'نوع یادآور',
            selectedTitle,
            reminderTypes.map((e) => e.title).toList(),
            (val) {
              if (val != null) {
                final type = reminderTypes.firstWhere((e) => e.title == val);
                onServiceTypeChanged(type.id);
              }
            },
            icon: Icons.settings_suggest_outlined,
            hint: 'انتخاب کنید...',
          ),
          if (selectedServiceTypeId != null) ...[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Divider(color: activeColor.withValues(alpha: 0.1), thickness: 1),
            ),
            _buildMultiSelectSubServices(theme, selectedType),
          ],
        ],
      ),
    );
  }

  Widget _buildDropdownField(
    ThemeData theme,
    String label,
    String? value,
    List<String> options,
    Function(String?) onChanged, {
    IconData? icon,
    String? hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: Text(
            label,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12.sp,
              color: theme.colorScheme.onSurfaceVariant,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        SizedBox(height: 8.h),
        LayoutBuilder(
          builder: (context, constraints) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: DropdownMenu<String>(
                key: ValueKey(dropdownResetKey),
                initialSelection: value,
                width: constraints.maxWidth,
                menuHeight: 300.h,
                enableSearch: false,
                hintText: hint,
                trailingIcon: isLoading
                    ? SizedBox(
                        width: 20.r,
                        height: 20.r,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: activeColor,
                        ),
                      )
                    : (options.isEmpty && onRetry != null)
                        ? IconButton(
                            onPressed: onRetry,
                            icon: Icon(
                              Icons.refresh_rounded,
                              color: theme.colorScheme.error,
                              size: 20.sp,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          )
                        : Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: activeColor,
                            size: 24.sp,
                          ),
                selectedTrailingIcon: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: activeColor,
                  size: 24.sp,
                ),
                leadingIcon: icon != null
                    ? Icon(
                        icon,
                        color: activeColor.withValues(alpha: 0.6),
                        size: 20.sp,
                      )
                    : null,
                textStyle: TextStyle(
                  fontSize: 14.sp,
                  color: theme.colorScheme.onSurface,
                  fontFamily: 'BonyadeKoodak',
                ),
                menuStyle: MenuStyle(
                  backgroundColor:
                      WidgetStateProperty.all(theme.colorScheme.surface),
                  surfaceTintColor:
                      WidgetStateProperty.all(theme.colorScheme.surface),
                  elevation: WidgetStateProperty.all(15),
                  shadowColor: WidgetStateProperty.all(
                    theme.colorScheme.onSurface.withValues(alpha: 0.2),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: theme.colorScheme.surfaceContainerHighest,
                  hoverColor: Colors.transparent,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(
                      color: activeColor.withValues(alpha: 0.3),
                      width: 1.5,
                    ),
                  ),
                ),
                dropdownMenuEntries: options.map((String option) {
                  final bool isSelected = option == value;
                  return DropdownMenuEntry<String>(
                    value: option,
                    label: option,
                    style: MenuItemButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      backgroundColor: isSelected
                          ? activeColor.withValues(alpha: 0.05)
                          : Colors.transparent,
                      foregroundColor:
                          isSelected ? activeColor : theme.colorScheme.onSurface,
                    ),
                    labelWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          option,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'BonyadeKoodak',
                            fontWeight:
                                isSelected ? FontWeight.bold : FontWeight.normal,
                            color: isSelected
                                ? activeColor
                                : theme.colorScheme.onSurface,
                          ),
                        ),
                        if (isSelected)
                          Icon(
                            Icons.check_circle_rounded,
                            color: activeColor,
                            size: 18.sp,
                          ),
                      ],
                    ),
                  );
                }).toList(),
                onSelected: onChanged,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildMultiSelectSubServices(
      ThemeData theme, ReminderTypeEntity selectedType) {
    final subServices = selectedType.subItems;
    if (subServices.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: Text(
            'زیر مجموعه ها',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12.sp,
              color: theme.colorScheme.onSurfaceVariant,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            children: subServices.map((sub) {
              final isSelected = selectedSubServiceIds.contains(sub.id);
              return InkWell(
                onTap: () => onSubServiceToggled(sub.id),
                borderRadius: BorderRadius.circular(12.r),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        sub.title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: isSelected
                              ? activeColor
                              : theme.colorScheme.onSurface,
                          fontFamily: 'BonyadeKoodak',
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.all(2.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected ? activeColor : Colors.transparent,
                          border: Border.all(
                            color: isSelected
                                ? activeColor
                                : theme.colorScheme.outline.withValues(alpha: 0.5),
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.check,
                          size: 14.sp,
                          color: isSelected
                              ? theme.colorScheme.onPrimary
                              : Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
