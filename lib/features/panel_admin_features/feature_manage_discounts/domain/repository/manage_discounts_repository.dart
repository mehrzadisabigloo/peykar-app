import '../../../../../core/resources/data_state.dart';
import '../../data/model/discount_model.dart';
import '../entity/manage_discounts_entity.dart';

abstract class ManageDiscountsRepository {
  Future<DataState<ManageDiscountsEntity>> listDiscounts();
  Future<DataState<bool>> addDiscount(DiscountModel discount);
  Future<DataState<DiscountModel>> getDiscount(String id);
  Future<DataState<bool>> deleteDiscount(String id);
  Future<DataState<bool>> changeStatus(String id);
}
