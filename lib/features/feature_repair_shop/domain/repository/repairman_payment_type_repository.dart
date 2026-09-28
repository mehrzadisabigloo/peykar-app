import '../../../../core/resources/data_state.dart';
import '../../../panel_admin_features/feature_manage_payment_types/data/model/payment_type_model.dart';
import '../../data/model/repairman_payment_type_model.dart';

abstract class RepairmanPaymentTypeRepository {
  Future<DataState<RepairmanPaymentTypeModel>> addPaymentType(int paymentTypeId);
  Future<DataState<String>> removePaymentType(int paymentTypeId);
  Future<DataState<List<PaymentTypeModel>>> getMyPaymentTypes();
  Future<DataState<List<PaymentTypeModel>>> getRepairmanPaymentTypes(String repairmanId);
  Future<DataState<List<PaymentTypeModel>>> getAllActivePaymentTypes();
}
