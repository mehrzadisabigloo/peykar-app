class RepairmanEntity {
  final String id;
  final String? firstName;
  final String? lastName;
  final String? mobile;
  final String? email;
  final List<String>? role;
  final String? birthday;
  final String? profileImageId;
  final String? ostan;
  final String? shahrestan;
  final String? brand;
  final List<String>? identityImages;
  final List<String>? businessLicenseImage;
  final List<String>? phoneNumbers;
  final LocationEntity? location;
  final List<String>? shopImages;
  final String? subscriptionCode;
  final String? referralCode;
  final String? occupationId;
  final String? status;
  final int? referralCount;
  final bool? hasProduct;
  final bool? hasService;

  RepairmanEntity({
    required this.id,
    this.firstName,
    this.lastName,
    this.mobile,
    this.email,
    this.role,
    this.birthday,
    this.profileImageId,
    this.ostan,
    this.shahrestan,
    this.brand,
    this.identityImages,
    this.businessLicenseImage,
    this.phoneNumbers,
    this.location,
    this.shopImages,
    this.subscriptionCode,
    this.referralCode,
    this.occupationId,
    this.status,
    this.referralCount,
    this.hasProduct,
    this.hasService,
  });

  String get fullName => '${firstName ?? ''} ${lastName ?? ''}'.trim();
}

class LocationEntity {
  final double lat;
  final double lng;

  LocationEntity({
    required this.lat,
    required this.lng,
  });
}
