class UserEntity {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? mobile;
  final String? role;
  final String? status;
  final String? brand;
  final String? ostan;
  final String? shahrestan;
  final String? address;
  final String? profileImageId;
  final double? ratingAverage;
  final int? ratingsCount;

  const UserEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.mobile,
    this.role,
    this.status,
    this.brand,
    this.ostan,
    this.shahrestan,
    this.address,
    this.profileImageId,
    this.ratingAverage,
    this.ratingsCount,
  });

  String get fullName {
    final parts = [firstName, lastName].where((p) => p != null && p.isNotEmpty);
    return parts.isEmpty ? '—' : parts.join(' ');
  }

  String get displayName {
    if (brand != null && brand!.isNotEmpty) return brand!;
    return fullName;
  }
}
