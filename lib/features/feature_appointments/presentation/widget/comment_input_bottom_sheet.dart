import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/resources/consts.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/widgets/app_bottom_sheet.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../base/base_appointments_stateful_widget_state.dart';
import '../bloc/appointments_bloc.dart';
import '../../../../core/themes/theme_main.dart';

class CommentInputBottomSheet extends StatefulWidget {
  final String shopName;
  final String repairmanId;
  final String? repairmanName;
  final String? repairmanImageId;
  final String? date;
  final String? time;

  const CommentInputBottomSheet({
    super.key,
    required this.shopName,
    required this.repairmanId,
    this.repairmanName,
    this.repairmanImageId,
    this.date,
    this.time,
  });

  static Future<bool?> show(
    BuildContext context, {
    required String shopName,
    required String repairmanId,
    String? repairmanName,
    String? repairmanImageId,
    String? date,
    String? time,
  }) {
    return AppBottomSheet.show<bool>(
      context,
      title: 'ثبت نظر و امتیاز',
      icon: Icons.rate_review_rounded,
      isScrollable: false,
      child: CommentInputBottomSheet(
        shopName: shopName,
        repairmanId: repairmanId,
        repairmanName: repairmanName,
        repairmanImageId: repairmanImageId,
        date: date,
        time: time,
      ),
    );
  }

  @override
  State<CommentInputBottomSheet> createState() => _CommentInputBottomSheetState();
}

class _CommentInputBottomSheetState extends BaseAppointmentsStatefulWidgetState<CommentInputBottomSheet, AppointmentsBloc> {
  _CommentInputBottomSheetState() : super(locator<AppointmentsBloc>());

  int _rating = 0;
  final TextEditingController _commentController = TextEditingController();
  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocListener<AppointmentsBloc, AppointmentsState>(
      listener: (context, state) {
        if (state is RatingSuccess || state is RatingError) {
          // Unfocus any active text field to prevent keyboard animation issues during pop

          if (state is RatingSuccess) {
            CstmSnackBar.showSuccess(context, state.message);
            Navigator.pop(context, true);
          } else if (state is RatingError) {
            CstmSnackBar.showError(context, state.message);
            Navigator.pop(context, false);
          }
        }
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Lottery Banner
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    StatusColors.of(context).warning,
                    StatusColors.of(context).warning.withValues(alpha: 0.7),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.card_giftcard_rounded, color: colorScheme.surface, size: 18.sp),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      'با انجام نظرسنجی در قرعه کشی جوایز اخر ماه شرکت کنین',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w900,
                        color: colorScheme.surface,
                        fontFamily: 'BonyadeKoodak',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // 2. Repairman Info Card
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 58.r,
                    height: 58.r,
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: widget.repairmanImageId != null
                          ? CachedNetworkImage(
                              imageUrl: '${Consts.baseFileUrl}${widget.repairmanImageId}',
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(color: colorScheme.outlineVariant.withValues(alpha: 0.1)),
                              errorWidget: (context, url, error) => _buildImagePlaceholder(colorScheme),
                            )
                          : _buildImagePlaceholder(colorScheme),
                    ),
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.repairmanName ?? widget.shopName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w900,
                            color: colorScheme.onSurface,
                            fontFamily: 'BonyadeKoodak',
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            _buildMiniInfo(context, Icons.calendar_month_rounded, widget.date ?? ''),
                            SizedBox(width: 12.w),
                            _buildMiniInfo(context, Icons.access_time_rounded, widget.time ?? ''),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // 3. Rating Section
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      final actualIndex = index + 1;
                      final isSelected = actualIndex <= _rating;
                      return GestureDetector(
                        onTap: () => setState(() => _rating = actualIndex),
                        child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Icon(
                          isSelected ? Icons.star_rounded : Icons.star_outline_rounded,
                          color: isSelected ? StatusColors.of(context).warning : theme.colorScheme.outlineVariant,
                          size: 46.sp,
                        ),
                      ),
                      );
                    }).toList().reversed.toList(),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    _getRatingLabel(_rating),
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: _rating == 0 ? colorScheme.onSurface.withValues(alpha: 0.5) : StatusColors.of(context).warning,
                      fontFamily: 'BonyadeKoodak',
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // 4. Comment Section
            TextField(
              controller: _commentController,
              maxLines: 4,
              style: TextStyle(fontSize: 14.sp, fontFamily: 'BonyadeKoodak'),
              decoration: InputDecoration(
                hintText: 'نظر خود را بنویسید...',
                hintStyle: TextStyle(fontSize: 12.sp, color: colorScheme.onSurface.withValues(alpha: 0.4), fontFamily: 'BonyadeKoodak'),
                filled: true,
                fillColor: colorScheme.surfaceContainerLow,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.all(16.r),
              ),
            ),

            SizedBox(height: 32.h),

            // Submit Button
            BlocBuilder<AppointmentsBloc, AppointmentsState>(
              builder: (context, state) {
                final bool isLoading = state is RatingSubmitting;
                return ElevatedButton(
                  onPressed: (_rating == 0 || isLoading)
                    ? null
                    : () {
                        FocusScope.of(context).unfocus();
                        bloc.add(SubmitRatingEvent(
                          repairmanId: widget.repairmanId,
                          score: _rating,
                          description: _commentController.text,
                        ));
                      },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    minimumSize: Size(double.infinity, 56.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
                    elevation: 0,
                    disabledBackgroundColor: colorScheme.outlineVariant.withValues(alpha: 0.5),
                  ),
                  child: isLoading
                    ? SizedBox(
                        height: 20.h,
                        width: 20.h,
                        child: CircularProgressIndicator(color: colorScheme.surface, strokeWidth: 2),
                      )
                    : Text(
                        'ثبت و ارسال نظر',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w900,
                          color: colorScheme.surface,
                          fontFamily: 'BonyadeKoodak',
                        ),
                      ),
                );
              },
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }

  String _getRatingLabel(int rating) {
    switch (rating) {
      case 1: return 'ضعیف';
      case 2: return 'متوسط';
      case 3: return 'خوب';
      case 4: return 'خیلی خوب';
      case 5: return 'عالی';
      default: return 'امتیاز دهید';
    }
  }

  Widget _buildMiniInfo(BuildContext context, IconData icon, String text) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(icon, size: 14.sp, color: colorScheme.primary.withValues(alpha: 0.6)),
        SizedBox(width: 4.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 11.sp, 
            color: colorScheme.onSurface.withValues(alpha: 0.7),
            fontFamily: 'BonyadeKoodak',
          ),
        ),
      ],
    );
  }

  Widget _buildImagePlaceholder(ColorScheme colorScheme) {
    return Container(
      width: 60.w,
      height: 60.w,
      color: colorScheme.primary.withValues(alpha: 0.1),
      child: Icon(Icons.person_rounded, color: colorScheme.primary, size: 30.sp),
    );
  }
}
