import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/cstm_snakbar.dart';

class AddTimeSlotForm extends StatefulWidget {
  final bool isExpanded;
  final VoidCallback onToggleExpansion;
  final Function(String startTime, String endTime, int capacity) onAdd;
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;
  final TextEditingController capacityController;
  final int defaultCapacity;
  final VoidCallback onStartTimePick;
  final VoidCallback onEndTimePick;
  final bool isLoading;

  const AddTimeSlotForm({
    super.key,
    required this.isExpanded,
    required this.onToggleExpansion,
    required this.onAdd,
    required this.startTimeController,
    required this.endTimeController,
    required this.capacityController,
    required this.defaultCapacity,
    required this.onStartTimePick,
    required this.onEndTimePick,
    this.isLoading = false,
  });

  @override
  State<AddTimeSlotForm> createState() => _AddTimeSlotFormState();
}

class _AddTimeSlotFormState extends State<AddTimeSlotForm> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.08),
            blurRadius: 30,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: widget.onToggleExpansion,
            borderRadius: BorderRadius.circular(32.r),
            child: Padding(
              padding: EdgeInsets.all(24.r),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Icon(Icons.add_task_rounded, color: theme.colorScheme.primary, size: 22.sp),
                  ),
                  SizedBox(width: 14.w),
                  Text(
                    'تنظیم بازه جدید',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'BonyadeKoodak',
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const Spacer(),
                  AnimatedRotation(
                    turns: widget.isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 24.sp,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ClipRect(
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              heightFactor: widget.isExpanded ? 1.0 : 0.0,
              child: Padding(
                padding: EdgeInsets.fromLTRB(24.r, 0, 24.r, 24.r),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildTimeInput(
                            theme: theme,
                            title: 'از ساعت',
                            controller: widget.startTimeController,
                            onPick: widget.onStartTimePick,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildTimeInput(
                            theme: theme,
                            title: 'تا ساعت',
                            controller: widget.endTimeController,
                            onPick: widget.onEndTimePick,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    _buildCapacityInput(theme),
                    SizedBox(height: 28.h),
                    ElevatedButton(
                      onPressed: widget.isLoading ? null : () {
                        final startTime = widget.startTimeController.text.trim();
                        final endTime = widget.endTimeController.text.trim();

                        if (startTime.isEmpty || endTime.isEmpty) {
                          CstmSnackBar.showError(context, 'لطفا زمان شروع و پایان را انتخاب یا وارد کنید');
                          return;
                        }

                        final capacity = int.tryParse(widget.capacityController.text);
                        if (capacity == null || capacity <= 0) {
                          CstmSnackBar.showError(context, 'لطفا ظرفیت معتبر وارد کنید');
                          return;
                        }
                        
                        widget.onAdd(startTime, endTime, capacity);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                        minimumSize: Size(double.infinity, 56.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        elevation: 8,
                        shadowColor: theme.colorScheme.primary.withValues(alpha: 0.4),
                      ),
                      child: widget.isLoading
                          ? SizedBox(
                              height: 24.h,
                              width: 24.h,
                              child: CircularProgressIndicator(
                                color: theme.colorScheme.onPrimary,
                                strokeWidth: 2,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.check_circle_outline_rounded, size: 22.sp),
                                SizedBox(width: 12.w),
                                const Text(
                                  'ثبت بازه زمانی',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'BonyadeKoodak',
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeInput({
    required ThemeData theme,
    required String title,
    required TextEditingController controller,
    required VoidCallback onPick,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w, bottom: 8.h),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.54),
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          readOnly: true,
          onTap: onPick,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900, fontFamily: 'BonyadeKoodak'),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.access_time_filled_rounded, size: 20.sp, color: theme.colorScheme.primary),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surfaceContainer,
            hintText: '--:--',
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.outline, fontSize: 14.sp),
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
              borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.5),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
          ),
        ),
      ],
    );
  }

  Widget _buildCapacityInput(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.w, bottom: 8.h),
          child: Text(
            'ظرفیت (نفر)',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.54),
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        TextFormField(
          controller: widget.capacityController,
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900, fontFamily: 'BonyadeKoodak'),
          textAlign: TextAlign.center,
          onChanged: (v) => setState(() {}),
          decoration: InputDecoration(
            prefixIcon: _buildStepperIcon(
              icon: Icons.remove_rounded,
              onTap: () {
                final val = int.tryParse(widget.capacityController.text) ?? 1;
                if (val > 1) {
                  widget.capacityController.text = (val - 1).toString();
                  setState(() {});
                }
              },
              theme: theme,
            ),
            suffixIcon: _buildStepperIcon(
              icon: Icons.add_rounded,
              onTap: () {
                final val = int.tryParse(widget.capacityController.text) ?? 1;
                widget.capacityController.text = (val + 1).toString();
                setState(() {});
              },
              theme: theme,
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
              borderSide: BorderSide(color: theme.colorScheme.primary, width: 1.5),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
          ),
        ),
      ],
    );
  }

  Widget _buildStepperIcon({
    required IconData icon,
    required VoidCallback onTap,
    required ThemeData theme,
  }) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10.r),
          child: Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              icon,
              size: 20.sp,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
