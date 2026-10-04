import 'package:get_it/get_it.dart';
import 'package:chaharmahal_shop_front/core/bloc/widget_infinite_list/widget_infinite_list_bloc.dart';
import 'package:chaharmahal_shop_front/core/services/generic_api_service.dart';
import 'package:chaharmahal_shop_front/features/feature_manage_products/data/data_source/remote/manage_products_api_provider.dart';
import 'package:chaharmahal_shop_front/features/feature_manage_products/data/repository/manage_products_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/feature_manage_products/domain/repository/manage_products_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_manage_products/presentation/bloc/add_product/add_product_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_manage_products/presentation/bloc/manage_products_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_manage_products/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_manage_services/data/data_source/remote/manage_services_api_provider.dart';
import 'package:chaharmahal_shop_front/features/feature_manage_services/data/repository/manage_services_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/feature_manage_services/domain/repository/manage_services_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_manage_services/presentation/bloc/add_service/add_service_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_manage_services/presentation/bloc/manage_services_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_manage_services/presentation/bloc/service_detail/service_detail_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_repair_shop/domain/repository/repairman_payment_type_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_shop/data/data_source/remote/shop_api_provider.dart';
import 'package:chaharmahal_shop_front/features/feature_shop/data/repository/shop_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/feature_shop/domain/repository/shop_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_shop/presentation/bloc/shop_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_shop_basket/data/data_source/remote/shop_basket_api_provider.dart';
import 'package:chaharmahal_shop_front/features/feature_shop_basket/data/repository/checkout_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/feature_shop_basket/data/repository/shop_basket_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/feature_shop_basket/domain/repository/checkout_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_shop_basket/domain/repository/shop_basket_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_shop_basket/presentation/bloc/checkout_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_shop_basket/presentation/bloc/shop_basket_bloc.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_banner/domain/repository/banner_repository.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_manage_addresses/domain/repository/manage_addresses_repository.dart';

void setupShopLocator(GetIt locator) {
  final apiService = locator<GenericApiService>();

  // Data Sources
  locator.registerLazySingleton<ManageProductsApiProvider>(() => ManageProductsApiProvider(apiService));
  locator.registerLazySingleton<ManageServicesApiProvider>(() => ManageServicesApiProvider(apiService));
  locator.registerLazySingleton<ShopBasketApiProvider>(() => ShopBasketApiProvider(apiService));
  locator.registerLazySingleton<ShopApiProvider>(() => ShopApiProvider(apiService));

  // Repositories
  locator.registerLazySingleton<ManageProductsRepository>(
    () => ManageProductsRepositoryImpl(locator<ManageProductsApiProvider>()),
  );
  locator.registerLazySingleton<ManageServicesRepository>(
    () => ManageServicesRepositoryImpl(locator<ManageServicesApiProvider>()),
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

  // Blocs
  locator.registerFactory(() => ManageProductsBloc(locator<ManageProductsRepository>()));
  locator.registerFactory(() => AddProductBloc(locator<ManageProductsRepository>()));
  locator.registerFactory(() => ProductDetailBloc(locator<ManageProductsRepository>()));
  locator.registerFactory(() => ManageServicesBloc(locator<ManageServicesRepository>()));
  locator.registerFactory(() => AddServiceBloc(locator<ManageServicesRepository>()));
  locator.registerFactory(() => ServiceDetailBloc(locator<ManageServicesRepository>()));
  locator.registerFactory(() => ShopBasketBloc(locator<ShopBasketRepository>()));
  locator.registerFactory(() => CheckoutBloc(
        locator<CheckoutRepository>(),
        locator<ManageAddressesRepository>(),
        locator<RepairmanPaymentTypeRepository>(),
      ));
  locator.registerFactory(() => ShopBloc(locator<ShopRepository>(), locator<BannerRepository>(), locator<WidgetInfiniteListBloc>()));
}
