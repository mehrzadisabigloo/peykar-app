import '../../../../../core/resources/data_state.dart';
import '../entity/manage_addresses_entity.dart';
import '../../data/model/address_model.dart';

abstract class ManageAddressesRepository {
  Future<DataState<ManageAddressesEntity>> listAddresses();
  Future<DataState<bool>> addAddress(AddressModel address);
  Future<DataState<bool>> editAddress(String id, AddressModel address);
  Future<DataState<bool>> deleteAddress(String id);
  Future<DataState<AddressModel>> getAddress(String id);
}
