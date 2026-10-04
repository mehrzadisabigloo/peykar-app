enum UserRole {
  user('user'),
  repairman('repairman'),
  admin('admin');

  final String value;
  const UserRole(this.value);

  static UserRole fromString(String? role) {
    switch (role?.toLowerCase()) {
      case 'admin':
        return UserRole.admin;
      case 'repairman':
        return UserRole.repairman;
      case 'user':
      default:
        return UserRole.user;
    }
  }

  bool get isAdmin => this == UserRole.admin;
  bool get isRepairman => this == UserRole.repairman;
  bool get isUser => this == UserRole.user;

  @override
  String toString() => value;
}
