part of 'panel_admin_bloc.dart';


abstract class PanelAdminState extends Equatable {
  const PanelAdminState();

  @override
  List<Object?> get props => [];
}

class PanelAdminInitial extends PanelAdminState {
  const PanelAdminInitial();
}

class PanelAdminLoading extends PanelAdminState {
  const PanelAdminLoading();
}

class PanelAdminLoaded extends PanelAdminState {
  const PanelAdminLoaded();
}

class PanelAdminError extends PanelAdminState {
  final String message;
  const PanelAdminError(this.message);

  @override
  List<Object?> get props => [message];
}
