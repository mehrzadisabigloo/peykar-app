import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resturant_app/features/feature_upload_file/presentation/bloc/upload_file_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:resturant_app/core/bloc/app/app_bloc.dart';
import 'package:resturant_app/core/bloc/error/error_bloc.dart';
import 'package:resturant_app/core/services/locator.dart';
import 'package:resturant_app/core/widgets/cstm_snakbar.dart';
import 'package:resturant_app/core/utils/jalali_date.dart';
import '../../../../core/themes/theme_main.dart';
// import 'package:resturant_app/core/resources/consts.dart';
import 'package:resturant_app/features/feature_reminders/presentation/widget/persian_calendar_view.dart';
import 'package:resturant_app/core/services/shop_settings_holder.dart';
import '../../../../core/resources/consts.dart';
import '../../../../core/utils/extensions.dart';
import '../../../feature_home/presentation/bloc/main_home_page_bloc.dart';
import '../base/base_profile_stateful_widget_state.dart';
import '../bloc/profile_bloc.dart';
import '../../domain/entity/profile_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/profile_shimmer.dart';

class ScreenProfile extends StatefulWidget {
  const ScreenProfile({super.key});

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends BaseProfileStatefulWidgetState<ScreenProfile, ProfileBloc> {
  _ScreenProfileState() : super(locator<ProfileBloc>());

  late UploadFileBloc _uploadBloc;
  bool _isEditing = false;
  ProfileEntity? _currentProfile;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _birthdayController;

  bool _showDatePicker = false;
  String? _pickedImagePath;
  String? _newProfileImageId;

  @override
  void initState() {
    super.initState();
    _uploadBloc = locator<UploadFileBloc>();
    bloc.add(FetchProfileDataEvent());
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _birthdayController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  void _setupControllers(ProfileEntity profile) {
    _firstNameController.text = profile.firstName;
    _lastNameController.text = profile.lastName;
    _emailController.text = profile.email ?? '';
    _birthdayController.text = _formatBirthday(profile.birthday);
  }

  String _formatBirthday(String? birthday) {
    if (birthday == null || birthday.isEmpty) return '';
    
    // Handle ISO format (YYYY-MM-DD or YYYY-MM-DDT...)
    String datePart = birthday.contains('T') ? birthday.split('T')[0] : birthday;
    
    // Replace hyphens with slashes if present
    datePart = datePart.replaceAll('-', '/');
    
    final parts = datePart.split('/');
    if (parts.length == 3) {
      final y = parts[0];
      final m = parts[1].padLeft(2, '0');
      final d = parts[2].padLeft(2, '0');
      return '$y/$m/$d';
    }
    
    return datePart;
  }

  // void _showUpdateDialog(ProfileEntity profile) {
  //   final firstNameController = TextEditingController(text: profile.firstName);
  //   final lastNameController = TextEditingController(text: profile.lastName);
  //   final emailController = TextEditingController(text: profile.email);
  //   final birthdayController = TextEditingController(text: _formatBirthday(profile.birthday));
  //
  //   showDialog(
  //     context: context,
  //     builder: (context) => BlocConsumer<ProfileBloc, ProfileState>(
  //       bloc: bloc,
  //       listener: (context, state) {
  //         if (state is ProfileUpdateSuccess) {
  //           Navigator.pop(context);
  //         }
  //       },
  //       builder: (context, state) {
  //         return AlertDialog(
  //           backgroundColor: Theme.of(context).colorScheme.surface,
  //           surfaceTintColor: Theme.of(context).colorScheme.surface,
  //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
  //           title: Text(
  //             'ویرایش پروفایل',
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //               fontSize: 18.sp,
  //               fontWeight: FontWeight.bold,
  //               fontFamily: 'BonyadeKoodak',
  //             ),
  //           ),
  //           content: SingleChildScrollView(
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 _buildDialogTextField(firstNameController, 'نام', Icons.person_outline),
  //                 SizedBox(height: 16.h),
  //                 _buildDialogTextField(lastNameController, 'نام خانوادگی', Icons.person_outline),
  //                 SizedBox(height: 16.h),
  //                 _buildDialogTextField(emailController, 'ایمیل', Icons.email_outlined),
  //                 SizedBox(height: 16.h),
  //                 _buildDialogTextField(birthdayController, 'تاریخ تولد', Icons.calendar_today_outlined),
  //               ],
  //             ),
  //           ),
  //           actions: [
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: OutlinedButton(
  //                     onPressed: state is ProfileLoading ? null : () => Navigator.pop(context),
  //                     style: OutlinedButton.styleFrom(
  //                       minimumSize: Size(0, 45.h),
  //                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
  //                     ),
  //                     child: const Text('انصراف'),
  //                   ),
  //                 ),
  //                 SizedBox(width: 12.w),
  //                 Expanded(
  //                   child: ElevatedButton(
  //                     onPressed: state is ProfileLoading
  //                         ? null
  //                         : () {
  //                             final updatedProfile = ProfileEntity(
  //                               id: profile.id,
  //                               firstName: firstNameController.text,
  //                               lastName: lastNameController.text,
  //                               mobile: profile.mobile,
  //                               email: emailController.text,
  //                               role: profile.role,
  //                               birthday: birthdayController.text,
  //                               profileImageId: profile.profileImageId,
  //                               subscriptionCode: profile.subscriptionCode,
  //                               status: profile.status,
  //                             );
  //                             bloc.add(UpdateProfileDataEvent(updatedProfile));
  //                           },
  //                     style: ElevatedButton.styleFrom(
  //                       minimumSize: Size(0, 45.h),
  //                       backgroundColor: Theme.of(context).colorScheme.primary,
  //                       foregroundColor: Theme.of(context).colorScheme.onPrimary,
  //                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
  //                     ),
  //                     child: state is ProfileLoading
  //                         ? SizedBox(
  //                             height: 20.r,
  //                             width: 20.r,
  //                             child: CircularProgressIndicator(
  //                               strokeWidth: 2,
  //                               color: Theme.of(context).colorScheme.onPrimary,
  //                             ),
  //                           )
  //                         : const Text('ذخیره'),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //           actionsPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
  //         );
  //       },
  //     ),
  //   );
  // }

  Jalali? _parseJalali(String jalaliStr) {
    try {
      final parts = jalaliStr.split('/');
      if (parts.length == 3) {
        return Jalali(int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
      }
    } catch (_) {}
    return null;
  }

  Widget _buildDialogTextField(TextEditingController controller, String label, IconData icon, {bool readOnly = false, VoidCallback? onTap}) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      style: TextStyle(fontSize: 14.sp),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20.sp, color: Theme.of(context).colorScheme.primary),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 70);

    if (pickedFile != null) {
      setState(() {
        _pickedImagePath = pickedFile.path;
      });

      _uploadBloc.add(FetchUploadFile(
        pickedFile.path,
        'profile_image',
        0,
        0,
        (sent, total) {
          // Progress can be handled if needed
        },
      ));
    }
  }

  void _removeImage() {
    setState(() {
      _pickedImagePath = null;
      _newProfileImageId = '';
    });
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileBloc, ProfileState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is ProfileLoaded) {
              context.read<MainHomePageBloc>().add(UpdateProfile(state.profile));
            }
            if (state is ProfileUpdateSuccess) {
              setState(() {
                _isEditing = false;
                _pickedImagePath = null;
                _newProfileImageId = null;
              });
              bloc.add(FetchProfileDataEvent());
              CstmSnackBar.showSuccess(context, state.message);
            }
            if (state is ProfileError) {
              CstmSnackBar.showError(context, state.message);
            }
          },
        ),
        BlocListener<UploadFileBloc, UploadFileState>(
          bloc: _uploadBloc,
          listener: (context, state) {
            if (state is UploadFileLoaded) {
              _newProfileImageId = state.uploadFileEntity?.id;
              CstmSnackBar.showSuccess(context, 'تصویر با موفقیت آپلود شد');
            }
            if (state is UploadFileFailed) {
              CstmSnackBar.showError(context, state.error ?? 'خطا در آپلود تصویر');
              setState(() {
                _pickedImagePath = null;
              });
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: BlocBuilder<ProfileBloc, ProfileState>(
            bloc: bloc,
            builder: (context, profileState) {
              return BlocBuilder<UploadFileBloc, UploadFileState>(
                bloc: _uploadBloc,
                builder: (context, uploadState) {
                  if (profileState is ProfileLoaded) {
                    _currentProfile = profileState.profile;
                  }

                  if (profileState is ProfileLoading && _currentProfile == null) {
                    return const ProfileShimmer();
                  }

                  final profile = _currentProfile;

                  if (profile != null) {
                    if (!_isEditing && _firstNameController.text.isEmpty) {
                      _setupControllers(profile);
                    }
                    return SafeArea(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h),
                            Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topCenter,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 60.r),
                                  child: _isEditing ? _buildEditForm(profile, profileState, uploadState) : _buildGlassInfoCard(profile),
                                ),
                                Positioned(
                                  top: 0,
                                  child: _buildAvatar(profile, uploadState),
                                ),
                              ],
                            ),
                            if (!_isEditing) ...[
                              SizedBox(height: 20.h),
                              _buildMenuItems(profile),
                            ],
                            SizedBox(height: 100.h),
                          ],
                        ),
                      ),
                    );
                  }

                  if (profileState is ProfileError) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: Container(
                          padding: EdgeInsets.all(24.r),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(24.r),
                            border: Border.all(color: Theme.of(context).colorScheme.error.withValues(alpha: 0.1)),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.all(16.r),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.error.withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.error_outline_rounded,
                                  size: 48.sp,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                'خطایی رخ داده است',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                profileState.message,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                                ),
                              ),
                              SizedBox(height: 24.h),
                              ElevatedButton(
                                onPressed: () => bloc.add(FetchProfileDataEvent()),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).colorScheme.primary,
                                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                                  minimumSize: Size(double.infinity, 48.h),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                                ),
                                child: const Text('تلاش مجدد'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(ProfileEntity profile, UploadFileState uploadState) {
    final isUploading = uploadState is UploadFileLoading;

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: _isEditing ? 160.r : 130.r,
            height: _isEditing ? 160.r : 130.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.surface,
              border: Border.all(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: _isEditing && !isUploading ? _pickImage : null,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: _isEditing ? 150.r : 120.r,
              height: _isEditing ? 150.r : 120.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                image: _pickedImagePath != null
                    ? DecorationImage(
                        image: FileImage(File(_pickedImagePath!)),
                        fit: BoxFit.cover,
                      )
                    : (profile.profileImageId != null && profile.profileImageId!.isNotEmpty && _newProfileImageId != ''
                        ? DecorationImage(
                            image: CachedNetworkImageProvider('${Consts.baseFileUrl}${profile.profileImageId}'),
                            fit: BoxFit.cover,
                          )
                        : null),
              ),
              child: (_pickedImagePath == null && (profile.profileImageId == null || profile.profileImageId!.isEmpty))
                  ? Icon(
                      Icons.person_outline_rounded,
                      size: _isEditing ? 80.r : 60.r,
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
                    )
                  : (isUploading
                      ? Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.26),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        )
                      : null),
            ),
          ),
          if (!_isEditing)
            Positioned(
              bottom: 5.r,
              right: 5.r,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isEditing = true;
                    _setupControllers(profile);
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).colorScheme.surface, width: 2),
                  ),
                  child: Icon(
                    Icons.edit_outlined,
                    size: 16.sp,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            )
          else if (!isUploading) ...[
            Positioned(
              bottom: 5.r,
              right: 5.r,
              child: GestureDetector(
                onTap: _pickImage,
                child: Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).colorScheme.surface, width: 2),
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 20.sp,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            if (_pickedImagePath != null || (profile.profileImageId != null && profile.profileImageId!.isNotEmpty && _newProfileImageId != ''))
              Positioned(
                bottom: 5.r,
                left: 5.r,
                child: GestureDetector(
                  onTap: _removeImage,
                  child: Container(
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      shape: BoxShape.circle,
                      border: Border.all(color: Theme.of(context).colorScheme.surface, width: 2),
                    ),
                    child: Icon(
                      Icons.delete_outline_rounded,
                      size: 20.sp,
                      color: Theme.of(context).colorScheme.onError,
                    ),
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildEditForm(ProfileEntity profile, ProfileState profileState, UploadFileState uploadState) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1), width: 1.5),
        ),
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            SizedBox(height: 100.r),
            _buildDialogTextField(_firstNameController, 'نام', Icons.person_outline),
            SizedBox(height: 16.h),
            _buildDialogTextField(_lastNameController, 'نام خانوادگی', Icons.person_outline),
            SizedBox(height: 16.h),
            _buildDialogTextField(_emailController, 'ایمیل', Icons.email_outlined),
            SizedBox(height: 16.h),
            _buildDialogTextField(
              _birthdayController,
              'تاریخ تولد',
              Icons.calendar_today_outlined,
              readOnly: true,
              onTap: () {
                setState(() {
                  _showDatePicker = !_showDatePicker;
                });
              },
            ),
            if (_showDatePicker) ...[
              SizedBox(height: 10.h),
              PersianCalendarView(
                initialDate: _parseJalali(_birthdayController.text) ?? Jalali.fromDateTime(DateTime.now()),
                onDateSelected: (jalali) {
                  setState(() {
                    _birthdayController.text = '${jalali.year}/${jalali.month.toString().padLeft(2, '0')}/${jalali.day.toString().padLeft(2, '0')}';
                    _showDatePicker = false;
                  });
                },
              ),
            ],
            SizedBox(height: 32.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _isEditing = false;
                        _pickedImagePath = null;
                        _newProfileImageId = null;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(0, 45.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                    ),
                    child: const Text('انصراف'),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (profileState is ProfileLoading || uploadState is UploadFileLoading)
                        ? null
                        : () {
                            final updatedProfile = ProfileEntity(
                              id: profile.id,
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              mobile: profile.mobile,
                              email: _emailController.text,
                              role: profile.role,
                              birthday: _birthdayController.text,
                              profileImageId: _newProfileImageId ?? profile.profileImageId,
                              subscriptionCode: profile.subscriptionCode,
                              status: profile.status,
                            );
                            bloc.add(UpdateProfileDataEvent(updatedProfile));
                          },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(0, 45.h),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                    ),
                    child: profileState is ProfileLoading
                        ? SizedBox(
                            height: 20.r,
                            width: 20.r,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Theme.of(context).colorScheme.onPrimary,
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

  String _getPersianRole(String role) {
    switch (role.toLowerCase()) {
      case 'admin':
        return 'مدیر سیستم';
      case 'repairman':
        return 'تعمیرکار';
      case 'customer':
      case 'user':
        return 'مشتری';
      default:
        return role;
    }
  }

  Widget _buildGlassInfoCard(ProfileEntity profile) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1), width: 1.5),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            SizedBox(height: 60.r, width: double.infinity),
            Padding(
              padding: EdgeInsets.all(20.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.fullName,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        profile.mobile,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.workspace_premium, color: StatusColors.of(context).warning, size: 16.sp),
                        SizedBox(width: 4.w),
                        Text(
                          _getPersianRole(profile.role),
                          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 12.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatItem(profile.ordersCount.toString().toPersianDigit, 'سفارش‌ها'),
                  _buildStatItem(profile.servicesCount.toString().toPersianDigit, 'خدمات'),
                  _buildStatItem(profile.productsCount.toString().toPersianDigit, 'محصولات'),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            _buildCTASection(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Container(
      width: 90.w,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 12.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6)),
          ),
        ],
      ),
    );
  }

  Widget _buildCTASection() {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.all(16.r),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [theme.colorScheme.primary.withValues(alpha: 0.8), theme.colorScheme.primary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(color: theme.colorScheme.surface.withValues(alpha: 0.24), shape: BoxShape.circle),
            child: Icon(Icons.history_rounded, color: theme.colorScheme.surface, size: 20.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'تاریخچه سفارشات',
                  style: TextStyle(color: theme.colorScheme.surface, fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
                Text(
                  'سفارشات خود را مشاهده کنید.',
                  style: TextStyle(color: theme.colorScheme.surface.withValues(alpha: 0.7), fontSize: 12.sp),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to maintenance tracking or orders
              context.pushNamed('orders');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.surface,
              foregroundColor: theme.colorScheme.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              minimumSize: Size(0, 36.h),
            ),
            child: const Text('مشاهده'),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems(ProfileEntity profile) {
    final settingsHolder = locator<ShopSettingsHolder>();
    final isAdminShopActive = settingsHolder.isAdminShopActive;
    final isRepairShopActive = settingsHolder.isRepairShopActive;

    final role = profile.role.toLowerCase();
    bool showCart = true;
    bool showWholesale = false;

    if (role == 'repairman') {
      showCart = isAdminShopActive;
    } else if (role == 'admin') {
      // For Admin, show cart if wholesale is active (assuming admin manages wholesale)
      // and show wholesale link if either is active
      showCart = isAdminShopActive;
      if (isAdminShopActive || isRepairShopActive) {
        showWholesale = true;
      }
    } else {
      // For Users/Customers
      showCart = isRepairShopActive;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1), width: 1.5),
        ),
        child: Column(
          children: [
            if (showCart) _buildMenuItem(Icons.shopping_basket_outlined, 'سبد خرید', onTap: () => context.pushNamed('shop_basket')),
            // if (showWholesale) _buildMenuItem(Icons.shopping_cart_rounded, 'خرید عمده', onTap: () => context.pushNamed('shop')),
            _buildMenuItem(Icons.image_outlined, 'تصاویر من'),
            _buildMenuItem(Icons.star_outline, 'اشتراک و اعتبار'),
            _buildMenuItem(Icons.bar_chart_outlined, 'آمار'),
            _buildMenuItem(Icons.settings_outlined, 'تنظیمات', isLast: true,),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {bool isLast = false, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Row(
              children: [
                Icon(icon, size: 24.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8)),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8)),
                  ),
                ),
                Icon(Icons.chevron_left, size: 24.sp, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5)),
              ],
            ),
          ),
          if (!isLast)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Divider(height: 1, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05)),
            ),
        ],
      ),
    );
  }
}
