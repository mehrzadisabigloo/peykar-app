import 'package:dio/dio.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/entity/users_filter_params.dart';
import '../../domain/entity/users_list_entity.dart';
import '../../domain/repository/home_repository.dart';
import '../data_source/remote/home_api_provider.dart';
import '../model/users_list_model.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeApiProvider _apiProvider;

  HomeRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<UsersListEntity>> fetchActiveUsers(UsersFilterParams params) async {
    try {
      final Response response = await _apiProvider.fetchActiveUsers(params);
      if (response.statusCode == 200) {
        final UsersListEntity usersList = UsersListModel.fromJson(Map<String, dynamic>.from(response.data)).toEntity();
        return DataSuccess(usersList);
      } else {
        return DataFailed(response.data['message'] ?? "خطایی رخ داد");
      }
    } catch (e) {
      return const DataFailed('پاسخی دریافت نشد');
    }
  }
}
