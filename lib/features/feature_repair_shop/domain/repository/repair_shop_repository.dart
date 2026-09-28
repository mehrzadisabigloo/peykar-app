import '../../../../core/resources/data_state.dart';
import '../../../feature_create_time_slot/data/model/time_slot_model.dart';
import '../../../feature_appointments/domain/entity/appointments_entity.dart';
import '../../data/model/rating_model.dart';
import '../entity/repair_shop_entity.dart';

abstract class RepairShopRepository {
  Future<DataState<RepairShopEntity>> fetchRepairShopData(String repairmanId);
  Future<DataState<List<TimeSlotModel>>> fetchPublicTimeSlots(String repairmanId, {String? date});
  Future<DataState<Map<String, dynamic>>> reserveTimeSlot(String timeSlotId, String description);
  Future<DataState<List<AppointmentsEntity>>> fetchUserReservationsForRepairman(String repairmanId);
  Future<DataState<Map<String, dynamic>>> storeRating(String repairmanId, int score, String description);
  Future<DataState<List<RatingModel>>> fetchRepairmanRatings(String repairmanId, {int page = 1});
}
