import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:resturant_app/core/resources/data_state.dart';
import 'package:resturant_app/core/services/locator.dart';
import 'package:resturant_app/core/services/shop_settings_holder.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_shop_settings/domain/repository/manage_shop_settings_repository.dart';
import '../../themes/theme_main.dart';
import '../../services/auth_guard.dart';
import '../../widgets/cstm_snakbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.none)) {
      if (!mounted) return;
      CstmSnackBar.show(
        context,
        'عدم اتصال به اینترنت',
        color: Theme.of(context).colorScheme.error,
        duration: const Duration(days: 1),
        action: SnackBarAction(
          label: 'تلاش مجدد',
          textColor: Theme.of(context).colorScheme.surface,
          onPressed: () {
            _checkConnectivity();
          },
        ),
      );
    } else {
      _navigate();
    }
  }

  Future<void> _navigate() async {
    // Fetch shop settings
    try {
      final repo = locator<ManageShopSettingsRepository>();
      final dataState = await repo.getShopSettings();
      if (dataState is DataSuccess && dataState.data != null) {
        locator<ShopSettingsHolder>().setSettings(dataState.data!);
      }
    } catch (e) {
      debugPrint('Error fetching shop settings: $e');
    }

    await Future.delayed(const Duration(milliseconds: 1200));
    if (!mounted) return;

    final loggedIn = await AuthGuard.isLoggedIn();
    if (!mounted) return;

    context.go(loggedIn ? '/home' : '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 160.w,
              height: 160.w,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 48.h),
            // SizedBox(
            //   width: 28.w,
            //   height: 28.w,
            //   child: const CircularProgressIndicator(
            //     strokeWidth: 2.5,
            //     color: Colors.white,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
