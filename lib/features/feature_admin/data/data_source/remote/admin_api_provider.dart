import '../../../../../core/services/generic_api_service.dart';

class AdminApiProvider {
  final GenericApiService _genericApiService;

  AdminApiProvider(this._genericApiService);

  Future<dynamic> getAdminData() async {
    throw UnimplementedError();
  }
}
