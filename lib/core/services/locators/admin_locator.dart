import 'package:get_it/get_it.dart';
import 'package:chaharmahal_shop_front/core/bloc/widget_infinite_list/widget_infinite_list_bloc.dart';
import 'package:chaharmahal_shop_front/core/services/generic_api_service.dart';
import 'package:chaharmahal_shop_front/features/feature_admin/data/data_source/remote/admin_api_provider.dart';
import 'package:chaharmahal_shop_front/features/feature_admin/data/repository/admin_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/feature_admin/domain/repository/admin_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_admin/presentation/bloc/admin_bloc.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_banner/data/data_source/remote/banner_api_provider.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_banner/data/repository/banner_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_banner/domain/repository/banner_repository.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_banner/presentation/bloc/banner_bloc.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_addresses/data/data_source/remote/manage_addresses_api_provider.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_addresses/data/repository/manage_addresses_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_addresses/domain/repository/manage_addresses_repository.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_addresses/presentation/bloc/manage_addresses_bloc.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_bank_accounts/data/data_source/remote/manage_bank_accounts_api_provider.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_bank_accounts/data/repository/manage_bank_accounts_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_bank_accounts/domain/repository/manage_bank_accounts_repository.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_bank_accounts/presentation/bloc/manage_bank_accounts_bloc.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_discounts/data/data_source/remote/manage_discounts_api_provider.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_discounts/data/repository/manage_discounts_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_discounts/domain/repository/manage_discounts_repository.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_discounts/presentation/bloc/manage_discounts_bloc.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_payment_types/data/data_source/remote/manage_payment_types_api_provider.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_payment_types/data/repository/manage_payment_types_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_payment_types/domain/repository/manage_payment_types_repository.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_payment_types/presentation/bloc/manage_payment_types_bloc.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_ratings/data/data_source/remote/manage_rating_api_provider.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_ratings/data/repository/manage_rating_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_ratings/domain/repository/manage_rating_repository.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_ratings/presentation/bloc/manage_rating_bloc.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_reminder_sub_items/data/data_source/remote/manage_reminder_sub_items_api_provider.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_reminder_sub_items/data/repository/manage_reminder_sub_items_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_reminder_sub_items/domain/repository/manage_reminder_sub_items_repository.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_reminder_sub_items/presentation/bloc/manage_reminder_sub_items_bloc.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_reminder_types/data/data_source/remote/manage_reminder_types_api_provider.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_reminder_types/data/repository/manage_reminder_types_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_reminder_types/domain/repository/manage_reminder_types_repository.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_reminder_types/presentation/bloc/manage_reminder_types_bloc.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_sending_methods/data/data_source/remote/manage_sending_methods_api_provider.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_sending_methods/data/repository/manage_sending_methods_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_sending_methods/domain/repository/manage_sending_methods_repository.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_sending_methods/presentation/bloc/manage_sending_methods_bloc.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_service/data/data_source/remote/manage_service_api_provider.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_service/data/repository/manage_service_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_service/domain/repository/manage_service_repository.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_service/presentation/bloc/manage_service_bloc.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_shop_products/data/data_source/remote/manage_shop_products_api_provider.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_shop_products/data/repository/manage_shop_products_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_shop_products/domain/repository/manage_shop_products_repository.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_shop_products/presentation/bloc/manage_shop_products_bloc.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_shop_settings/data/data_source/remote/manage_shop_settings_api_provider.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_shop_settings/data/repository/manage_shop_settings_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_shop_settings/domain/repository/manage_shop_settings_repository.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_shop_settings/presentation/bloc/manage_shop_settings_bloc.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_users/data/data_source/remote/manage_users_api_provider.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_users/data/repository/manage_users_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_users/domain/repository/manage_users_repository.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_users/presentation/bloc/manage_users_bloc.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_occupation/data/data_source/remote/occupation_api_provider.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_occupation/data/repository/occupation_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_occupation/domain/repository/occupation_repository.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_occupation/presentation/bloc/occupation_bloc.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_panel_admin/data/data_source/remote/panel_admin_api_provider.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_panel_admin/data/repository/panel_admin_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_panel_admin/domain/repository/panel_admin_repository.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_panel_admin/presentation/bloc/panel_admin_bloc.dart';

