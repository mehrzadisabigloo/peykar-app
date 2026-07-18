class ProfileEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String mobile;
  final String? email;
  final String role;
  final String? birthday;
  final String? profileImageId;
  final String? subscriptionCode;
  final String? status;

  ProfileEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    this.email,
    required this.role,
    this.birthday,
    this.profileImageId,
    this.subscriptionCode,
    this.status,
  });

  String get fullName => '$firstName $lastName';
}
