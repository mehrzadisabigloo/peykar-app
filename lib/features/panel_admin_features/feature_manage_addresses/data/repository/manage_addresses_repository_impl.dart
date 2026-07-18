import '../../../../../core/resources/data_state.dart';
import '../../domain/entity/manage_addresses_entity.dart';
import '../../domain/repository/manage_addresses_repository.dart';
import '../data_source/remote/manage_addresses_api_provider.dart';
import '../model/address_model.dart';

class ManageAddressesRepositoryImpl extends ManageAddressesRepository {
  final ManageAddressesApiProvider _apiProvider;
  ManageAddressesRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<ManageAddressesEntity>> listAddresses() async {
    try {
      final response = await _apiProvider.listAddresses();
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          return DataSuccess(ManageAddressesEntity.fromJson(response.data));
        } else {
          return DataFailed(response.data['message'] ?? "خطا در دریافت لیست آدرس‌ها");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> addAddress(AddressModel address) async {
    try {
      final response = await _apiProvider.addAddress(address.toJson());
      if (response.statusCode == 201 || response.statusCode == 200) {
        if (response.data['success'] == true) {
          return DataSuccess(true);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در ثبت آدرس");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> editAddress(String id, AddressModel address) async {
    try {
      final response = await _apiProvider.editAddress(id, address.toJson());
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          return DataSuccess(true);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در ویرایش آدرس");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> deleteAddress(String id) async {
    try {
      final response = await _apiProvider.deleteAddress(id);
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          return DataSuccess(true);
        } else {
          return DataFailed(response.data['message'] ?? "خطا در حذف آدرس");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<AddressModel>> getAddress(String id) async {
    try {
      final response = await _apiProvider.getAddress(id);
      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          return DataSuccess(AddressModel.fromJson(response.data['data']));
        } else {
          return DataFailed(response.data['message'] ?? "خطا در دریافت اطلاعات آدرس");
        }
      } else {
        return DataFailed("خطای سرور: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
