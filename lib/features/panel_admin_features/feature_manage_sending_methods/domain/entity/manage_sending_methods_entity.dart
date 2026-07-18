import '../../data/model/sending_method_model.dart';

class ManageSendingMethodsEntity {
  bool? success;
  String? message;
  List<SendingMethodModel>? sendingMethods;

  ManageSendingMethodsEntity({this.success, this.message, this.sendingMethods});

  ManageSendingMethodsEntity.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    sendingMethods = <SendingMethodModel>[];
    if (json['data'] != null) {
      if (json['data'] is List) {
        for (var v in json['data']) {
          sendingMethods!.add(SendingMethodModel.fromJson(v));
        }
      } else if (json['data'] is Map && json['data']['data'] is List) {
        for (var v in json['data']['data']) {
          sendingMethods!.add(SendingMethodModel.fromJson(v));
        }
      }
    }
  }
}
