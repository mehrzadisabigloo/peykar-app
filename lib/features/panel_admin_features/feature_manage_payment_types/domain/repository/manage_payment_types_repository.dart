import '../../../../../core/resources/data_state.dart';
import '../entity/payment_type_entity.dart';

abstract class ManagePaymentTypesRepository {
  Future<DataState<List<PaymentTypeEntity>>> fetchPaymentTypes(Map<String, dynamic> params);
  Future<DataState<dynamic>> changePaymentTypeStatus(int id);
}
