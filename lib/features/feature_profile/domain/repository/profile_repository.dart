import '../../../../core/resources/data_state.dart';
import '../entity/profile_entity.dart';

abstract class ProfileRepository {
  Future<DataState<ProfileEntity>> fetchProfileData();
  Future<DataState<String>> updateProfileData(ProfileEntity profile);
}
