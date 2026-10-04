import 'package:get_it/get_it.dart';
import 'package:chaharmahal_shop_front/core/bloc/widget_infinite_list/widget_infinite_list_bloc.dart';
import 'package:chaharmahal_shop_front/core/services/generic_api_service.dart';
import 'package:chaharmahal_shop_front/core/services/jwt_decoder.dart';
import 'package:chaharmahal_shop_front/features/feature_home/data/data_source/remote/home_api_provider.dart';
import 'package:chaharmahal_shop_front/features/feature_home/data/repository/home_repository_impl.dart';
import 'package:chaharmahal_shop_front/features/feature_home/domain/repository/home_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_home/presentation/bloc/home_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_home/presentation/bloc/main_home_page_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_home/presentation/bloc/users_bloc.dart';
import 'package:chaharmahal_shop_front/features/feature_profile/domain/repository/profile_repository.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_banner/domain/repository/banner_repository.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_occupation/domain/repository/occupation_repository.dart';

void setupHomeLocator(GetIt locator) {
  final apiService = locator<GenericApiService>();

  locator.registerLazySingleton<HomeApiProvider>(() => HomeApiProvider(apiService));
  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(locator<HomeApiProvider>()),
  );

  locator.registerFactory(
    () => UsersBloc(locator<HomeRepository>() as HomeRepositoryImpl, locator<WidgetInfiniteListBloc>()),
  );
  locator.registerFactory(
    () => MainHomePageBloc(locator<JwtDecoder>(), locator<ProfileRepository>()),
  );
  locator.registerFactory(
    () => HomeBloc(locator<OccupationRepository>(), locator<BannerRepository>(), locator<WidgetInfiniteListBloc>()),
  );
}
