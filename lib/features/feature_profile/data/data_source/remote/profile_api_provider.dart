
import '../../../../../core/services/generic_api_service.dart';

class ProfileApiProvider {
  final GenericApiService _genericApiService = GenericApiService();

  Future<dynamic> getProfileData() async {
    return await _genericApiService.get("/auth/me");
  }

  Future<dynamic> updateProfileData(Map<String, dynamic> params) async {
    return await _genericApiService.put("/auth/update/user/data", params);
  }
}
