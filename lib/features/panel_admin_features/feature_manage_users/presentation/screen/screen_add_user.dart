import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../../core/bloc/error/error_bloc.dart';
import '../../../../../../core/services/locator.dart';
import '../../../../../../core/widgets/cstm_snakbar.dart';
import '../../../../feature_home/domain/entity/user_role.dart';
import '../../../../feature_manage_products/presentation/widget/image_upload_slot.dart';
import '../base/base_manage_users_stateful_widget_state.dart';
import '../bloc/manage_users_bloc.dart';

class ScreenAddUser extends StatefulWidget {
  const ScreenAddUser({super.key});

  @override
  State<ScreenAddUser> createState() => _ScreenAddUserState();
}

class _ScreenAddUserState extends BaseManageUsersStatefulWidgetState<ScreenAddUser, ManageUsersBloc> {
  _ScreenAddUserState() : super(locator<ManageUsersBloc>());

  final _formKey = GlobalKey<FormState>();
  final _mobileController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  
  UserRole _selectedRole = UserRole.user;
  String? _profileImageId;

  @override
  void dispose() {
    _mobileController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (!_formKey.currentState!.validate()) return;
    
    final userData = {
      'mobile': _mobileController.text,
      'first_name': _firstNameController.text,
      'last_name': _lastNameController.text,
      'role': [_selectedRole.value],
      'profile_image_id': _profileImageId,
    };

    bloc.add(AddUserEvent(userData));
  }

  @override
  Widget buildManageUsersWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocConsumer<ManageUsersBloc, ManageUsersState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is ManageUsersLoaded) {
            if (state.successMessage != null) {
              CstmSnackBar.showSuccess(context, state.successMessage!);
              context.pop(true);
            } else if (state.errorMessage != null) {
              CstmSnackBar.showError(context, state.errorMessage!);
            }
          } else if (state is ManageUsersFailed) {
            CstmSnackBar.showError(context, state.message);
          }
        },
        builder: (context, state) {
          final isLoading = state.isActionLoading;

          return SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                            'لطفا مشخصات کاربر را برای ثبت در سیستم وارد نمایید.',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: colorScheme.primary,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Center(
                    child: Column(
                      children: [
                        ImageUploadSlot(
                          index: 0,
                          imageType: 'profile_image',
                          onUploadSuccess: (id) => setState(() => _profileImageId = id),
                        ),
                        SizedBox(height: 8.h),
                        Text('تصویر پروفایل', style: TextStyle(fontSize: 12.sp, color: Theme.of(context).colorScheme.outline)),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),
                  _buildField(
                    controller: _firstNameController,
                    label: 'نام',
                    icon: Icons.person_outline,
                    validator: (v) => v!.isEmpty ? 'وارد کردن نام الزامی است' : null,
                  ),
                  SizedBox(height: 16.h),
                  _buildField(
                    controller: _lastNameController,
                    label: 'نام خانوادگی',
                    icon: Icons.person_outline,
                    validator: (v) => v!.isEmpty ? 'وارد کردن نام خانوادگی الزامی است' : null,
                  ),
                  SizedBox(height: 16.h),
                  _buildField(
                    controller: _mobileController,
                    label: 'شماره موبایل',
                    icon: Icons.phone_android_outlined,
                    keyboardType: TextInputType.phone,
                    validator: (v) => v!.isEmpty ? 'وارد کردن شماره موبایل الزامی است' : null,
                  ),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.only(right: 4.w, bottom: 8.h),
                    child: Text(
                      'نقش کاربری',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.54),
                      ),
                    ),
                  ),
                  _buildRoleSelector(),
                  SizedBox(height: 48.h),
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _onSave,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.surface,
                        elevation: 8,
                        shadowColor: colorScheme.primary.withValues(alpha: 0.3),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                      ),
                      child: isLoading
                          ? SizedBox(
                              width: 24.sp,
                              height: 24.sp,
                              child: CircularProgressIndicator(
                                color: colorScheme.surface,
                                strokeWidth: 2.5,
                              ),
                            )
                          : Text(
                              'ثبت کاربر',
                              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
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
          keyboardType: keyboardType,
          validator: validator,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, size: 20.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45)),
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
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          ),
        ),
      ],
    );
  }

  Widget _buildRoleSelector() {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: UserRole.values.map((role) {
        final isSelected = _selectedRole == role;
        return GestureDetector(
          onTap: () => setState(() => _selectedRole = role),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isSelected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Text(
              role.label,
              style: TextStyle(
                color: isSelected ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.87),
                fontSize: 13.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
