import '../../../../core/resources/data_state.dart';
import '../entity/manage_services_entity.dart';

abstract class ManageServicesRepository {
  Future<DataState<List<ManageServicesEntity>>> fetchManageServicesData();

  Future<DataState<dynamic>> addService({
    required String title,
    required String description,
    required List<String> images,
    required List<String> keywords,
    required double priceMin,
    required double priceMax,
  });

  Future<DataState<ManageServicesEntity>> fetchServiceById(String serviceId);
}
