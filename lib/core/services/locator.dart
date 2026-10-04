import 'package:get_it/get_it.dart';
import 'locators/admin_locator.dart';
import 'locators/auth_locator.dart';
import 'locators/core_locator.dart';
import 'locators/home_locator.dart';
import 'locators/services_locator.dart';
import 'locators/shop_locator.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  setupCoreLocator(locator);
  setupAdminLocator(locator);
  setupAuthLocator(locator);
  setupHomeLocator(locator);
  setupShopLocator(locator);
  setupServicesLocator(locator);
}
