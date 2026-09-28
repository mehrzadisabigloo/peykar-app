import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../core/bloc/base/base_bloc.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/services/locator.dart';
import '../../../../../../core/services/shop_settings_holder.dart';
import '../../data/model/shop_setting_model.dart';
import '../../domain/repository/manage_shop_settings_repository.dart';

part 'manage_shop_settings_event.dart';
part 'manage_shop_settings_state.dart';

class ManageShopSettingsBloc extends BaseBloc<ManageShopSettingsEvent, ManageShopSettingsState> {
  final ManageShopSettingsRepository _repository;

  ManageShopSettingsBloc(this._repository) : super(ManageShopSettingsInitial()) {
    on<FetchShopSettingsEvent>(_onFetchShopSettings);
    on<ChangeShopStatusEvent>(_onChangeStatus);
  }

  Future<void> _onFetchShopSettings(FetchShopSettingsEvent event, Emitter<ManageShopSettingsState> emit) async {
    emit(ManageShopSettingsLoading());
    final dataState = await _repository.getShopSettings();
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        locator<ShopSettingsHolder>().setSettings(dataState.data!);
      }
      emit(ShopSettingsLoaded(settings: dataState.data!));
    } else {
      emit(ManageShopSettingsError(dataState.error ?? "خطا در دریافت اطلاعات"));
    }
  }

  Future<void> _onChangeStatus(ChangeShopStatusEvent event, Emitter<ManageShopSettingsState> emit) async {
    final currentState = state;
    if (currentState is ShopSettingsLoaded) {
      emit(currentState.copyWith(processingKey: event.key, clearMessages: true));
    }
    
    final dataState = await _repository.changeStatus(event.key);
    
    final lastState = state;
    if (lastState is ShopSettingsLoaded) {
      if (dataState is DataSuccess) {
        // Refresh settings after success
        final refreshState = await _repository.getShopSettings();
        if (refreshState is DataSuccess) {
          if (refreshState.data != null) {
            locator<ShopSettingsHolder>().setSettings(refreshState.data!);
          }
          emit(ShopSettingsLoaded(
            settings: refreshState.data!,
            successMessage: "وضعیت با موفقیت تغییر یافت",
          ));
        } else {
          emit(lastState.copyWith(
            clearProcessingKey: true,
            successMessage: "وضعیت با موفقیت تغییر یافت اما خطا در بروزرسانی لیست",
          ));
        }
      } else {
        emit(lastState.copyWith(
          clearProcessingKey: true,
          errorMessage: dataState.error ?? "خطا در تغییر وضعیت",
        ));
      }
    } else {
      if (dataState is DataSuccess) {
        add(FetchShopSettingsEvent());
      } else {
        emit(ManageShopSettingsError(dataState.error ?? "خطا در تغییر وضعیت"));
      }
    }
  }
}
