part of 'panel_admin_bloc.dart';


abstract class PanelAdminEvent extends Equatable {
  const PanelAdminEvent();

  @override
  List<Object?> get props => [];
}

class FetchPanelAdminDataEvent extends PanelAdminEvent {
  const FetchPanelAdminDataEvent();
}
