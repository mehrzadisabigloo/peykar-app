import '../../../../core/resources/data_state.dart';
import '../../data/model/time_slot_model.dart';

abstract class CreateTimeSlotRepository {
  Future<DataState<Map<String, dynamic>>> createTimeSlots({
    required String date,
    required List<Map<String, dynamic>> timeSlots,
  });

  Future<DataState<bool>> deleteTimeSlot(String timeSlotId);

  Future<DataState<Map<String, dynamic>>> getRepairmanTimeSlots({
    String? date,
    String? status,
    bool isPaginate = true,
    int countItem = 15,
    int page = 1,
  });

  Future<DataState<bool>> deactivateDay(String date);
  Future<DataState<bool>> activateDay(String date);
}
