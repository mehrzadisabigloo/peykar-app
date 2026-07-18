import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';
import '../../../feature_home/data/model/users_list_model.dart';
import '../../../feature_home/domain/entity/user_entity.dart';
import '../../../feature_home/domain/entity/users_filter_params.dart';
import '../../domain/entity/client_services_entity.dart';
import '../../domain/repository/client_services_repository.dart';
import '../data_source/remote/client_services_api_provider.dart';

class ClientServicesRepositoryImpl extends ClientServicesRepository {
  final ClientServicesApiProvider _apiProvider;
  ClientServicesRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<ClientServicesEntity>> fetchClientServicesData() async {
    try {
      // 1. Fetch categories
      final categories = [
        ServiceCategory(id: '1', title: 'مکانیکی', iconPath: 'assets/icons/mechanic.png'),
        ServiceCategory(id: '2', title: 'سرویس دوره‌ای', iconPath: 'assets/icons/service.png'),
        ServiceCategory(id: '3', title: 'برق خودرو', iconPath: 'assets/icons/electric.png'),
        ServiceCategory(id: '4', title: 'صافکاری', iconPath: 'assets/icons/bodywork.png'),
        ServiceCategory(id: '5', title: 'بیشتر', iconPath: 'assets/icons/more.png'),
        ServiceCategory(id: '6', title: 'تنظیم موتور', iconPath: 'assets/icons/engine.png'),
        ServiceCategory(id: '7', title: 'کارواش', iconPath: 'assets/icons/carwash.png'),
        ServiceCategory(id: '8', title: 'جلوبندی', iconPath: 'assets/icons/suspension.png'),
      ];

      // 2. Fetch repairman list using the auth/users-active API
      const params = UsersFilterParams(
        isPaginate: true,
        countItem: 10,
        role: 'repairman',
        filter: 'latest',
      );

      final Response response = await _apiProvider.fetchActiveUsers(params);

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map && data['success'] == true) {
          final usersList = UsersListModel.fromApiResponse(Map<String, dynamic>.from(data)).toEntity();
          
          return DataSuccess(ClientServicesEntity(
            categories: categories,
            topRepairShops: usersList.users,
          ));
        } else {
          return DataFailed(data is Map ? data['message'] : "خطا در دریافت اطلاعات تعمیرکاران");
        }
      } else {
        return DataFailed("خطا در دریافت اطلاعات تعمیرکاران");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<List<UserEntity>>> fetchTopRepairShops({int page = 1, int countItem = 10}) async {
    try {
      final params = UsersFilterParams(
        isPaginate: true,
        countItem: countItem,
        page: page,
        role: 'repairman',
        filter: 'latest',
      );

      final Response response = await _apiProvider.fetchActiveUsers(params);

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map && data['success'] == true) {
          final usersList = UsersListModel.fromApiResponse(Map<String, dynamic>.from(data)).toEntity();
          return DataSuccess(usersList.users);
        } else {
          return DataFailed(data is Map ? data['message'] : "خطا در دریافت اطلاعات تعمیرکاران");
        }
      } else {
        return DataFailed("خطا در دریافت اطلاعات تعمیرکاران");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }
}
