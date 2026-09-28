import '../../../../../core/resources/data_state.dart';
import '../entity/manage_service_entity.dart';

abstract class ManageServiceRepository {
  Future<DataState<List<ManageServiceEntity>>> listServices({
    bool isPaginate = true,
    int countItem = 10,
    String? title,
    String? repairmanId,
  });

  Future<DataState<dynamic>> addServiceByAdmin({
    required String repairmanId,
    required String title,
    required String description,
    required List<String> images,
    required List<String> keywords,
    required double priceMin,
    required double priceMax,
  });

  Future<DataState<dynamic>> editService({
    required String serviceId,
    required String title,
    required String description,
    required List<String> images,
    required List<String> keywords,
    required double priceMin,
    required double priceMax,
  });

  Future<DataState<dynamic>> changeStatus({
    required String serviceId,
    required String status,
  });

  Future<DataState<dynamic>> deleteService(String serviceId);

  Future<DataState<ManageServiceEntity>> getServiceById(String serviceId);
}
