enum UserRole {
  user,
  repairman,
  admin,
}

extension UserRoleExtension on UserRole {
  String get value {
    switch (this) {
      case UserRole.user:
        return 'user';
      case UserRole.repairman:
        return 'repairman';
      case UserRole.admin:
        return 'admin';
    }
  }

  String get label {
    switch (this) {
      case UserRole.user:
        return 'کاربر عادی';
      case UserRole.repairman:
        return 'تعمیرکار';
      case UserRole.admin:
        return 'مدیر';
    }
  }
}
