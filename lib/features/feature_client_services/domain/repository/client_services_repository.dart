import '../../../../core/resources/data_state.dart';
import '../../../feature_home/domain/entity/user_entity.dart';
import '../entity/client_services_entity.dart';

abstract class ClientServicesRepository {
  Future<DataState<ClientServicesEntity>> fetchClientServicesData();
  Future<DataState<List<UserEntity>>> fetchTopRepairShops({int page = 1, int countItem = 10});
}
