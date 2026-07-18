import '../../data/model/address_model.dart';

class ManageAddressesEntity {
  bool? success;
  String? message;
  List<AddressModel>? addresses;

  ManageAddressesEntity({this.success, this.message, this.addresses});

  ManageAddressesEntity.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    
    addresses = <AddressModel>[];
    if (json['data'] != null) {
      if (json['data'] is List) {
        for (var v in json['data']) {
          addresses!.add(AddressModel.fromJson(v));
        }
      } else if (json['data'] is Map && json['data']['data'] is List) {
        // Handle paginated response where data is wrapped in another data key
        for (var v in json['data']['data']) {
          addresses!.add(AddressModel.fromJson(v));
        }
      }
    }
  }
}
