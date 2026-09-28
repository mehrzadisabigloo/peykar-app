import 'package:dio/dio.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../domain/entity/manage_rating_entity.dart';
import '../../domain/repository/manage_rating_repository.dart';
import '../data_source/remote/manage_rating_api_provider.dart';
import '../model/manage_rating_list_model.dart';

class ManageRatingRepositoryImpl extends ManageRatingRepository {
  final ManageRatingApiProvider _apiProvider;
  ManageRatingRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<ManageRatingListEntity>> fetchRatings({
    String? status,
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      final response = await _apiProvider.getRatings(
        status: status,
        page: page,
        perPage: perPage,
      );

      if (response is Response && response.statusCode == 200) {
        final body = response.data;
        if (body['success'] == true) {
          final model = ManageRatingListModel.fromJson(body['data']);
          return DataSuccess(model.toEntity());
        }
        return DataFailed(body['message'] ?? "خطا در دریافت لیست امتیازها");
      }
      return DataFailed(response?.data['message'] ?? "خطا در دریافت لیست امتیازها");
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<String>> changeRatingStatus(String ratingId) async {
    try {
      final response = await _apiProvider.changeRatingStatus(ratingId);
      if (response is Response && response.statusCode == 200) {
        final body = response.data;
        if (body['success'] == true) {
          return DataSuccess(body['message'] ?? "وضعیت امتیاز با موفقیت تغییر یافت");
        }
        return DataFailed(body['message'] ?? "خطا در تغییر وضعیت امتیاز");
      }
      return DataFailed(response?.data['message'] ?? "خطا در تغییر وضعیت امتیاز");
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
