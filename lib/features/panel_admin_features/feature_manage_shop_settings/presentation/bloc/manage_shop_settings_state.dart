part of 'manage_shop_settings_bloc.dart';

abstract class ManageShopSettingsState extends Equatable {
  const ManageShopSettingsState();

  @override
  List<Object?> get props => [];
}

class ManageShopSettingsInitial extends ManageShopSettingsState {}

class ManageShopSettingsLoading extends ManageShopSettingsState {}

class ShopSettingsLoaded extends ManageShopSettingsState {
  final List<ShopSettingModel> settings;
  final String? successMessage;
  final String? errorMessage;
  final String? processingKey;

  const ShopSettingsLoaded({
    required this.settings,
    this.successMessage,
    this.errorMessage,
    this.processingKey,
  });

  ShopSettingsLoaded copyWith({
    List<ShopSettingModel>? settings,
    String? successMessage,
    String? errorMessage,
    String? processingKey,
    bool clearMessages = false,
    bool clearProcessingKey = false,
  }) {
    return ShopSettingsLoaded(
      settings: settings ?? this.settings,
      successMessage: clearMessages ? null : (successMessage ?? this.successMessage),
      errorMessage: clearMessages ? null : (errorMessage ?? this.errorMessage),
      processingKey: clearProcessingKey ? null : (processingKey ?? this.processingKey),
    );
  }

  @override
  List<Object?> get props => [settings, successMessage, errorMessage, processingKey];
}

class ManageShopSettingsError extends ManageShopSettingsState {
  final String message;
  const ManageShopSettingsError(this.message);

  @override
  List<Object?> get props => [message];
}

class ShopSettingActionSuccess extends ManageShopSettingsState {
  final String message;
  const ShopSettingActionSuccess(this.message);

  @override
  List<Object?> get props => [message];
}
