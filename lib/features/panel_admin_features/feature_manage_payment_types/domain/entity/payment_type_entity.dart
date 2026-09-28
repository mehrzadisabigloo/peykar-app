class PaymentTypeEntity {
  final int? id;
  final String? title;
  final String? label;
  final String? type;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  const PaymentTypeEntity({
    this.id,
    this.title,
    this.label,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  bool get isActive => status?.toLowerCase() == 'active';
}
