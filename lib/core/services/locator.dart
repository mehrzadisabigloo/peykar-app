import 'package:resturant_app/features/panel_admin_features/feature_manage_reminder_sub_items/data/data_source/remote/manage_reminder_sub_items_api_provider.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_reminder_sub_items/data/repository/manage_reminder_sub_items_repository_impl.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_reminder_sub_items/domain/repository/manage_reminder_sub_items_repository.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_reminder_sub_items/presentation/bloc/manage_reminder_sub_items_bloc.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_shop_settings/data/data_source/remote/manage_shop_settings_api_provider.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_shop_settings/data/repository/manage_shop_settings_repository_impl.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_shop_settings/domain/repository/manage_shop_settings_repository.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_shop_settings/presentation/bloc/manage_shop_settings_bloc.dart';
import 'package:resturant_app/features/panel_admin_features/feature_banner/data/data_source/remote/banner_api_provider.dart';
import 'package:resturant_app/features/panel_admin_features/feature_banner/data/repository/banner_repository_impl.dart';
import 'package:resturant_app/features/panel_admin_features/feature_banner/domain/repository/banner_repository.dart';
import 'package:resturant_app/features/panel_admin_features/feature_banner/presentation/bloc/banner_bloc.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_ratings/data/data_source/remote/manage_rating_api_provider.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_ratings/data/repository/manage_rating_repository_impl.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_ratings/domain/repository/manage_rating_repository.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_ratings/presentation/bloc/manage_rating_bloc.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_reminder_types/data/data_source/remote/manage_reminder_types_api_provider.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_reminder_types/data/repository/manage_reminder_types_repository_impl.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_reminder_types/domain/repository/manage_reminder_types_repository.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_reminder_types/presentation/bloc/manage_reminder_types_bloc.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_payment_types/data/data_source/remote/manage_payment_types_api_provider.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_payment_types/data/repository/manage_payment_types_repository_impl.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_payment_types/domain/repository/manage_payment_types_repository.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_payment_types/presentation/bloc/manage_payment_types_bloc.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_service/data/data_source/remote/manage_service_api_provider.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_service/data/repository/manage_service_repository_impl.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_service/domain/repository/manage_service_repository.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_service/presentation/bloc/manage_service_bloc.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_shop_products/data/data_source/remote/manage_shop_products_api_provider.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_shop_products/data/repository/manage_shop_products_repository_impl.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_shop_products/domain/repository/manage_shop_products_repository.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_shop_products/presentation/bloc/manage_shop_products_bloc.dart';
import 'package:resturant_app/features/feature_repair_shop/data/data_source/remote/repairman_payment_type_api_provider.dart';
import 'package:resturant_app/features/feature_repair_shop/data/repository/repairman_payment_type_repository_impl.dart';
import 'package:resturant_app/features/feature_repair_shop/domain/repository/repairman_payment_type_repository.dart';
import 'package:resturant_app/features/feature_repair_shop/presentation/bloc/repairman_payment_type_bloc.dart';
import 'package:resturant_app/features/feature_shop_basket/data/repository/checkout_repository_impl.dart';
import 'package:resturant_app/features/feature_shop_basket/domain/repository/checkout_repository.dart';
import 'package:resturant_app/features/feature_shop_basket/presentation/bloc/checkout_bloc.dart';
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
import 'package:resturant_app/features/feature_home/presentation/bloc/home_bloc.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_users/data/data_source/remote/manage_users_api_provider.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_users/data/repository/manage_users_repository_impl.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_users/domain/repository/manage_users_repository.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_users/presentation/bloc/manage_users_bloc.dart';
import 'package:resturant_app/features/feature_create_time_slot/data/data_source/remote/create_time_slot_api_provider.dart';
import 'package:resturant_app/features/feature_create_time_slot/data/repository/create_time_slot_repository_impl.dart';
import 'package:resturant_app/features/feature_create_time_slot/domain/repository/create_time_slot_repository.dart';
import 'package:resturant_app/features/feature_create_time_slot/presentation/bloc/create_time_slot_bloc.dart';
import 'package:resturant_app/core/bloc/widget_infinite_list/widget_infinite_list_bloc.dart';

