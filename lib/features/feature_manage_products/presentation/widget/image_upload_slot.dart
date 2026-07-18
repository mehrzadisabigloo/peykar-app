import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/services/locator.dart';
import '../../../feature_upload_file/presentation/bloc/upload_file_bloc.dart';
import '../base/base_manage_products_stateful_widget_state.dart';

class ImageUploadSlot extends StatefulWidget {
  final int index;
  final Function(String? imageId) onUploadSuccess;
  final String? initialImageId;
  final String imageType;

  const ImageUploadSlot({
    super.key,
    required this.index,
    required this.onUploadSuccess,
    required this.imageType,
    this.initialImageId,
  });

  @override
  State<ImageUploadSlot> createState() => _ImageUploadSlotState();
}

class _ImageUploadSlotState extends BaseManageProductsStatefulWidgetState<ImageUploadSlot, UploadFileBloc> {
  _ImageUploadSlotState() : super(locator<UploadFileBloc>());

  final ImagePicker _picker = ImagePicker();
  File? _selectedFile;
  String? _uploadedImageId;
  double _uploadProgress = 0;

  @override
  void initState() {
    super.initState();
    _uploadedImageId = widget.initialImageId;
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedFile = File(image.path);
        _uploadProgress = 0;
      });
      bloc.add(FetchUploadFile(
        image.path,
        widget.imageType,
        widget.index,
        0,
        (sent, total) {
          setState(() {
            _uploadProgress = sent / total;
          });
          // bloc.add(UpdateUploadProgress(sent / total, widget.index, 0));
        },
      ));
    }
  }

  void _removeImage() {
    setState(() {
      _selectedFile = null;
      _uploadedImageId = null;
      _uploadProgress = 0;
    });
    widget.onUploadSuccess(null);
  }

  @override
  Widget buildNinoWidget(BuildContext context, dynamic errorState, dynamic appState) {
    return BlocListener<UploadFileBloc, UploadFileState>(
      bloc: bloc,
      listenWhen: (previous, current) {
        if (current is UploadFileProgress) return current.index == widget.index;
        if (current is UploadFileLoading) return current.index == widget.index;
        if (current is UploadFileLoaded) return current.index == widget.index;
        if (current is UploadFileFailed) return current.index == widget.index;
        return false;
      },
      listener: (context, state) {
        if (state is UploadFileProgress) {
          setState(() {
            _uploadProgress = state.progress;
          });
        } else if (state is UploadFileLoaded) {
          setState(() {
            _uploadedImageId = state.uploadFileEntity?.id;
          });
          widget.onUploadSuccess(_uploadedImageId);
        } else if (state is UploadFileFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error ?? 'آپلود ناموفق بود'), backgroundColor: Colors.red),
          );
          setState(() {
            _selectedFile = null;
          });
        }
      },
      child: InkWell(
        onTap: _uploadedImageId == null && _selectedFile == null ? _pickImage : null,
        child: Container(
          width: 100.w,
          height: 100.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: _uploadedImageId != null ? const Color(0xFF3F51B5) : Colors.grey[300]!,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (_uploadedImageId != null || _selectedFile != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: _selectedFile != null
                      ? Image.file(_selectedFile!, fit: BoxFit.cover, width: double.infinity, height: double.infinity)
                      : Container(
                          color: const Color(0xFF3F51B5).withValues(alpha: 0.1),
                          child: const Icon(Icons.check_circle, color: Color(0xFF3F51B5)),
                        ),
                ),
                if (_uploadedImageId == null && _selectedFile != null)
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Background Track
                                SizedBox(
                                  width: 48.r,
                                  height: 48.r,
                                  child: CircularProgressIndicator(
                                    value: 1.0,
                                    color: Colors.white.withValues(alpha: 0.1),
                                    strokeWidth: 2,
                                  ),
                                ),
                                // Progress Indicator
                                SizedBox(
                                  width: 48.r,
                                  height: 48.r,
                                  child: CircularProgressIndicator(
                                    value: _uploadProgress,
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                                Text(
                                  '${(_uploadProgress * 100).toInt()}%',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  top: 5.h,
                  right: 5.w,
                  child: GestureDetector(
                    onTap: _removeImage,
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                      child: Icon(Icons.close, size: 14.sp, color: Colors.white),
                    ),
                  ),
                ),
              ] else
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_photo_alternate, color: Colors.grey[400], size: 32.sp),
                    SizedBox(height: 4.h),
                    Text(
                      'انتخاب',
                      style: TextStyle(fontSize: 10.sp, color: Colors.grey[400]),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
