import 'package:bloc/bloc.dart';
import '../../../../core/bloc/base/base_bloc.dart';
import '../../../../core/resources/data_state.dart';
import '../../../panel_admin_features/feature_manage_addresses/domain/repository/manage_addresses_repository.dart';
import '../../../feature_repair_shop/domain/repository/repairman_payment_type_repository.dart';
import '../../domain/repository/checkout_repository.dart';
import '../../../panel_admin_features/feature_manage_addresses/data/model/address_model.dart';
import '../../../panel_admin_features/feature_manage_payment_types/data/model/payment_type_model.dart';
import '../../../panel_admin_features/feature_manage_addresses/domain/entity/manage_addresses_entity.dart';
import 'checkout_event.dart';
import 'checkout_state.dart';

class CheckoutBloc extends BaseBloc<CheckoutEvent, CheckoutState> {
  final CheckoutRepository _checkoutRepository;
  final ManageAddressesRepository _addressRepository;
  final RepairmanPaymentTypeRepository _paymentTypeRepository;

  CheckoutBloc(
    this._checkoutRepository,
    this._addressRepository,
    this._paymentTypeRepository,
  ) : super(CheckoutInitial()) {
    on<FetchCheckoutInitialDataEvent>(_onFetchInitialData);
    on<SelectAddressEvent>(_onSelectAddress);
    on<SelectShopPaymentMethodEvent>(_onSelectShopPaymentMethod);
    on<ApplyDiscountEvent>(_onApplyDiscount);
    on<SubmitShopOrderEvent>(_onSubmitShopOrder);
  }

  Future<void> _onFetchInitialData(FetchCheckoutInitialDataEvent event, Emitter<CheckoutState> emit) async {
    emit(CheckoutLoading());

    try {
      final results = await Future.wait([
        _addressRepository.listAddresses(),
        ...event.repairmanIds.map((id) => _paymentTypeRepository.getRepairmanPaymentTypes(id)),
      ]);

      final addressState = results[0] as DataState<ManageAddressesEntity>;
      if (addressState is DataFailed) {
        emit(CheckoutError(addressState.error ?? "خطا در دریافت آدرس‌ها"));
        return;
      }

      final addresses = addressState.data?.addresses ?? [];
      final shopPaymentMethods = <String, List<PaymentTypeModel>>{};
      final selectedPaymentMethods = <String, int>{};
      final selectedAddressIds = <String, String>{};
      final shopDiscountCodes = <String, String>{};
      final shopDiscountDatas = <String, dynamic>{};

      for (var i = 0; i < event.repairmanIds.length; i++) {
        final paymentState = results[i + 1] as DataState<List<PaymentTypeModel>>;
        final shopId = event.repairmanIds[i];
        if (paymentState is DataSuccess) {
          final methods = paymentState.data ?? [];
          shopPaymentMethods[shopId] = methods;
          if (methods.isNotEmpty) {
            selectedPaymentMethods[shopId] = methods.first.id ?? 0;
          }
        }
        if (addresses.isNotEmpty) {
          selectedAddressIds[shopId] = addresses.first.id!;
        }
        shopDiscountCodes[shopId] = "";
      }

      emit(CheckoutLoaded(
        addresses: addresses,
        selectedAddressIds: selectedAddressIds,
        shopPaymentMethods: shopPaymentMethods,
        selectedPaymentMethods: selectedPaymentMethods,
        shopDiscountCodes: shopDiscountCodes,
        shopDiscountDatas: shopDiscountDatas,
      ));
    } catch (e) {
      emit(const CheckoutError("خطایی در دریافت اطلاعات رخ داد"));
    }
  }

  void _onSelectAddress(SelectAddressEvent event, Emitter<CheckoutState> emit) {
    final currentState = state;
    if (currentState is CheckoutLoaded) {
      final updated = Map<String, String>.from(currentState.selectedAddressIds);
      updated[event.repairmanId] = event.addressId;
      emit(currentState.copyWith(selectedAddressIds: updated));
    }
  }

  void _onSelectShopPaymentMethod(SelectShopPaymentMethodEvent event, Emitter<CheckoutState> emit) {
    final currentState = state;
    if (currentState is CheckoutLoaded) {
      final updated = Map<String, int>.from(currentState.selectedPaymentMethods);
      updated[event.repairmanId] = event.paymentTypeId;
      emit(currentState.copyWith(selectedPaymentMethods: updated));
    }
  }

  Future<void> _onApplyDiscount(ApplyDiscountEvent event, Emitter<CheckoutState> emit) async {
    final currentState = state;
    if (currentState is CheckoutLoaded) {
      emit(currentState.copyWith(isSubmitting: true, clearMessages: true));
      final dataState = await _checkoutRepository.checkDiscount(event.code);
      if (dataState is DataSuccess) {
        final updatedCodes = Map<String, String>.from(currentState.shopDiscountCodes);
        final updatedDatas = Map<String, dynamic>.from(currentState.shopDiscountDatas);
        updatedCodes[event.repairmanId] = event.code;
        updatedDatas[event.repairmanId] = dataState.data;

        emit(currentState.copyWith(
          isSubmitting: false,
          shopDiscountCodes: updatedCodes,
          shopDiscountDatas: updatedDatas,
          successMessage: "کد تخفیف برای این فروشگاه اعمال شد",
        ));
      } else {
        emit(currentState.copyWith(
          isSubmitting: false,
          errorMessage: dataState.error ?? "کد تخفیف معتبر نیست",
        ));
      }
    }
  }

  Future<void> _onSubmitShopOrder(SubmitShopOrderEvent event, Emitter<CheckoutState> emit) async {
    final currentState = state;
    if (currentState is CheckoutLoaded) {
      final addressId = currentState.selectedAddressIds[event.repairmanId];
      if (addressId == null) {
        emit(currentState.copyWith(errorMessage: "لطفا یک آدرس انتخاب کنید"));
        return;
      }

      final paymentTypeId = currentState.selectedPaymentMethods[event.repairmanId];
      if (paymentTypeId == null) {
        emit(currentState.copyWith(errorMessage: "لطفا روش پرداخت این فروشگاه را انتخاب کنید"));
        return;
      }

      emit(currentState.copyWith(isSubmitting: true, clearMessages: true));

      final dataState = await _checkoutRepository.submitOrder(
        addressId: addressId,
        discountCode: currentState.shopDiscountCodes[event.repairmanId],
        shopPaymentMethods: {event.repairmanId: paymentTypeId},
      );

      if (dataState is DataSuccess) {
        emit(currentState.copyWith(
          isSubmitting: false,
          successMessage: "سفارش این فروشگاه با موفقیت ثبت شد",
        ));
      } else {
        emit(currentState.copyWith(
          isSubmitting: false,
          errorMessage: dataState.error ?? "خطا در ثبت سفارش",
        ));
      }
    }
  }
}
