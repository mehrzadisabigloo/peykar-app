import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:resturant_app/core/bloc/app/app_bloc.dart';
import 'package:resturant_app/core/themes/theme_manager.dart';
import 'package:resturant_app/features/feature_auth/data/data_source/remote/api_provider.dart';
import 'package:resturant_app/features/feature_auth/data/repository/auth_repositoryImpl.dart';
import 'package:resturant_app/features/feature_auth/domain/repository/auth_repository.dart';
import 'package:resturant_app/features/feature_auth/presentation/bloc/authentication_bloc.dart';
import 'package:resturant_app/core/themes/bloc/theme_bloc.dart';
import 'package:resturant_app/features/feature_home/data/data_source/remote/home_api_provider.dart';
import 'package:resturant_app/features/feature_home/data/repository/home_repository_impl.dart';
import 'package:resturant_app/features/feature_home/domain/repository/home_repository.dart';
import 'package:resturant_app/features/feature_home/presentation/bloc/users_bloc.dart';
import 'package:resturant_app/core/services/jwt_decoder.dart';
import 'package:resturant_app/features/feature_home/presentation/bloc/main_home_page_bloc.dart';
import 'package:resturant_app/features/feature_manage_products/data/data_source/remote/manage_products_api_provider.dart';
import 'package:resturant_app/features/feature_manage_products/data/repository/manage_products_repository_impl.dart';
import 'package:resturant_app/features/feature_manage_products/domain/repository/manage_products_repository.dart';
import 'package:resturant_app/features/feature_manage_products/presentation/bloc/manage_products_bloc.dart';
import 'package:resturant_app/features/feature_manage_products/presentation/bloc/add_product/add_product_bloc.dart';
import 'package:resturant_app/features/feature_manage_products/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:resturant_app/features/feature_manage_services/data/data_source/remote/manage_services_api_provider.dart';
import 'package:resturant_app/features/feature_manage_services/data/repository/manage_services_repository_impl.dart';
import 'package:resturant_app/features/feature_manage_services/domain/repository/manage_services_repository.dart';
import 'package:resturant_app/features/feature_manage_services/presentation/bloc/manage_services_bloc.dart';
import 'package:resturant_app/features/feature_manage_services/presentation/bloc/add_service/add_service_bloc.dart';
import 'package:resturant_app/features/feature_manage_services/presentation/bloc/service_detail/service_detail_bloc.dart';
import 'package:resturant_app/features/feature_upload_file/data/data_source/remote/api_provider.dart';
import 'package:resturant_app/features/feature_upload_file/data/repository/upload_file_repositoryImpl.dart';
import 'package:resturant_app/features/feature_upload_file/domain/repository/upload_file_repository.dart';
import 'package:resturant_app/features/feature_upload_file/presentation/bloc/upload_file_bloc.dart';
import 'package:resturant_app/features/feature_dashboard/data/data_source/remote/dashboard_api_provider.dart';
import 'package:resturant_app/features/feature_dashboard/data/repository/dashboard_repository_impl.dart';
import 'package:resturant_app/features/feature_dashboard/domain/repository/dashboard_repository.dart';
import 'package:resturant_app/features/feature_dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:resturant_app/features/feature_orders/data/data_source/remote/orders_api_provider.dart';
import 'package:resturant_app/features/feature_orders/data/repository/orders_repository_impl.dart';
import 'package:resturant_app/features/feature_orders/domain/repository/orders_repository.dart';
import 'package:resturant_app/features/feature_orders/presentation/bloc/orders_bloc.dart';
import 'package:resturant_app/features/feature_appointments/data/data_source/remote/appointments_api_provider.dart';
import 'package:resturant_app/features/feature_appointments/data/repository/appointments_repository_impl.dart';
import 'package:resturant_app/features/feature_appointments/domain/repository/appointments_repository.dart';
import 'package:resturant_app/features/feature_appointments/presentation/bloc/appointments_bloc.dart';
import 'package:resturant_app/features/feature_reminders/data/data_source/remote/reminders_api_provider.dart';
import 'package:resturant_app/features/feature_reminders/data/repository/reminders_repository_impl.dart';
import 'package:resturant_app/features/feature_reminders/domain/repository/reminders_repository.dart';
import 'package:resturant_app/features/feature_reminders/presentation/bloc/reminders_bloc.dart';
import 'package:resturant_app/features/feature_admin/data/data_source/remote/admin_api_provider.dart';
import 'package:resturant_app/features/feature_admin/data/repository/admin_repository_impl.dart';
import 'package:resturant_app/features/feature_admin/domain/repository/admin_repository.dart';
import 'package:resturant_app/features/feature_admin/presentation/bloc/admin_bloc.dart';
import 'package:resturant_app/features/feature_client_services/data/data_source/remote/client_services_api_provider.dart';
import 'package:resturant_app/features/feature_client_services/data/repository/client_services_repository_impl.dart';
import 'package:resturant_app/features/feature_client_services/domain/repository/client_services_repository.dart';
import 'package:resturant_app/features/feature_client_services/presentation/bloc/client_services_bloc.dart';
import 'package:resturant_app/features/feature_client_services/presentation/bloc/top_repair_shops/top_repair_shops_bloc.dart';
import 'package:resturant_app/features/feature_repair_shop/data/data_source/remote/repair_shop_api_provider.dart';
import 'package:resturant_app/features/feature_repair_shop/data/repository/repair_shop_repository_impl.dart';
import 'package:resturant_app/features/feature_repair_shop/domain/repository/repair_shop_repository.dart';
import 'package:resturant_app/features/feature_repair_shop/presentation/bloc/repair_shop_bloc.dart';
import 'package:resturant_app/features/feature_profile/data/data_source/remote/profile_api_provider.dart';
import 'package:resturant_app/features/feature_profile/data/repository/profile_repository_impl.dart';
import 'package:resturant_app/features/feature_profile/domain/repository/profile_repository.dart';
import 'package:resturant_app/features/feature_profile/presentation/bloc/profile_bloc.dart';
import 'package:resturant_app/features/feature_shop/data/data_source/remote/shop_api_provider.dart';
import 'package:resturant_app/features/feature_shop/data/repository/shop_repository_impl.dart';
import 'package:resturant_app/features/feature_shop/domain/repository/shop_repository.dart';
import 'package:resturant_app/features/feature_shop/presentation/bloc/shop_bloc.dart';
import 'package:resturant_app/features/feature_shop_basket/data/data_source/remote/shop_basket_api_provider.dart';
import 'package:resturant_app/features/feature_shop_basket/data/repository/shop_basket_repository_impl.dart';
import 'package:resturant_app/features/feature_shop_basket/domain/repository/shop_basket_repository.dart';
import 'package:resturant_app/features/feature_shop_basket/presentation/bloc/shop_basket_bloc.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_discounts/data/data_source/remote/manage_discounts_api_provider.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_discounts/data/repository/manage_discounts_repository_impl.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_discounts/domain/repository/manage_discounts_repository.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_discounts/presentation/bloc/manage_discounts_bloc.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_sending_methods/data/data_source/remote/manage_sending_methods_api_provider.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_sending_methods/data/repository/manage_sending_methods_repository_impl.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_sending_methods/domain/repository/manage_sending_methods_repository.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_sending_methods/presentation/bloc/manage_sending_methods_bloc.dart';
import 'package:resturant_app/features/panel_admin_features/feature_panel_admin/presentation/bloc/panel_admin_bloc.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_addresses/data/data_source/remote/manage_addresses_api_provider.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_addresses/data/repository/manage_addresses_repository_impl.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_addresses/domain/repository/manage_addresses_repository.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_addresses/presentation/bloc/manage_addresses_bloc.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_bank_accounts/data/data_source/remote/manage_bank_accounts_api_provider.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_bank_accounts/presentation/bloc/manage_bank_accounts_bloc.dart';
import 'package:resturant_app/features/panel_admin_features/feature_occupation/data/data_source/remote/occupation_api_provider.dart';
import 'package:resturant_app/features/panel_admin_features/feature_occupation/data/repository/occupation_repository_impl.dart';
import 'package:resturant_app/features/panel_admin_features/feature_occupation/domain/repository/occupation_repository.dart';
import 'package:resturant_app/features/panel_admin_features/feature_occupation/presentation/bloc/occupation_bloc.dart';

