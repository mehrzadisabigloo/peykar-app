import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../panel_admin_features/feature_manage_payment_types/data/model/payment_type_model.dart';

part 'repairman_payment_type_model.freezed.dart';
part 'repairman_payment_type_model.g.dart';

String _anyToString(dynamic value) => value?.toString() ?? '';
int _anyToInt(dynamic value) => (value is num) ? value.toInt() : (int.tryParse(value?.toString() ?? '0') ?? 0);

@freezed
sealed class RepairmanPaymentTypeModel with _$RepairmanPaymentTypeModel {
  const factory RepairmanPaymentTypeModel({
    @JsonKey(fromJson: _anyToInt) int? id,
    @JsonKey(name: 'repairman_id', fromJson: _anyToString) String? repairmanId,
    @JsonKey(name: 'admin_id', fromJson: _anyToString) String? adminId,
    @JsonKey(name: 'payment_type_id', fromJson: _anyToInt) int? paymentTypeId,
    @JsonKey(name: 'payment_type') PaymentTypeModel? paymentType,
  }) = _RepairmanPaymentTypeModel;

  factory RepairmanPaymentTypeModel.fromJson(Map<String, dynamic> json) =>
      _$RepairmanPaymentTypeModelFromJson(json);
}
