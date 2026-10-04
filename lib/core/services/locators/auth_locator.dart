import 'package:get_it/get_it.dart';
import 'package:chaharmahal_shop_front/core/services/generic_api_service.dart';
import 'package:chaharmahal_shop_front/features/feature_auth/data/data_source/remote/api_provider.dart';
import 'package:chaharmahal_shop_front/features/feature_auth/data/repository/auth_repositoryImpl.dart';
import 'package:chaharmahal_shop_front/features/feature_auth/domain/repository/auth_repository.dart';
import 'package:chaharmahal_shop_front/features/feature_auth/presentation/bloc/authentication_bloc.dart';
import 'package:chaharmahal_shop_front/features/panel_admin_features/feature_occupation/domain/repository/occupation_repository.dart';

void setupAuthLocator(GetIt locator) {
  locator.registerLazySingleton<AuthApiProvider>(
    () => AuthApiProvider(locator<GenericApiService>()),
  );
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(locator<AuthApiProvider>()),
  );
  locator.registerFactory(
    () => AuthenticationBloc(locator<AuthRepository>(), locator<OccupationRepository>()),
  );
}
