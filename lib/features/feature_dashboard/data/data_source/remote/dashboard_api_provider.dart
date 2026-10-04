import '../../../../../core/services/generic_api_service.dart';

class DashboardApiProvider {
  final GenericApiService _genericApiService;

  DashboardApiProvider(this._genericApiService);

  Future<dynamic> getDashboardData() async {
    throw UnimplementedError();
  }
}
