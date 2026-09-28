import '../../../../core/resources/data_state.dart';

abstract class CheckoutRepository {
  Future<DataState<bool>> submitOrder({
    required String addressId,
    String? discountCode,
    required Map<String, int> shopPaymentMethods, // shopId -> paymentTypeId
  });

  Future<DataState<dynamic>> checkDiscount(String code);
}
