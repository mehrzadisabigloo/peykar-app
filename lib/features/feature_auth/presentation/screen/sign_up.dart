import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/presentation/screen/map_picker_screen.dart';
import '../../../../core/widgets/cstm_snakbar.dart';
import '../../../../core/themes/theme_main.dart';
import '../../../panel_admin_features/feature_occupation/domain/entity/occupation_entity.dart';
import '../../../feature_manage_products/presentation/widget/image_upload_slot.dart';
import '../base/base_auth_stateful_widget_state.dart';
import '../bloc/authentication_bloc.dart';

class SignUpPage extends StatefulWidget {
  final String mobile;
  const SignUpPage({super.key, required this.mobile});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends BaseAuthStatefulWidgetState<SignUpPage, AuthenticationBloc> with SingleTickerProviderStateMixin {
  _SignUpPageState() : super(locator<AuthenticationBloc>());

  late TabController _tabController;
  bool _isLoading = false;
  LatLng? _selectedLocation;
  String? _selectedOccupationId;
  String? _selectedOccupationTitle;

  // Image Upload State
  final List<String> _identityImageIds = [];
  final List<String> _shopImageIds = [];

  // User Form Controllers
  final _mobileController = TextEditingController();
  final _userFirstNameController = TextEditingController();
  final _userLastNameController = TextEditingController();
  final _userReferralController = TextEditingController();

  // Repairman Form Controllers
  final _repFirstNameController = TextEditingController();
  final _repLastNameController = TextEditingController();
  final _repBrandController = TextEditingController();
  final _repAddressController = TextEditingController();
  final _repReferralController = TextEditingController();
  final List<TextEditingController> _repPhoneControllers = [TextEditingController()];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        FocusScope.of(context).unfocus();
      }
    });
    _mobileController.text = widget.mobile;
    bloc.add(const FetchOccupations());
  }

  @override
  void dispose() {
    _tabController.dispose();
    _mobileController.dispose();
    _userFirstNameController.dispose();
    _userLastNameController.dispose();
    _userReferralController.dispose();
    _repFirstNameController.dispose();
    _repLastNameController.dispose();
    _repBrandController.dispose();
    _repAddressController.dispose();
    _repReferralController.dispose();
    for (var controller in _repPhoneControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  void ninoBlocListener(BuildContext context, AppBlocState appState) {}

  void blocListener(BuildContext context, AuthenticationState state) {
    if (state is Loading) {
      setState(() => _isLoading = true);
    } else if (state is Failed) {
      setState(() => _isLoading = false);
      CstmSnackBar.showError(context, state.message);
    } else if (state is AuthSuccess) {
      setState(() => _isLoading = false);
      CstmSnackBar.showSuccess(context, 'شماره موردنظر با موفقیت ثبت شد');
      context.go('/');
    }
  }

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return _buildBody(context, errorState, appState);
  }

  Widget _buildBody(BuildContext context, ErrorState errorState, AppBlocState appState) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        title: Text('تکمیل ثبت‌نام', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface)),
        centerTitle: true,
      ),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: blocListener,
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: theme.colorScheme.primary,
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.primary.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  labelColor: theme.colorScheme.surface,
                  unselectedLabelColor: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                  labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, fontFamily: 'BonyadeKoodak'),
                  unselectedLabelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal, fontFamily: 'BonyadeKoodak'),
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(text: 'به خدمات نیاز دارم'),
                    Tab(text: 'خدمات ارائه می‌دهم'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildUserForm(),
                  _buildRepairmanForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserForm() {
    final colorScheme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.w),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: colorScheme.primary.withValues(alpha: 0.1)),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: colorScheme.primary, size: 20.sp),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    'اگر می‌خواهید برای خودروی خود خدمات دریافت کنید.',
                    style: TextStyle(fontSize: 12.sp, color: colorScheme.onSurface.withValues(alpha: 0.87), fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          if (widget.mobile.isEmpty) ...[
            _inputField('شماره موبایل', _mobileController, Icons.phone_android, hint: 'مثال: 09123456789'),
            SizedBox(height: 16.h),
          ],
          _inputField('نام', _userFirstNameController, Icons.person_outline, hint: 'مثال: علی'),
          SizedBox(height: 16.h),
          _inputField('نام خانوادگی', _userLastNameController, Icons.person_outline, hint: 'مثال: احمدی'),
          SizedBox(height: 16.h),
          _inputField('کد معرف (اختیاری)', _userReferralController, Icons.card_giftcard, hint: 'اگر کد معرف دارید وارد کنید'),
          SizedBox(height: 40.h),
          ElevatedButton(
            onPressed: _isLoading ? null : _registerUser,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 56.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
            ),
            child: _isLoading 
                ? SizedBox(height: 24, width: 24, child: CircularProgressIndicator(color: colorScheme.surface, strokeWidth: 2)) 
                : const Text('ثبت‌نام کاربر'),
          ),
        ],
      ),
    );
  }

  Widget _buildRepairmanForm() {
    final colorScheme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: colorScheme.primary.withValues(alpha: 0.1)),
            ),
            child: Row(
              children: [
                Icon(Icons.business_center_outlined, color: colorScheme.primary, size: 20.sp),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    'اگر اتوسرویس، تعمیرکار، صافکار، مکانیک، برقکار یا متخصص خدمات خودرو هستید.',
                    style: TextStyle(fontSize: 12.sp, color: colorScheme.onSurface.withValues(alpha: 0.87), fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          if (widget.mobile.isEmpty) ...[
            _inputField('شماره موبایل', _mobileController, Icons.phone_android, hint: 'مثال: 09123456789'),
            SizedBox(height: 16.h),
          ],
          _inputField('نام*', _repFirstNameController, Icons.person_outline, hint: 'مثال: رضا'),
          SizedBox(height: 16.h),
          _inputField('نام خانوادگی*', _repLastNameController, Icons.person_outline, hint: 'مثال: محمدی'),
          SizedBox(height: 16.h),
          _inputField('نام برند / فروشگاه*', _repBrandController, Icons.storefront, hint: 'مثال: اتوسرویس پارس'),
          SizedBox(height: 16.h),
          _inputField('آدرس دقیق*', _repAddressController, Icons.location_on_outlined, hint: 'مثال: اصفهان، خیابان چهارباغ، پلاک ۱۲'),
          SizedBox(height: 16.h),
          _occupationSelector(),
          SizedBox(height: 16.h),
          _inputField('کد معرف (اختیاری)', _repReferralController, Icons.card_giftcard, hint: 'اگر کد معرف دارید وارد کنید'),
          SizedBox(height: 16.h),
          _locationPickerButton(),
          SizedBox(height: 24.h),
          _buildRepairmanImagesSection(),
          SizedBox(height: 24.h),
          Text('شماره‌های تماس ثابت', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: colorScheme.onSurface.withValues(alpha: 0.87))),
          SizedBox(height: 8.h),
          ..._repPhoneControllers.asMap().entries.map((entry) {
            return Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: _inputField('شماره تماس ثابت ${entry.key + 1}', entry.value, Icons.phone_callback, hint: 'مثال: 03831234567'),
            );
          }),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () => setState(() => _repPhoneControllers.add(TextEditingController())),
              icon: const Icon(Icons.add_circle_outline, size: 20),
              label: const Text('افزودن شماره تماس'),
              style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.primary),
            ),
          ),
          SizedBox(height: 40.h),
          ElevatedButton(
            onPressed: _isLoading ? null : _registerRepairman,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 56.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
            ),
            child: _isLoading 
                ? SizedBox(height: 24, width: 24, child: CircularProgressIndicator(color: colorScheme.surface, strokeWidth: 2)) 
                : const Text('ثبت‌نام تعمیرکار'),
          ),
        ],
      ),
    );
  }

  Widget _buildRepairmanImagesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDynamicUploadGroup(
          'تصاویر هویتی (کارت ملی / شناسنامه)*',
          _identityImageIds,
          'profile_image',
          subtitle: 'لطفاً تصویر کارت ملی یا شناسنامه خود را برای احراز هویت آپلود کنید',
          uploadHintText: 'آپلود کارت ملی',
        ),
        SizedBox(height: 24.h),
        _buildDynamicUploadGroup(
          'تصاویر فروشگاه / کارگاه',
          _shopImageIds,
          'profile_image',
          subtitle: 'لطفاً تصویر محل کار، فروشگاه یا کارگاه خود را آپلود کنید',
          uploadHintText: 'آپلود عکس فروشگاه',
        ),
      ],
    );
  }

  Widget _buildDynamicUploadGroup(
    String label,
    List<String> ids,
    String type, {
    String? subtitle,
    String? uploadHintText,
  }) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.87),
          ),
        ),
        if (subtitle != null) ...[
          SizedBox(height: 4.h),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 11.sp,
              color: theme.colorScheme.primary.withValues(alpha: 0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
        SizedBox(height: 12.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...ids.asMap().entries.map((entry) {
                return Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: ImageUploadSlot(
                    key: ValueKey(entry.value),
                    index: entry.key,
                    imageType: type,
                    initialImageId: entry.value,
                    uploadText: uploadHintText,
                    onUploadSuccess: (id) {
                      if (id == null) {
                        setState(() {
                          ids.removeAt(entry.key);
                        });
                      }
                    },
                  ),
                );
              }),
              if (ids.length < 3)
                Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: ImageUploadSlot(
                    key: const ValueKey('plus_box'),
                    index: ids.length,
                    imageType: type,
                    uploadText: uploadHintText,
                    onUploadSuccess: (id) {
                      if (id != null) {
                        setState(() {
                          ids.add(id);
                        });
                      }
                    },
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _occupationSelector() {
    final theme = Theme.of(context);
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      bloc: bloc,
      buildWhen: (previous, current) => current is OccupationLoading || current is OccupationsLoaded || current is Failed,
      builder: (context, state) {
        List<OccupationEntity> occupations = [];
        bool isLoading = state is OccupationLoading;
        bool isError = state is Failed;

        if (state is OccupationsLoaded) {
          occupations = state.occupations;
        }

        String hintText = 'انتخاب تخصص';
        if (isLoading) hintText = 'در حال دریافت لیست...';
        if (isError && occupations.isEmpty) hintText = 'خطا در دریافت لیست (تلاش مجدد)';

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(' تخصص شما*', style: TextStyle(fontSize: 13.sp, color: theme.colorScheme.onSurface.withValues(alpha: 0.54), fontWeight: FontWeight.w500)),
                if (isError && occupations.isEmpty) ...[
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () => bloc.add(const FetchOccupations()),
                    child: Icon(Icons.refresh, size: 18.sp, color: theme.colorScheme.primary),
                  ),
                ],
              ],
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: double.infinity,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: DropdownMenu<String>(
                  width: 1.sw - 48.w,
                  menuHeight: 300.h,
                  enableSearch: false,
                  hintText: hintText,
                  initialSelection: _selectedOccupationId,
                  onSelected: (String? id) {
                    if (id != null) {
                      final selected = occupations.firstWhere((o) => o.id == id);
                      setState(() {
                        _selectedOccupationId = id;
                        _selectedOccupationTitle = selected.title;
                      });
                    }
                  },
                  textStyle: TextStyle(fontSize: 14.sp, color: theme.colorScheme.onSurface.withValues(alpha: 0.87)),
                  menuStyle: MenuStyle(
                    backgroundColor: WidgetStateProperty.all(theme.colorScheme.surface),
                    elevation: WidgetStateProperty.all(15),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
                    ),
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: theme.colorScheme.surfaceContainer,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                    prefixIconColor: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                  leadingIcon: const Icon(Icons.work_outline, size: 20),
                  dropdownMenuEntries: occupations.map((OccupationEntity occupation) {
                    return DropdownMenuEntry<String>(
                      value: occupation.id ?? '',
                      label: occupation.title ?? '',
                      style: MenuItemButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                        foregroundColor: theme.colorScheme.onSurface,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _inputField(String label, dynamic controller, IconData icon, {String? hint}) {
    final theme = Theme.of(context);
    final textController = controller is TextEditingController ? controller : TextEditingController(text: controller.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 13.sp, color: theme.colorScheme.onSurface.withValues(alpha: 0.54), fontWeight: FontWeight.w500)),
        SizedBox(height: 8.h),
        TextField(
          controller: textController,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontSize: 13.sp, color: theme.colorScheme.onSurface.withValues(alpha: 0.26)),
            filled: true,
            fillColor: theme.colorScheme.surfaceContainer,
            prefixIcon: Icon(icon, size: 20, color: theme.colorScheme.onSurface.withValues(alpha: 0.5)),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _locationPickerButton() {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('موقعیت مکانی*', style: TextStyle(fontSize: 13.sp, color: theme.colorScheme.onSurface.withValues(alpha: 0.54), fontWeight: FontWeight.w500)),
        SizedBox(height: 8.h),
        InkWell(
          onTap: _pickLocation,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: theme.colorScheme.outlineVariant),
            ),
            child: Row(
              children: [
                Icon(Icons.map_outlined, color: _selectedLocation != null ? theme.colorScheme.primary : theme.colorScheme.onSurface.withValues(alpha: 0.5)),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    _selectedLocation == null 
                        ? 'انتخاب مکان از روی نقشه' 
                        : 'مکان انتخاب شد (${_selectedLocation!.latitude.toStringAsFixed(4)}, ${_selectedLocation!.longitude.toStringAsFixed(4)})',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: _selectedLocation != null ? theme.colorScheme.onSurface : theme.colorScheme.onSurface.withValues(alpha: 0.38),
                    ),
                  ),
                ),
                if (_selectedLocation != null)
                  Icon(Icons.check_circle, color: StatusColors.of(context).success),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickLocation() async {
    final result = await Navigator.push<LatLng>(
      context,
      MaterialPageRoute(builder: (context) => MapPickerScreen(initialLocation: _selectedLocation)),
    );

    if (result != null) {
      setState(() {
        _selectedLocation = result;
      });
    }
  }

  void _registerUser() {
    if (_userFirstNameController.text.isEmpty || _userLastNameController.text.isEmpty || _mobileController.text.isEmpty) {
      CstmSnackBar.showError(context, 'لطفا اطلاعات ستاره‌دار را تکمیل کنید');
      return;
    }

    final data = {
      "first_name": _userFirstNameController.text,
      "last_name": _userLastNameController.text,
      "mobile": _mobileController.text,
      if (_selectedLocation != null)
        "location": {"lat": _selectedLocation!.latitude, "lng": _selectedLocation!.longitude},
      "referral_code": _userReferralController.text,
    };
    bloc.add(RegisterUserEvent(data));
  }

  void _registerRepairman() {
    if (_identityImageIds.isEmpty) {
      CstmSnackBar.showError(context, 'لطفاً تصویر کارت ملی یا شناسنامه خود را آپلود کنید');
      return;
    }

    if (_repFirstNameController.text.isEmpty || 
        _repLastNameController.text.isEmpty || 
        _repBrandController.text.isEmpty || 
        _repAddressController.text.isEmpty || 
        _mobileController.text.isEmpty || 
        _selectedOccupationId == null || 
        _selectedLocation == null) {
      CstmSnackBar.showError(context, 'لطفا تمامی موارد ستاره‌دار را تکمیل کنید');
      return;
    }

    final data = {
      "first_name": _repFirstNameController.text,
      "last_name": _repLastNameController.text,
      "brand": _repBrandController.text,
      "address": _repAddressController.text,
      "identity_images": _identityImageIds,
      "mobile": _mobileController.text,
      "location": {"lat": _selectedLocation!.latitude, "lng": _selectedLocation!.longitude},
      "occupation_id": _selectedOccupationId,
      "phone_numbers": _repPhoneControllers.map((c) => c.text).where((t) => t.isNotEmpty).toList(),
      "shop_images": _shopImageIds,
      "referral_code": _repReferralController.text,
    };
    bloc.add(RegisterRepairmanEvent(data));
  }
}
