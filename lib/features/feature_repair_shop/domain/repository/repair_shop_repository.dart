import '../../../../core/resources/data_state.dart';
import '../entity/repair_shop_entity.dart';

abstract class RepairShopRepository {
  Future<DataState<RepairShopEntity>> fetchRepairShopData(String repairmanId);
}
