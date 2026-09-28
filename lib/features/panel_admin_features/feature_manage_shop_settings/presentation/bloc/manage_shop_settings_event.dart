part of 'manage_shop_settings_bloc.dart';

abstract class ManageShopSettingsEvent extends Equatable {
  const ManageShopSettingsEvent();

  @override
  List<Object?> get props => [];
}

class FetchShopSettingsEvent extends ManageShopSettingsEvent {}

class ChangeShopStatusEvent extends ManageShopSettingsEvent {
  final String key;
  const ChangeShopStatusEvent(this.key);

  @override
  List<Object?> get props => [key];
}
