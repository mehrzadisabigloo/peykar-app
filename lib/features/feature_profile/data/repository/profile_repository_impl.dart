import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entity/profile_entity.dart';
import '../../domain/repository/profile_repository.dart';
import '../data_source/remote/profile_api_provider.dart';
import '../model/profile_model.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileApiProvider _apiProvider;
  ProfileRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<ProfileEntity>> fetchProfileData() async {
    try {
      final Response response = await _apiProvider.getProfileData();
      if (response.statusCode == 200) {
        final profileModel = ProfileModel.fromJson(response.data['data']);
        print('/////');
        print(profileModel);
        return DataSuccess(profileModel.toEntity());
      } else {
        return DataFailed(response.data['message'] ?? "Error fetching profile");
      }
    } catch (e) {
      return DataFailed('پاسخی دریافت نشد');
    }
  }

  @override
  Future<DataState<String>> updateProfileData(ProfileEntity profile) async {
    try {
      final profileModel = ProfileModel.fromEntity(profile);
      
      final Response response = await _apiProvider.updateProfileData(profileModel.toJson());
      if (response.statusCode == 200) {
        return DataSuccess(response.data['message'] ?? "Profile updated successfully");
      } else {
        return DataFailed(response.data['message'] ?? "Error updating profile");
      }
    } catch (e) {
      return DataFailed('پاسخی دریافت نشد');
    }
  }
}
