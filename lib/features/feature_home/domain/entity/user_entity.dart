class UserEntity {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? mobile;
  final String? role;
  final String? status;
  final String? brand;

  const UserEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.mobile,
    this.role,
    this.status,
    this.brand,
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
