import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
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
  final int productsCount;
  final int servicesCount;
  final int ordersCount;
  final String? brand;
  final String? address;
  final bool hasProduct;
  final bool hasService;
  final double? lat;
  final double? lng;
  final PendingFeedbackEntity? pendingFeedback;

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
    this.productsCount = 0,
    this.servicesCount = 0,
    this.ordersCount = 0,
    this.brand,
    this.address,
    this.hasProduct = false,
    this.hasService = false,
    this.lat,
    this.lng,
    this.pendingFeedback,
  });

  String get fullName => '$firstName $lastName';

  ProfileEntity copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? mobile,
    String? email,
    String? role,
    String? birthday,
    String? profileImageId,
    String? subscriptionCode,
    String? status,
    int? productsCount,
    int? servicesCount,
    int? ordersCount,
    String? brand,
    String? address,
    bool? hasProduct,
    bool? hasService,
    double? lat,
    double? lng,
    PendingFeedbackEntity? pendingFeedback,
  }) {
    return ProfileEntity(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      role: role ?? this.role,
      birthday: birthday ?? this.birthday,
      profileImageId: profileImageId ?? this.profileImageId,
      subscriptionCode: subscriptionCode ?? this.subscriptionCode,
      status: status ?? this.status,
      productsCount: productsCount ?? this.productsCount,
      servicesCount: servicesCount ?? this.servicesCount,
      ordersCount: ordersCount ?? this.ordersCount,
      brand: brand ?? this.brand,
      address: address ?? this.address,
      hasProduct: hasProduct ?? this.hasProduct,
      hasService: hasService ?? this.hasService,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      pendingFeedback: pendingFeedback ?? this.pendingFeedback,
    );
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        mobile,
        email,
        role,
        birthday,
        profileImageId,
        subscriptionCode,
        status,
        productsCount,
        servicesCount,
        ordersCount,
        brand,
        address,
        hasProduct,
        hasService,
        lat,
        lng,
        pendingFeedback,
      ];
}

class PendingFeedbackEntity extends Equatable {
  final String repairmanId;
  final String shopName;
  final String? repairmanName;
  final String? repairmanImageId;
  final String? date;
  final String? time;
  final String? feedbackNotifiedAt;

  PendingFeedbackEntity({
    required this.repairmanId, 
    required this.shopName,
    this.repairmanName,
    this.repairmanImageId,
    this.date,
    this.time,
    this.feedbackNotifiedAt,
  });

  @override
  List<Object?> get props => [repairmanId, shopName, repairmanName, repairmanImageId, date, time, feedbackNotifiedAt];
}
