class ShopSettingModel {
  final String? key;
  final String? label;
  final String? status;
  final bool? isActive;

  ShopSettingModel({
    this.key,
    this.label,
    this.status,
    this.isActive,
  });

  factory ShopSettingModel.fromJson(Map<String, dynamic> json) {
    return ShopSettingModel(
      key: json['key'] as String?,
      label: json['label'] as String?,
      status: json['status'] as String?,
      isActive: json['is_active'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'label': label,
      'status': status,
      'is_active': isActive,
    };
  }
}
