import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/services/generic_api_service.dart';
import '../../domain/repository/checkout_repository.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  final GenericApiService _apiService = GenericApiService();

  @override
  Future<DataState<bool>> submitOrder({
    required String addressId,
    String? discountCode,
    required Map<String, int> shopPaymentMethods,
  }) async {
    try {
      final body = {
        "address_id": addressId,
        if (discountCode != null) "discount_code": discountCode,
        "shop_payments": shopPaymentMethods.entries.map((e) => {
          "repairman_id": e.key,
          "payment_type_id": e.value,
        }).toList(),
      };
      
      final response = await _apiService.post("/order/store", body);
      
      if (response is Response && response.statusCode == 200) {
        if (response.data['success'] == true) {
          return const DataSuccess(true);
        }
        return DataFailed(response.data['message'] ?? "خطا در ثبت سفارش");
      }
      return const DataFailed("خطا در ثبت سفارش");
    } catch (e) {
      return const DataFailed("خطایی رخ داد");
    }
  }

  @override
  Future<DataState<dynamic>> checkDiscount(String code) async {
    try {
      final response = await _apiService.post("/discount-code/check", {"code": code});
      if (response is Response && response.statusCode == 200) {
        if (response.data['success'] == true) {
          return DataSuccess(response.data['data']);
        }
        return DataFailed(response.data['message'] ?? "کد تخفیف معتبر نیست");
      }
      return const DataFailed("خطا در بررسی کد تخفیف");
    } catch (e) {
      return const DataFailed("خطایی رخ داد");
    }
  }
}
