import 'package:equatable/equatable.dart';
import '../../../panel_admin_features/feature_manage_addresses/data/model/address_model.dart';
import '../../../panel_admin_features/feature_manage_payment_types/data/model/payment_type_model.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();
  @override
  List<Object?> get props => [];
}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final List<AddressModel> addresses;
  final Map<String, String> selectedAddressIds; // shopId -> addressId
  final Map<String, List<PaymentTypeModel>> shopPaymentMethods; // shopId -> available methods
  final Map<String, int> selectedPaymentMethods; // shopId -> selected methodId
  final Map<String, String> shopDiscountCodes; // shopId -> code
  final Map<String, dynamic> shopDiscountDatas; // shopId -> data
  final bool isSubmitting;
  final String? successMessage;
  final String? errorMessage;

  const CheckoutLoaded({
    required this.addresses,
    required this.selectedAddressIds,
    required this.shopPaymentMethods,
    required this.selectedPaymentMethods,
    required this.shopDiscountCodes,
    required this.shopDiscountDatas,
    this.isSubmitting = false,
    this.successMessage,
    this.errorMessage,
  });

  CheckoutLoaded copyWith({
    List<AddressModel>? addresses,
    Map<String, String>? selectedAddressIds,
    Map<String, List<PaymentTypeModel>>? shopPaymentMethods,
    Map<String, int>? selectedPaymentMethods,
    Map<String, String>? shopDiscountCodes,
    Map<String, dynamic>? shopDiscountDatas,
    bool? isSubmitting,
    String? successMessage,
    String? errorMessage,
    bool clearMessages = false,
  }) {
    return CheckoutLoaded(
      addresses: addresses ?? this.addresses,
      selectedAddressIds: selectedAddressIds ?? this.selectedAddressIds,
      shopPaymentMethods: shopPaymentMethods ?? this.shopPaymentMethods,
      selectedPaymentMethods: selectedPaymentMethods ?? this.selectedPaymentMethods,
      shopDiscountCodes: shopDiscountCodes ?? this.shopDiscountCodes,
      shopDiscountDatas: shopDiscountDatas ?? this.shopDiscountDatas,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      successMessage: clearMessages ? null : (successMessage ?? this.successMessage),
      errorMessage: clearMessages ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [
        addresses,
        selectedAddressIds,
        shopPaymentMethods,
        selectedPaymentMethods,
        shopDiscountCodes,
        shopDiscountDatas,
        isSubmitting,
        successMessage,
        errorMessage,
      ];
}

class CheckoutError extends CheckoutState {
  final String message;
  const CheckoutError(this.message);
  @override
  List<Object?> get props => [message];
}
