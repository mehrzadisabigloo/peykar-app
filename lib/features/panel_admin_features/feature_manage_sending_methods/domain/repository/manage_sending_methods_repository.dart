import '../../../../../core/resources/data_state.dart';
import '../../data/model/sending_method_model.dart';
import '../entity/manage_sending_methods_entity.dart';

abstract class ManageSendingMethodsRepository {
  Future<DataState<ManageSendingMethodsEntity>> listSendingMethods();
  Future<DataState<bool>> addSendingMethod(SendingMethodModel method);
  Future<DataState<bool>> updateSendingMethod(String id, SendingMethodModel method);
  Future<DataState<SendingMethodModel>> getSendingMethod(String id);
  Future<DataState<bool>> deleteSendingMethod(String id);
  Future<DataState<bool>> changeStatus(String id);
}