import '../../features/panel_admin_features/feature_manage_bank_accounts/data/repository/manage_bank_accounts_repository_impl.dart';
import '../../features/panel_admin_features/feature_manage_bank_accounts/domain/repository/manage_bank_accounts_repository.dart';
import '../../features/panel_admin_features/feature_panel_admin/data/data_source/remote/panel_admin_api_provider.dart';
import '../../features/panel_admin_features/feature_panel_admin/data/repository/panel_admin_repository_impl.dart';
import '../../features/panel_admin_features/feature_panel_admin/domain/repository/panel_admin_repository.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // External
  const storage = FlutterSecureStorage();
  locator.registerSingleton<FlutterSecureStorage>(storage);

  // Services
  locator.registerSingleton<JwtDecoder>(JwtDecoder());
  locator.registerSingleton<ThemeManager>(ThemeManager(locator<FlutterSecureStorage>()));
  locator.registerLazySingleton<AppBloc>(() => AppBloc());

  // Data Sources
  locator.registerSingleton<AuthApiProvider>(AuthApiProvider());
  locator.registerSingleton<HomeApiProvider>(HomeApiProvider());
  locator.registerSingleton<ManageProductsApiProvider>(ManageProductsApiProvider());
  locator.registerSingleton<ManageServicesApiProvider>(ManageServicesApiProvider());
  locator.registerSingleton<UploadFileApiProvider>(UploadFileApiProvider());
  locator.registerSingleton<DashboardApiProvider>(DashboardApiProvider());
  locator.registerSingleton<OrdersApiProvider>(OrdersApiProvider());
  locator.registerSingleton<AppointmentsApiProvider>(AppointmentsApiProvider());
  locator.registerSingleton<RemindersApiProvider>(RemindersApiProvider());
  locator.registerSingleton<AdminApiProvider>(AdminApiProvider());
  locator.registerSingleton<ClientServicesApiProvider>(ClientServicesApiProvider());
  locator.registerSingleton<RepairShopApiProvider>(RepairShopApiProvider());
  locator.registerSingleton<ProfileApiProvider>(ProfileApiProvider());
  locator.registerSingleton<ShopBasketApiProvider>(ShopBasketApiProvider());
  locator.registerSingleton<ShopApiProvider>(ShopApiProvider());
  locator.registerSingleton<PanelAdminApiProvider>(PanelAdminApiProvider());
  locator.registerSingleton<ManageAddressesApiProvider>(ManageAddressesApiProvider());
  locator.registerSingleton<ManageBankAccountsApiProvider>(ManageBankAccountsApiProvider());
  locator.registerSingleton<ManageDiscountsApiProvider>(ManageDiscountsApiProvider());
  locator.registerSingleton<ManageSendingMethodsApiProvider>(ManageSendingMethodsApiProvider());
  locator.registerSingleton<OccupationApiProvider>(OccupationApiProvider());

  // Repositories
  locator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(locator<AuthApiProvider>()),
  );
  locator.registerSingleton<HomeRepository>(
    HomeRepositoryImpl(locator<HomeApiProvider>()),
  );
  locator.registerSingleton<ManageProductsRepository>(
    ManageProductsRepositoryImpl(locator<ManageProductsApiProvider>()),
  );
  locator.registerSingleton<ManageServicesRepository>(
    ManageServicesRepositoryImpl(locator<ManageServicesApiProvider>()),
  );
  locator.registerSingleton<UploadFileRepository>(
    UploadFileRepositoryImpl(locator<UploadFileApiProvider>()),
  );
  locator.registerSingleton<DashboardRepository>(
    DashboardRepositoryImpl(locator<DashboardApiProvider>()),
  );
  locator.registerSingleton<OrdersRepository>(
    OrdersRepositoryImpl(locator<OrdersApiProvider>()),
  );
  locator.registerSingleton<AppointmentsRepository>(
    AppointmentsRepositoryImpl(locator<AppointmentsApiProvider>()),
  );
  locator.registerSingleton<RemindersRepository>(
    RemindersRepositoryImpl(locator<RemindersApiProvider>()),
  );
  locator.registerSingleton<AdminRepository>(
    AdminRepositoryImpl(locator<AdminApiProvider>()),
  );
  locator.registerSingleton<ClientServicesRepository>(
    ClientServicesRepositoryImpl(locator<ClientServicesApiProvider>()),
  );
  locator.registerSingleton<RepairShopRepository>(
    RepairShopRepositoryImpl(locator<RepairShopApiProvider>()),
  );
  locator.registerSingleton<ProfileRepository>(
    ProfileRepositoryImpl(locator<ProfileApiProvider>()),
  );
  locator.registerSingleton<ShopBasketRepository>(
    ShopBasketRepositoryImpl(locator<ShopBasketApiProvider>()),
  );
  locator.registerSingleton<ShopRepository>(
    ShopRepositoryImpl(locator<ShopApiProvider>()),
  );
  locator.registerSingleton<PanelAdminRepository>(
    PanelAdminRepositoryImpl(locator<PanelAdminApiProvider>()),
  );
  locator.registerSingleton<ManageAddressesRepository>(
    ManageAddressesRepositoryImpl(locator<ManageAddressesApiProvider>()),
  );
  locator.registerSingleton<ManageBankAccountsRepository>(
    ManageBankAccountsRepositoryImpl(locator<ManageBankAccountsApiProvider>()),
  );
  locator.registerSingleton<ManageDiscountsRepository>(
    ManageDiscountsRepositoryImpl(locator<ManageDiscountsApiProvider>()),
  );
  locator.registerSingleton<ManageSendingMethodsRepository>(
    ManageSendingMethodsRepositoryImpl(locator<ManageSendingMethodsApiProvider>()),
  );
  locator.registerSingleton<OccupationRepository>(
    OccupationRepositoryImpl(locator<OccupationApiProvider>()),
  );

  // Blocs
  locator.registerFactory(() => ThemeBloc(locator<ThemeManager>()));
  locator.registerFactory(() => AuthenticationBloc(locator<AuthRepository>(), locator<OccupationRepository>()));
  locator.registerFactory(() => UsersBloc(locator<HomeRepository>() as HomeRepositoryImpl));
  locator.registerFactory(() => MainHomePageBloc(locator<JwtDecoder>()));
  locator.registerFactory(() => ManageProductsBloc(locator<ManageProductsRepository>()));
  locator.registerFactory(() => AddProductBloc(locator<ManageProductsRepository>()));
  locator.registerFactory(() => ProductDetailBloc(locator<ManageProductsRepository>()));
  locator.registerFactory(() => ManageServicesBloc(locator<ManageServicesRepository>()));
  locator.registerFactory(() => AddServiceBloc(locator<ManageServicesRepository>()));
  locator.registerFactory(() => ServiceDetailBloc(locator<ManageServicesRepository>()));
  locator.registerFactory(() => UploadFileBloc(locator<UploadFileRepository>()));
  locator.registerFactory(() => DashboardBloc(locator<DashboardRepository>()));
  locator.registerFactory(() => OrdersBloc(locator<OrdersRepository>()));
  locator.registerFactory(() => AppointmentsBloc(locator<AppointmentsRepository>()));
  locator.registerFactory(() => RemindersBloc(locator<RemindersRepository>()));
  locator.registerFactory(() => AdminBloc(locator<AdminRepository>()));
  locator.registerFactory(() => ClientServicesBloc(locator<ClientServicesRepository>()));
  locator.registerFactory(() => TopRepairShopsBloc(locator<ClientServicesRepository>()));
  locator.registerFactory(() => RepairShopBloc(locator<RepairShopRepository>()));
  locator.registerFactory(() => ProfileBloc(locator<ProfileRepository>()));
  locator.registerFactory(() => ShopBasketBloc(locator<ShopBasketRepository>()));
  locator.registerFactory(() => ShopBloc(locator<ShopRepository>()));
  locator.registerFactory(() => PanelAdminBloc(locator<PanelAdminRepository>()));
  locator.registerFactory(() => ManageAddressesBloc(locator<ManageAddressesRepository>()));
  locator.registerFactory(() => ManageBankAccountsBloc(locator<ManageBankAccountsRepository>()));
  locator.registerFactory(() => ManageDiscountsBloc(locator<ManageDiscountsRepository>()));
  locator.registerFactory(() => ManageSendingMethodsBloc(locator<ManageSendingMethodsRepository>()));
  locator.registerFactory(() => OccupationBloc(locator<OccupationRepository>()));
}

// Ensure you import the new Bloc at the top of the file
