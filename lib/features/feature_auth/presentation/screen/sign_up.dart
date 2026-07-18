import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import '../../../../core/bloc/app/app_bloc.dart';
import '../../../../core/bloc/error/error_bloc.dart';
import '../../../../core/services/locator.dart';
import '../../../../core/presentation/screen/map_picker_screen.dart';
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
  final List<String?> _identityImageIds = [null, null];
  String? _licenseImageId;
  final List<String?> _shopImageIds = [null, null, null];

  // User Form Controllers
  final _mobileController = TextEditingController();
  final _userFirstNameController = TextEditingController();
  final _userLastNameController = TextEditingController();
  final _userReferralController = TextEditingController();

  // Repairman Form Controllers
  final _repFirstNameController = TextEditingController();
  final _repLastNameController = TextEditingController();
  final _repBrandController = TextEditingController();
  final _repReferralController = TextEditingController();
  final List<TextEditingController> _repPhoneControllers = [TextEditingController()];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message), backgroundColor: Colors.red),
      );
    } else if (state is AuthSuccess) {
      setState(() => _isLoading = false);
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('تکمیل ثبت‌نام', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
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
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: theme.primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: theme.primaryColor.withAlpha((0.3 * 255).toInt()),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, fontFamily: 'BonyadeKoodak'),
                  unselectedLabelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal, fontFamily: 'BonyadeKoodak'),
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(text: 'کاربر عادی'),
                    Tab(text: 'تعمیرکار'),
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
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.w),
      child: Column(
        children: [
          if (widget.mobile.isEmpty) ...[
            _inputField('شماره موبایل', _mobileController, Icons.phone_android),
            SizedBox(height: 16.h),
          ],
          _inputField('نام', _userFirstNameController, Icons.person_outline),
          SizedBox(height: 16.h),
          _inputField('نام خانوادگی', _userLastNameController, Icons.person_outline),
          SizedBox(height: 16.h),
          _inputField('کد معرف (اختیاری)', _userReferralController, Icons.card_giftcard),
          SizedBox(height: 24.h),
          _locationPickerButton(),
          SizedBox(height: 40.h),
          ElevatedButton(
            onPressed: _isLoading ? null : _registerUser,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 56.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
            ),
            child: _isLoading 
                ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) 
                : const Text('ثبت‌نام کاربر'),
          ),
        ],
      ),
    );
  }

  Widget _buildRepairmanForm() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.mobile.isEmpty) ...[
            _inputField('شماره موبایل', _mobileController, Icons.phone_android),
            SizedBox(height: 16.h),
          ],
          _inputField('نام', _repFirstNameController, Icons.person_outline),
          SizedBox(height: 16.h),
          _inputField('نام خانوادگی', _repLastNameController, Icons.person_outline),
          SizedBox(height: 16.h),
          _inputField('نام برند / فروشگاه', _repBrandController, Icons.storefront),
          SizedBox(height: 16.h),
          _occupationSelector(),
          SizedBox(height: 16.h),
          _inputField('کد معرف (اختیاری)', _repReferralController, Icons.card_giftcard),
          SizedBox(height: 24.h),
          _locationPickerButton(),
          SizedBox(height: 24.h),
          _buildRepairmanImagesSection(),
          SizedBox(height: 24.h),
          Text('شماره‌های تماس ثابت', style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: Colors.black87)),
          SizedBox(height: 8.h),
          ..._repPhoneControllers.asMap().entries.map((entry) {
            return Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: _inputField('شماره تماس ثابت ${entry.key + 1}', entry.value, Icons.phone_callback),
            );
          }),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () => setState(() => _repPhoneControllers.add(TextEditingController())),
              icon: const Icon(Icons.add_circle_outline, size: 20),
              label: const Text('افزودن شماره تماس'),
              style: TextButton.styleFrom(foregroundColor: Theme.of(context).primaryColor),
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
                ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) 
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
        _buildUploadGroup('تصویر جواز کسب', [_licenseImageId], 'profile_image', isSingle: true),
        SizedBox(height: 24.h),
        _buildUploadGroup('تصاویر هویتی (کارت ملی / شناسنامه)', _identityImageIds, 'profile_image', isIdentity: true),
        SizedBox(height: 24.h),
        _buildUploadGroup('تصاویر فروشگاه / کارگاه', _shopImageIds, 'profile_image', isShop: true),
      ],
    );
  }

  Widget _buildUploadGroup(String label, List<String?> ids, String type, {bool isSingle = false, bool isIdentity = false, bool isShop = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: Colors.black87)),
        SizedBox(height: 12.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(ids.length, (index) {
              return Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: ImageUploadSlot(
                  index: index,
                  imageType: type,
                  initialImageId: ids[index],
                  onUploadSuccess: (id) {
                    setState(() {
                      if (isSingle) {
                        _licenseImageId = id;
                      } else {
                        if (isIdentity) {
                          _identityImageIds[index] = id;
                        } else if (isShop) {
                          _shopImageIds[index] = id;
                        }
                      }
                    });
                  },
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _occupationSelector() {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      bloc: bloc,
      buildWhen: (previous, current) => current is OccupationLoading || current is OccupationsLoaded || current is Failed,
      builder: (context, state) {
        List<OccupationEntity> occupations = [];
        bool isLoading = state is OccupationLoading;

        if (state is OccupationsLoaded) {
          occupations = state.occupations;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('شناسه رسته شغلی', style: TextStyle(fontSize: 13.sp, color: Colors.black54, fontWeight: FontWeight.w500)),
            SizedBox(height: 8.h),
            SizedBox(
              width: double.infinity,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: DropdownMenu<String>(
                  width: 1.sw - 48.w,
                  menuHeight: 300.h,
                  enableSearch: false,
                  hintText: isLoading ? 'در حال دریافت لیست...' : 'انتخاب رسته شغلی',
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
                  textStyle: TextStyle(fontSize: 14.sp, color: Colors.black87),
                  menuStyle: MenuStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                    elevation: WidgetStateProperty.all(15),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
                    ),
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: const Color(0xFFF5F6F8),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                    prefixIconColor: Colors.grey,
                  ),
                  leadingIcon: const Icon(Icons.work_outline, size: 20),
                  dropdownMenuEntries: occupations.map((OccupationEntity occupation) {
                    return DropdownMenuEntry<String>(
                      value: occupation.id ?? '',
                      label: occupation.title ?? '',
                      style: MenuItemButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                        foregroundColor: Colors.black87,
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

  Widget _inputField(String label, TextEditingController controller, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 13.sp, color: Colors.black54, fontWeight: FontWeight.w500)),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, size: 20, color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          ),
        ),
      ],
    );
  }

  Widget _locationPickerButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('موقعیت مکانی', style: TextStyle(fontSize: 13.sp, color: Colors.black54, fontWeight: FontWeight.w500)),
        SizedBox(height: 8.h),
        InkWell(
          onTap: _pickLocation,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: const Color(0xffF8F8F8),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xffEEEEEE)),
            ),
            child: Row(
              children: [
                Icon(Icons.map_outlined, color: _selectedLocation != null ? Theme.of(context).primaryColor : Colors.grey),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    _selectedLocation == null 
                        ? 'انتخاب مکان از روی نقشه' 
                        : 'مکان انتخاب شد (${_selectedLocation!.latitude.toStringAsFixed(4)}, ${_selectedLocation!.longitude.toStringAsFixed(4)})',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: _selectedLocation != null ? Colors.black : Colors.black38,
                    ),
                  ),
                ),
                if (_selectedLocation != null)
                  const Icon(Icons.check_circle, color: Colors.green),
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
    if (_userFirstNameController.text.isEmpty || _userLastNameController.text.isEmpty || _mobileController.text.isEmpty || _selectedLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('لطفا اطلاعات ستاره‌دار و موقعیت مکانی را تکمیل کنید')));
      return;
    }

    final data = {
      "first_name": _userFirstNameController.text,
      "last_name": _userLastNameController.text,
      "mobile": _mobileController.text,
      "location": {"lat": _selectedLocation!.latitude, "lng": _selectedLocation!.longitude},
      "referral_code": _userReferralController.text,
    };
    bloc.add(RegisterUserEvent(data));
  }

  void _registerRepairman() {
    if (_repFirstNameController.text.isEmpty || _repLastNameController.text.isEmpty || _repBrandController.text.isEmpty || _mobileController.text.isEmpty || _selectedLocation == null || _selectedOccupationId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('لطفا اطلاعات ستاره‌دار و موقعیت مکانی و رسته شغلی را تکمیل کنید')));
      return;
    }

    final data = {
      "first_name": _repFirstNameController.text,
      "last_name": _repLastNameController.text,
      "brand": _repBrandController.text,
      "identity_images": _identityImageIds.whereType<String>().toList(),
      "business_license_image": _licenseImageId != null ? [_licenseImageId!] : [],
      "mobile": _mobileController.text,
      "location": {"lat": _selectedLocation!.latitude, "lng": _selectedLocation!.longitude},
      "occupation_id": _selectedOccupationId,
      "phone_numbers": _repPhoneControllers.map((c) => c.text).where((t) => t.isNotEmpty).toList(),
      "shop_images": _shopImageIds.whereType<String>().toList(),
      "referral_code": _repReferralController.text,
    };
    bloc.add(RegisterRepairmanEvent(data));
  }
}
