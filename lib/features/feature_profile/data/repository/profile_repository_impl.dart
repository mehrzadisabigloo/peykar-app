import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';
import '../../../feature_appointments/data/model/reservation_model.dart';
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
        final data = response.data['data'];
        
        // Handle new nested structure
        final userData = data['user'] ?? data; // Fallback to flat structure if needed
        final profileModel = ProfileModel.fromJson(userData);
        
        PendingFeedbackEntity? pendingFeedback;
        if (data['pending_feedback'] != null) {
          final feedbackModel = PendingFeedbackModel.fromJson(data['pending_feedback']);
          final timeSlot = feedbackModel.reservation?.timeSlot;
          final repairman = timeSlot?.repairman;
          
          pendingFeedback = PendingFeedbackEntity(
            repairmanId: feedbackModel.repairmanId ?? '',
            shopName: repairman?.brand ?? 'تعمیرگاه',
            repairmanName: repairman != null ? '${repairman.firstName} ${repairman.lastName}' : null,
            repairmanImageId: repairman?.profileImageId,
            date: timeSlot?.jalaliDate ?? feedbackModel.reservationDate,
            time: timeSlot != null ? '${timeSlot.startTime.substring(0, 5)} - ${timeSlot.endTime.substring(0, 5)}' : null,
            feedbackNotifiedAt: feedbackModel.reservation?.feedbackNotifiedAt,
          );
        }

        return DataSuccess(profileModel.toEntity().copyWith(
          pendingFeedback: pendingFeedback,
        ));
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