void setupAdminLocator(GetIt locator) {
  final apiService = locator<GenericApiService>();

  // Data Sources
  locator.registerLazySingleton<AdminApiProvider>(() => AdminApiProvider(apiService));
  locator.registerLazySingleton<PanelAdminApiProvider>(() => PanelAdminApiProvider(apiService));
  locator.registerLazySingleton<ManageAddressesApiProvider>(() => ManageAddressesApiProvider(apiService));
  locator.registerLazySingleton<ManageBankAccountsApiProvider>(() => ManageBankAccountsApiProvider(apiService));
  locator.registerLazySingleton<ManageDiscountsApiProvider>(() => ManageDiscountsApiProvider(apiService));
  locator.registerLazySingleton<ManageSendingMethodsApiProvider>(() => ManageSendingMethodsApiProvider(apiService));
  locator.registerLazySingleton<OccupationApiProvider>(() => OccupationApiProvider(apiService));
  locator.registerLazySingleton<ManageUsersApiProvider>(() => ManageUsersApiProvider(apiService));
  locator.registerLazySingleton<ManagePaymentTypesApiProvider>(() => ManagePaymentTypesApiProvider(apiService));
  locator.registerLazySingleton<ManageServiceApiProvider>(() => ManageServiceApiProvider(apiService));
  locator.registerLazySingleton<ManageShopProductsApiProvider>(() => ManageShopProductsApiProvider(apiService));
  locator.registerLazySingleton<BannerApiProvider>(() => BannerApiProvider(apiService));
  locator.registerLazySingleton<ManageReminderTypesApiProvider>(() => ManageReminderTypesApiProvider(apiService));
  locator.registerLazySingleton<ManageReminderSubItemsApiProvider>(() => ManageReminderSubItemsApiProvider(apiService));
  locator.registerLazySingleton<ManageRatingApiProvider>(() => ManageRatingApiProvider(apiService));
  locator.registerLazySingleton<ManageShopSettingsApiProvider>(() => ManageShopSettingsApiProvider(apiService));

  // Repositories
  locator.registerLazySingleton<AdminRepository>(
    () => AdminRepositoryImpl(locator<AdminApiProvider>()),
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
  locator.registerLazySingleton<ManagePaymentTypesRepository>(
    () => ManagePaymentTypesRepositoryImpl(locator<ManagePaymentTypesApiProvider>()),
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
  locator.registerFactory(() => AdminBloc(locator<AdminRepository>()));
  locator.registerFactory(() => PanelAdminBloc(locator<PanelAdminRepository>()));
  locator.registerFactory(() => ManageAddressesBloc(locator<ManageAddressesRepository>()));
  locator.registerFactory(() => ManageBankAccountsBloc(locator<ManageBankAccountsRepository>()));
  locator.registerFactory(() => ManageDiscountsBloc(locator<ManageDiscountsRepository>()));
  locator.registerFactory(() => ManageSendingMethodsBloc(locator<ManageSendingMethodsRepository>()));
  locator.registerFactory(() => OccupationBloc(locator<OccupationRepository>()));
  locator.registerFactory(() => ManageUsersBloc(locator<ManageUsersRepository>()));
  locator.registerFactory(() => ManagePaymentTypesBloc(locator<ManagePaymentTypesRepository>()));
  locator.registerFactory(() => ManageServiceBloc(locator<ManageServiceRepository>(), locator<WidgetInfiniteListBloc>()));
  locator.registerFactory(() => ManageShopProductsBloc(locator<ManageShopProductsRepository>(), locator<WidgetInfiniteListBloc>()));
  locator.registerFactory(() => ManageReminderTypesBloc(locator<ManageReminderTypesRepository>(), locator<WidgetInfiniteListBloc>()));
  locator.registerFactory(() => ManageReminderSubItemsBloc(locator<ManageReminderSubItemsRepository>(), locator<WidgetInfiniteListBloc>()));
  locator.registerFactory(() => ManageRatingBloc(locator<ManageRatingRepository>()));
  locator.registerFactory(() => BannerBloc(locator<BannerRepository>(), locator<WidgetInfiniteListBloc>()));
  locator.registerFactory(() => ManageShopSettingsBloc(locator<ManageShopSettingsRepository>()));
}
