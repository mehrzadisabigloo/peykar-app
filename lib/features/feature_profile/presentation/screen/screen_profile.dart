import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../feature_home/presentation/bloc/main_home_page_bloc.dart';
import '../../../feature_upload_file/presentation/bloc/upload_file_bloc.dart';
import '../../domain/entity/profile_entity.dart';
import '../base/base_profile_stateful_widget_state.dart';
import '../bloc/profile_bloc.dart';
import '../widget/profile_avatar.dart';
import '../widget/profile_edit_form.dart';
import '../widget/profile_error_widget.dart';
import '../widget/profile_info_card.dart';
import '../widget/profile_menu_items.dart';
import '../widget/profile_shimmer.dart';

class ScreenProfile extends StatefulWidget {
  const ScreenProfile({super.key});

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState
    extends BaseProfileStatefulWidgetState<ScreenProfile, ProfileBloc> {
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
    String datePart =
        birthday.contains('T') ? birthday.split('T')[0] : birthday;
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

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 70);

    if (pickedFile != null) {
      setState(() {
        _pickedImagePath = pickedFile.path;
      });

      _uploadBloc.add(FetchUploadFile(
        pickedFile.path,
        'profile_image',
        0,
        0,
        (sent, total) {},
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
  Widget buildNinoWidget(
      BuildContext context, ErrorState errorState, AppBlocState appState) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileBloc, ProfileState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is ProfileLoaded) {
              context
                  .read<MainHomePageBloc>()
                  .add(UpdateProfile(state.profile));
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
              CstmSnackBar.showError(
                  context, state.error ?? 'خطا در آپلود تصویر');
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

                  if (profileState is ProfileLoading &&
                      _currentProfile == null) {
                    return const ProfileShimmer();
                  }

                  final profile = _currentProfile;

                  if (profile != null) {
                    if (!_isEditing && _firstNameController.text.isEmpty) {
                      _setupControllers(profile);
                    }
                    final isUploading = uploadState is UploadFileLoading;

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
                                  child: _isEditing
                                      ? ProfileEditForm(
                                          profile: profile,
                                          firstNameController:
                                              _firstNameController,
                                          lastNameController:
                                              _lastNameController,
                                          emailController: _emailController,
                                          birthdayController:
                                              _birthdayController,
                                          showDatePicker: _showDatePicker,
                                          isLoading: profileState
                                                  is ProfileLoading ||
                                              isUploading,
                                          onToggleDatePicker: () {
                                            setState(() {
                                              _showDatePicker =
                                                  !_showDatePicker;
                                            });
                                          },
                                          onDateSelected: (jalali) {
                                            setState(() {
                                              _birthdayController.text =
                                                  '${jalali.year}/${jalali.month.toString().padLeft(2, '0')}/${jalali.day.toString().padLeft(2, '0')}';
                                              _showDatePicker = false;
                                            });
                                          },
                                          onCancel: () {
                                            setState(() {
                                              _isEditing = false;
                                              _pickedImagePath = null;
                                              _newProfileImageId = null;
                                            });
                                          },
                                          onSave: () {
                                            final updatedProfile =
                                                ProfileEntity(
                                              id: profile.id,
                                              firstName:
                                                  _firstNameController.text,
                                              lastName:
                                                  _lastNameController.text,
                                              mobile: profile.mobile,
                                              email: _emailController.text,
                                              role: profile.role,
                                              birthday:
                                                  _birthdayController.text,
                                              profileImageId:
                                                  _newProfileImageId ??
                                                      profile.profileImageId,
                                              subscriptionCode:
                                                  profile.subscriptionCode,
                                              status: profile.status,
                                            );
                                            bloc.add(UpdateProfileDataEvent(
                                                updatedProfile));
                                          },
                                        )
                                      : ProfileInfoCard(profile: profile),
                                ),
                                Positioned(
                                  top: 0,
                                  child: ProfileAvatar(
                                    profile: profile,
                                    isEditing: _isEditing,
                                    isUploading: isUploading,
                                    pickedImagePath: _pickedImagePath,
                                    newProfileImageId: _newProfileImageId,
                                    onPickImage: _pickImage,
                                    onRemoveImage: _removeImage,
                                    onEnableEdit: () {
                                      setState(() {
                                        _isEditing = true;
                                        _setupControllers(profile);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            if (!_isEditing) ...[
                              SizedBox(height: 20.h),
                              ProfileMenuItems(profile: profile),
                            ],
                            SizedBox(height: 100.h),
                          ],
                        ),
                      ),
                    );
                  }

                  if (profileState is ProfileError) {
                    return ProfileErrorWidget(
                      message: profileState.message,
                      onRetry: () => bloc.add(FetchProfileDataEvent()),
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
}
