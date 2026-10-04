import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/consts.dart';
import '../../domain/entity/profile_entity.dart';

class ProfileAvatar extends StatelessWidget {
  final ProfileEntity profile;
  final bool isEditing;
  final bool isUploading;
  final String? pickedImagePath;
  final String? newProfileImageId;
  final VoidCallback onPickImage;
  final VoidCallback onRemoveImage;
  final VoidCallback onEnableEdit;

  const ProfileAvatar({
    super.key,
    required this.profile,
    required this.isEditing,
    required this.isUploading,
    required this.pickedImagePath,
    required this.newProfileImageId,
    required this.onPickImage,
    required this.onRemoveImage,
    required this.onEnableEdit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: isEditing ? 160.r : 130.r,
            height: isEditing ? 160.r : 130.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colorScheme.surface,
              border: Border.all(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: isEditing && !isUploading ? onPickImage : null,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: isEditing ? 150.r : 120.r,
              height: isEditing ? 150.r : 120.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.surfaceContainerHighest,
                image: pickedImagePath != null
                    ? DecorationImage(
                        image: FileImage(File(pickedImagePath!)),
                        fit: BoxFit.cover,
                      )
                    : (profile.profileImageId != null &&
                            profile.profileImageId!.isNotEmpty &&
                            newProfileImageId != ''
                        ? DecorationImage(
                            image: CachedNetworkImageProvider(
                              '${Consts.baseFileUrl}${profile.profileImageId}',
                            ),
                            fit: BoxFit.cover,
                          )
                        : null),
              ),
              child: (pickedImagePath == null &&
                      (profile.profileImageId == null ||
                          profile.profileImageId!.isEmpty))
                  ? Icon(
                      Icons.person_outline_rounded,
                      size: isEditing ? 80.r : 60.r,
                      color:
                          theme.colorScheme.onSurface.withValues(alpha: 0.3),
                    )
                  : (isUploading
                      ? Container(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.onSurface
                                .withValues(alpha: 0.26),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        )
                      : null),
            ),
          ),
          if (!isEditing)
            Positioned(
              bottom: 5.r,
              right: 5.r,
              child: GestureDetector(
                onTap: onEnableEdit,
                child: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: theme.colorScheme.surface, width: 2),
                  ),
                  child: Icon(
                    Icons.edit_outlined,
                    size: 16.sp,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            )
          else if (!isUploading) ...[
            Positioned(
              bottom: 5.r,
              right: 5.r,
              child: GestureDetector(
                onTap: onPickImage,
                child: Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: theme.colorScheme.surface, width: 2),
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 20.sp,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            if (pickedImagePath != null ||
                (profile.profileImageId != null &&
                    profile.profileImageId!.isNotEmpty &&
                    newProfileImageId != ''))
              Positioned(
                bottom: 5.r,
                left: 5.r,
                child: GestureDetector(
                  onTap: onRemoveImage,
                  child: Container(
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.error,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: theme.colorScheme.surface, width: 2),
                    ),
                    child: Icon(
                      Icons.delete_outline_rounded,
                      size: 20.sp,
                      color: theme.colorScheme.onError,
                    ),
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
