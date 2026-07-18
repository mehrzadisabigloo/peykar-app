import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:resturant_app/core/bloc/app/app_bloc.dart';
import 'package:resturant_app/core/services/locator.dart';
import 'package:resturant_app/core/services/router.dart';
import 'package:resturant_app/core/themes/bloc/theme_bloc.dart';
import 'package:resturant_app/features/feature_auth/l10n/auth_localizations.dart';
import 'package:resturant_app/features/feature_home/l10n/home_localizations.dart';
import 'package:resturant_app/features/feature_auth/presentation/bloc/authentication_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ensure ScreenUtil has screen size before initializing
  await ScreenUtil.ensureScreenSize();

  // Initialize Dependency Injection
  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(400, 800),
      // minTextAdapt: true,
      // splitScreenMode: true,
      // ensureScreenSize: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AppBloc>(
              create: (context) => locator<AppBloc>(),
            ),
            BlocProvider<ThemeBloc>(
              create: (context) => locator<ThemeBloc>()..add(LoadTheme()),
            ),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, themeState) {
                return MaterialApp.router(
                  routerConfig: router,
                  theme: themeState.themeData,
                  debugShowCheckedModeBanner: false,
                  title: 'Restaurant App',
                  localizationsDelegates: const [
                    AuthLocalizations.delegate,
                    HomeLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('fa', 'IR'),
                    Locale('en', 'US'),
                  ],
                  locale: const Locale('fa'),
                );
              },
            ),
        );
      },
    );
  }

  void authBlocListener(BuildContext context, AuthenticationState state) {
    if (state is Failed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          backgroundColor: Colors.red,
        ),
      );
    }
    if (state is Loaded) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Successful'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
}
