import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:chaharmahal_shop_front/core/bloc/app/app_bloc.dart';
import 'package:chaharmahal_shop_front/core/bloc/widget_infinite_list/widget_infinite_list_bloc.dart';
import 'package:chaharmahal_shop_front/core/services/generic_api_service.dart';
import 'package:chaharmahal_shop_front/core/services/jwt_decoder.dart';
import 'package:chaharmahal_shop_front/core/services/location_service.dart';
import 'package:chaharmahal_shop_front/core/services/shop_settings_holder.dart';
import 'package:chaharmahal_shop_front/core/themes/bloc/theme_bloc.dart';
import 'package:chaharmahal_shop_front/core/themes/theme_manager.dart';

void setupCoreLocator(GetIt locator) {
  // Storage & Core API
  const storage = FlutterSecureStorage();
  locator.registerSingleton<FlutterSecureStorage>(storage);
  locator.registerLazySingleton<GenericApiService>(() => GenericApiService());

  // Services
  locator.registerLazySingleton<JwtDecoder>(() => JwtDecoder());
  locator.registerLazySingleton<ThemeManager>(() => ThemeManager(locator<FlutterSecureStorage>()));
  locator.registerLazySingleton<AppBloc>(() => AppBloc());
  locator.registerLazySingleton<LocationService>(() => LocationService());
  locator.registerLazySingleton<ShopSettingsHolder>(() => ShopSettingsHolder());

  // Core Blocs
  locator.registerFactory(() => WidgetInfiniteListBloc());
  locator.registerFactory(() => ThemeBloc(locator<ThemeManager>()));
}
