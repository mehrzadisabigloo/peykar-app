import '../../data/model/discount_model.dart';

class ManageDiscountsEntity {
  bool? success;
  String? message;
  List<DiscountModel>? discounts;

  ManageDiscountsEntity({this.success, this.message, this.discounts});

  ManageDiscountsEntity.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    
    discounts = <DiscountModel>[];
    if (json['data'] != null) {
      if (json['data'] is List) {
        for (var v in json['data']) {
          discounts!.add(DiscountModel.fromJson(v));
        }
      } else if (json['data'] is Map && json['data']['data'] is List) {
        // Handle paginated response
        for (var v in json['data']['data']) {
          discounts!.add(DiscountModel.fromJson(v));
        }
      }
    }
  }
}
