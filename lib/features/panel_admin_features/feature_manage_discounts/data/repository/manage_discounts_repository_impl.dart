import '../../../../../core/resources/data_state.dart';
import '../../domain/entity/manage_discounts_entity.dart';
import '../../domain/repository/manage_discounts_repository.dart';
import '../data_source/remote/manage_discounts_api_provider.dart';
import '../model/discount_model.dart';

class ManageDiscountsRepositoryImpl extends ManageDiscountsRepository {
  final ManageDiscountsApiProvider _apiProvider;
  ManageDiscountsRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<ManageDiscountsEntity>> listDiscounts() async {
    try {
      final response = await _apiProvider.listDiscounts();
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          return DataSuccess(ManageDiscountsEntity.fromJson(response.data));
        } else {
          return DataFailed(response.data['message'] ?? "خطا در دریافت لیست کدهای تخفیف");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> addDiscount(DiscountModel discount) async {
    try {
      final response = await _apiProvider.addDiscount(discount.toJson());
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          return DataSuccess(true);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در ایجاد کد تخفیف");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<DiscountModel>> getDiscount(String id) async {
    try {
      final response = await _apiProvider.getDiscount(id);
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          return DataSuccess(DiscountModel.fromJson(response.data['data']));
        } else {
          return DataFailed(response.data['message'] ?? "خطا در دریافت اطلاعات کد تخفیف");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> deleteDiscount(String id) async {
    try {
      final response = await _apiProvider.deleteDiscount(id);
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          return DataSuccess(true);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در حذف کد تخفیف");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> changeStatus(String id) async {
    try {
      final response = await _apiProvider.changeStatus(id);
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          return DataSuccess(true);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در تغییر وضعیت کد تخفیف");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