import 'package:resturant_app/core/services/location_service.dart';
import 'package:resturant_app/core/services/shop_settings_holder.dart';
import 'package:resturant_app/features/panel_admin_features/feature_manage_bank_accounts/data/repository/manage_bank_accounts_repository_impl.dart';
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
  locator.registerLazySingleton<JwtDecoder>(() => JwtDecoder());
  locator.registerLazySingleton<ThemeManager>(() => ThemeManager(locator<FlutterSecureStorage>()));
  locator.registerLazySingleton<AppBloc>(() => AppBloc());
  locator.registerLazySingleton<LocationService>(() => LocationService());
  locator.registerLazySingleton<ShopSettingsHolder>(() => ShopSettingsHolder());

  // Data Sources
  locator.registerLazySingleton<AuthApiProvider>(() => AuthApiProvider());
  locator.registerLazySingleton<HomeApiProvider>(() => HomeApiProvider());
  locator.registerLazySingleton<ManageProductsApiProvider>(() => ManageProductsApiProvider());
  locator.registerLazySingleton<ManageServicesApiProvider>(() => ManageServicesApiProvider());
  locator.registerLazySingleton<UploadFileApiProvider>(() => UploadFileApiProvider());
  locator.registerLazySingleton<DashboardApiProvider>(() => DashboardApiProvider());
  locator.registerLazySingleton<OrdersApiProvider>(() => OrdersApiProvider());
  locator.registerLazySingleton<AppointmentsApiProvider>(() => AppointmentsApiProvider());
  locator.registerLazySingleton<RemindersApiProvider>(() => RemindersApiProvider());
  locator.registerLazySingleton<AdminApiProvider>(() => AdminApiProvider());
  locator.registerLazySingleton<ClientServicesApiProvider>(() => ClientServicesApiProvider());
  locator.registerLazySingleton<RepairShopApiProvider>(() => RepairShopApiProvider());
  locator.registerLazySingleton<ProfileApiProvider>(() => ProfileApiProvider());
  locator.registerLazySingleton<ShopBasketApiProvider>(() => ShopBasketApiProvider());
  locator.registerLazySingleton<ShopApiProvider>(() => ShopApiProvider());
  locator.registerLazySingleton<PanelAdminApiProvider>(() => PanelAdminApiProvider());
  locator.registerLazySingleton<ManageAddressesApiProvider>(() => ManageAddressesApiProvider());
  locator.registerLazySingleton<ManageBankAccountsApiProvider>(() => ManageBankAccountsApiProvider());
  locator.registerLazySingleton<ManageDiscountsApiProvider>(() => ManageDiscountsApiProvider());
  locator.registerLazySingleton<ManageSendingMethodsApiProvider>(() => ManageSendingMethodsApiProvider());
  locator.registerLazySingleton<OccupationApiProvider>(() => OccupationApiProvider());
  locator.registerLazySingleton<ManageUsersApiProvider>(() => ManageUsersApiProvider());
  locator.registerLazySingleton<ManagePaymentTypesApiProvider>(() => ManagePaymentTypesApiProvider());
  locator.registerLazySingleton<CreateTimeSlotApiProvider>(() => CreateTimeSlotApiProvider());
  locator.registerLazySingleton<RepairmanPaymentTypeApiProvider>(() => RepairmanPaymentTypeApiProvider());
  locator.registerLazySingleton<ManageServiceApiProvider>(() => ManageServiceApiProvider());
  locator.registerLazySingleton<ManageShopProductsApiProvider>(() => ManageShopProductsApiProvider());
  locator.registerLazySingleton<BannerApiProvider>(() => BannerApiProvider());
  locator.registerLazySingleton<ManageReminderTypesApiProvider>(() => ManageReminderTypesApiProvider());
  locator.registerLazySingleton<ManageReminderSubItemsApiProvider>(() => ManageReminderSubItemsApiProvider());
  locator.registerLazySingleton<ManageRatingApiProvider>(() => ManageRatingApiProvider());
  locator.registerLazySingleton<ManageShopSettingsApiProvider>(() => ManageShopSettingsApiProvider());

  // Repositories
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(locator<AuthApiProvider>()),
  );
  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(locator<HomeApiProvider>()),
  );
  locator.registerLazySingleton<ManageProductsRepository>(
    () => ManageProductsRepositoryImpl(locator<ManageProductsApiProvider>()),
  );
  locator.registerLazySingleton<ManageServicesRepository>(
    () => ManageServicesRepositoryImpl(locator<ManageServicesApiProvider>()),
  );
  locator.registerLazySingleton<UploadFileRepository>(
    () => UploadFileRepositoryImpl(locator<UploadFileApiProvider>()),
  );
  locator.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(locator<DashboardApiProvider>()),
  );
  locator.registerLazySingleton<OrdersRepository>(
    () => OrdersRepositoryImpl(locator<OrdersApiProvider>()),
  );
  locator.registerLazySingleton<AppointmentsRepository>(
    () => AppointmentsRepositoryImpl(locator<AppointmentsApiProvider>()),
  );
  locator.registerLazySingleton<RemindersRepository>(
    () => RemindersRepositoryImpl(locator<RemindersApiProvider>()),
  );
  locator.registerLazySingleton<AdminRepository>(
    () => AdminRepositoryImpl(locator<AdminApiProvider>()),
  );
  locator.registerLazySingleton<ClientServicesRepository>(
    () => ClientServicesRepositoryImpl(locator<ClientServicesApiProvider>()),
  );
  locator.registerLazySingleton<RepairShopRepository>(
    () => RepairShopRepositoryImpl(locator<RepairShopApiProvider>()),
  );
  locator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(locator<ProfileApiProvider>()),
  );
  locator.registerLazySingleton<ShopBasketRepository>(
    () => ShopBasketRepositoryImpl(locator<ShopBasketApiProvider>()),
  );
  locator.registerLazySingleton<CheckoutRepository>(
    () => CheckoutRepositoryImpl(),
  );
  locator.registerLazySingleton<ShopRepository>(
    () => ShopRepositoryImpl(locator<ShopApiProvider>()),
  );
  locator.registerLazySingleton<PanelAdminRepository>(
    () => PanelAdminRepositoryImpl(locator<PanelAdminApiProvider>()),
  );
  locator.registerLazySingleton<ManageAddressesRepository>(
    () => ManageAddressesRepositoryImpl(locator<ManageAddressesApiProvider>()),
  );
  locator.registerLazySingleton<ManageBankAccountsRepository>(
    () => ManageBankAccountsRepositoryImpl(locator<ManageBankAccountsApiProvider>()),
  );
  locator.registerLazySingleton<ManageDiscountsRepository>(
    () => ManageDiscountsRepositoryImpl(locator<ManageDiscountsApiProvider>()),
  );
  locator.registerLazySingleton<ManageSendingMethodsRepository>(
    () => ManageSendingMethodsRepositoryImpl(locator<ManageSendingMethodsApiProvider>()),
  );
  locator.registerLazySingleton<OccupationRepository>(
    () => OccupationRepositoryImpl(locator<OccupationApiProvider>()),
  );
  locator.registerLazySingleton<ManageUsersRepository>(
    () => ManageUsersRepositoryImpl(locator<ManageUsersApiProvider>()),
  );
  locator.registerLazySingleton<RepairmanPaymentTypeRepository>(
    () => RepairmanPaymentTypeRepositoryImpl(locator<RepairmanPaymentTypeApiProvider>()),
  );
  locator.registerLazySingleton<ManagePaymentTypesRepository>(
    () => ManagePaymentTypesRepositoryImpl(locator<ManagePaymentTypesApiProvider>()),
  );
  locator.registerLazySingleton<CreateTimeSlotRepository>(
    () => CreateTimeSlotRepositoryImpl(locator<CreateTimeSlotApiProvider>()),
  );
  locator.registerLazySingleton<ManageServiceRepository>(
    () => ManageServiceRepositoryImpl(locator<ManageServiceApiProvider>()),
  );
  locator.registerLazySingleton<ManageShopProductsRepository>(
    () => ManageShopProductsRepositoryImpl(locator<ManageShopProductsApiProvider>()),
  );
  locator.registerLazySingleton<ManageReminderTypesRepository>(
    () => ManageReminderTypesRepositoryImpl(locator<ManageReminderTypesApiProvider>()),
  );
  locator.registerLazySingleton<ManageReminderSubItemsRepository>(
    () => ManageReminderSubItemsRepositoryImpl(locator<ManageReminderSubItemsApiProvider>()),
  );
  locator.registerLazySingleton<ManageRatingRepository>(
    () => ManageRatingRepositoryImpl(locator<ManageRatingApiProvider>()),
  );
  locator.registerLazySingleton<BannerRepository>(
    () => BannerRepositoryImpl(locator<BannerApiProvider>()),
  );
  locator.registerLazySingleton<ManageShopSettingsRepository>(
    () => ManageShopSettingsRepositoryImpl(locator<ManageShopSettingsApiProvider>()),
  );

  // Blocs
  locator.registerFactory(() => WidgetInfiniteListBloc());
  locator.registerFactory(() => ThemeBloc(locator<ThemeManager>()));
  locator.registerFactory(() => AuthenticationBloc(locator<AuthRepository>(), locator<OccupationRepository>()));
  locator.registerFactory(() => UsersBloc(locator<HomeRepository>() as HomeRepositoryImpl, locator<WidgetInfiniteListBloc>()));
  locator.registerFactory(() => MainHomePageBloc(locator<JwtDecoder>(), locator<ProfileRepository>()));
  locator.registerFactory(() => HomeBloc(locator<OccupationRepository>(), locator<BannerRepository>(), locator<WidgetInfiniteListBloc>()));
  locator.registerFactory(() => ManageProductsBloc(locator<ManageProductsRepository>()));
  locator.registerFactory(() => AddProductBloc(locator<ManageProductsRepository>()));
  locator.registerFactory(() => ProductDetailBloc(locator<ManageProductsRepository>()));
  locator.registerFactory(() => ManageServicesBloc(locator<ManageServicesRepository>()));
  locator.registerFactory(() => AddServiceBloc(locator<ManageServicesRepository>()));
  locator.registerFactory(() => ServiceDetailBloc(locator<ManageServicesRepository>()));
  locator.registerFactory(() => UploadFileBloc(locator<UploadFileRepository>()));
  locator.registerFactory(() => DashboardBloc(locator<DashboardRepository>(), locator<BannerRepository>()));
  locator.registerFactory(() => OrdersBloc(locator<OrdersRepository>()));
  locator.registerFactory(() => AppointmentsBloc(locator<AppointmentsRepository>(), locator<WidgetInfiniteListBloc>()));
  locator.registerFactory(() => RemindersBloc(locator<RemindersRepository>(), locator<ManageServicesRepository>(), locator<WidgetInfiniteListBloc>()));
  locator.registerFactory(() => AdminBloc(locator<AdminRepository>()));
  locator.registerFactory(() => ClientServicesBloc(locator<ClientServicesRepository>()));
  locator.registerFactory(() => TopRepairShopsBloc(locator<ClientServicesRepository>()));
  locator.registerFactory(() => RepairShopBloc(locator<RepairShopRepository>()));
  locator.registerFactory(() => ProfileBloc(locator<ProfileRepository>()));
  locator.registerFactory(() => ShopBasketBloc(locator<ShopBasketRepository>()));
  locator.registerFactory(() => CheckoutBloc(
        locator<CheckoutRepository>(),
        locator<ManageAddressesRepository>(),
        locator<RepairmanPaymentTypeRepository>(),
      ));
  locator.registerFactory(() => ShopBloc(locator<ShopRepository>(), locator<BannerRepository>(), locator<WidgetInfiniteListBloc>()));
  locator.registerFactory(() => PanelAdminBloc(locator<PanelAdminRepository>()));
  locator.registerFactory(() => ManageAddressesBloc(locator<ManageAddressesRepository>()));
  locator.registerFactory(() => ManageBankAccountsBloc(locator<ManageBankAccountsRepository>()));
  locator.registerFactory(() => ManageDiscountsBloc(locator<ManageDiscountsRepository>()));
  locator.registerFactory(() => ManageSendingMethodsBloc(locator<ManageSendingMethodsRepository>()));
  locator.registerFactory(() => OccupationBloc(locator<OccupationRepository>()));
  locator.registerFactory(() => ManageUsersBloc(locator<ManageUsersRepository>()));
  locator.registerFactory(() => RepairmanPaymentTypeBloc(locator<RepairmanPaymentTypeRepository>()));
  locator.registerFactory(() => ManagePaymentTypesBloc(locator<ManagePaymentTypesRepository>()));
  locator.registerFactory(() => CreateTimeSlotBloc(locator<CreateTimeSlotRepository>()));
  locator.registerFactory(() => ManageServiceBloc(locator<ManageServiceRepository>(), locator<WidgetInfiniteListBloc>()));
  locator.registerFactory(() => ManageShopProductsBloc(locator<ManageShopProductsRepository>(), locator<WidgetInfiniteListBloc>()));
  locator.registerFactory(() => ManageReminderTypesBloc(locator<ManageReminderTypesRepository>(), locator<WidgetInfiniteListBloc>()));
  locator.registerFactory(() => ManageReminderSubItemsBloc(locator<ManageReminderSubItemsRepository>(), locator<WidgetInfiniteListBloc>()));
  locator.registerFactory(() => ManageRatingBloc(locator<ManageRatingRepository>()));
  locator.registerFactory(() => BannerBloc(locator<BannerRepository>(), locator<WidgetInfiniteListBloc>()));
  locator.registerFactory(() => ManageShopSettingsBloc(locator<ManageShopSettingsRepository>()));
}

// Ensure you import the new Bloc at the top of the file
