import 'package:get_it/get_it.dart';
import 'package:chaharmahal_shop_front/core/bloc/widget_infinite_list/widget_infinite_list_bloc.dart';
import 'package:chaharmahal_shop_front/core/services/generic_api_service.dart';
import 'package:chaharmahal_shop_front/features/feature_appointments/data/data_source/remote/appointments_api_provider.dart';
import 'package:chaharmahal_shop_front/features/feature_appointments/data/repository/appointments_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/feature_appointments/domain/repository/appointments_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_appointments/presentation/bloc/appointments_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_client_services/data/data_source/remote/client_services_api_provider.dart';
import 'package:chaharmahal_shop_front/features/feature_client_services/data/repository/client_services_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/feature_client_services/domain/repository/client_services_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_client_services/presentation/bloc/client_services_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_client_services/presentation/bloc/top_repair_shops/top_repair_shops_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_create_time_slot/data/data_source/remote/create_time_slot_api_provider.dart';
import 'package:chaharmahal_shop_front/features/feature_create_time_slot/data/repository/create_time_slot_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/feature_create_time_slot/domain/repository/create_time_slot_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_create_time_slot/presentation/bloc/create_time_slot_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_dashboard/data/data_source/remote/dashboard_api_provider.dart';
import 'package:chaharmahal_shop_front/features/feature_dashboard/data/repository/dashboard_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/feature_dashboard/domain/repository/dashboard_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_manage_services/domain/repository/manage_services_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_orders/data/data_source/remote/orders_api_provider.dart';
import 'package:chaharmahal_shop_front/features/feature_orders/data/repository/orders_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/feature_orders/domain/repository/orders_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_orders/presentation/bloc/orders_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_profile/data/data_source/remote/profile_api_provider.dart';
import 'package:chaharmahal_shop_front/features/feature_profile/data/repository/profile_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/feature_profile/domain/repository/profile_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_profile/presentation/bloc/profile_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_reminders/data/data_source/remote/reminders_api_provider.dart';
import 'package:chaharmahal_shop_front/features/feature_reminders/data/repository/reminders_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/feature_reminders/domain/repository/reminders_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_reminders/presentation/bloc/reminders_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_repair_shop/data/data_source/remote/repair_shop_api_provider.dart';
import 'package:chaharmahal_shop_front/features/feature_repair_shop/data/data_source/remote/repairman_payment_type_api_provider.dart';
import 'package:chaharmahal_shop_front/features/feature_repair_shop/data/repository/repair_shop_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/feature_repair_shop/data/repository/repairman_payment_type_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/feature_repair_shop/domain/repository/repair_shop_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_repair_shop/domain/repository/repairman_payment_type_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_repair_shop/presentation/bloc/repair_shop_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_repair_shop/presentation/bloc/repairman_payment_type_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_upload_file/data/data_source/remote/api_provider.dart';
import 'package:chaharmahal_shop_front/features/feature_upload_file/data/repository/upload_file_repositoryImpl.dart';
import 'package:chaharmahal_shop_front/features/feature_upload_file/domain/repository/upload_file_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_upload_file/presentation/bloc/upload_file_bloc.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_banner/domain/repository/banner_repository.dart';

void setupServicesLocator(GetIt locator) {
  final apiService = locator<GenericApiService>();

  // Data Sources
  locator.registerLazySingleton<UploadFileApiProvider>(() => UploadFileApiProvider());
  locator.registerLazySingleton<DashboardApiProvider>(() => DashboardApiProvider(apiService));
  locator.registerLazySingleton<OrdersApiProvider>(() => OrdersApiProvider(apiService));
  locator.registerLazySingleton<AppointmentsApiProvider>(() => AppointmentsApiProvider(apiService));
  locator.registerLazySingleton<RemindersApiProvider>(() => RemindersApiProvider(apiService));
  locator.registerLazySingleton<ClientServicesApiProvider>(() => ClientServicesApiProvider(apiService));
  locator.registerLazySingleton<RepairShopApiProvider>(() => RepairShopApiProvider(apiService));
  locator.registerLazySingleton<ProfileApiProvider>(() => ProfileApiProvider(apiService));
  locator.registerLazySingleton<CreateTimeSlotApiProvider>(() => CreateTimeSlotApiProvider(apiService));
  locator.registerLazySingleton<RepairmanPaymentTypeApiProvider>(() => RepairmanPaymentTypeApiProvider(apiService));

  // Repositories
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
  locator.registerLazySingleton<ClientServicesRepository>(
    () => ClientServicesRepositoryImpl(locator<ClientServicesApiProvider>()),
  );
  locator.registerLazySingleton<RepairShopRepository>(
    () => RepairShopRepositoryImpl(locator<RepairShopApiProvider>()),
  );
  locator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(locator<ProfileApiProvider>()),
  );
  locator.registerLazySingleton<CreateTimeSlotRepository>(
    () => CreateTimeSlotRepositoryImpl(locator<CreateTimeSlotApiProvider>()),
  );
  locator.registerLazySingleton<RepairmanPaymentTypeRepository>(
    () => RepairmanPaymentTypeRepositoryImpl(locator<RepairmanPaymentTypeApiProvider>()),
  );

  // Blocs
  locator.registerFactory(() => UploadFileBloc(locator<UploadFileRepository>()));
  locator.registerFactory(() => DashboardBloc(locator<DashboardRepository>(), locator<BannerRepository>()));
  locator.registerFactory(() => OrdersBloc(locator<OrdersRepository>()));
  locator.registerFactory(() => AppointmentsBloc(locator<AppointmentsRepository>(), locator<WidgetInfiniteListBloc>()));
  locator.registerFactory(() => RemindersBloc(locator<RemindersRepository>(), locator<ManageServicesRepository>(), locator<WidgetInfiniteListBloc>()));
  locator.registerFactory(() => ClientServicesBloc(locator<ClientServicesRepository>()));
  locator.registerFactory(() => TopRepairShopsBloc(locator<ClientServicesRepository>()));
  locator.registerFactory(() => RepairShopBloc(locator<RepairShopRepository>()));
  locator.registerFactory(() => ProfileBloc(locator<ProfileRepository>()));
  locator.registerFactory(() => CreateTimeSlotBloc(locator<CreateTimeSlotRepository>()));
  locator.registerFactory(() => RepairmanPaymentTypeBloc(locator<RepairmanPaymentTypeRepository>()));
}
