import 'package:flutter/material.dart';
import '../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../core/bloc/error/error_bloc.dart';
import '../../../feature_panel_admin/presentation/base/base_panel_admin_stateful_widget_state.dart';
import '../bloc/manage_users_bloc.dart';

abstract class BaseManageUsersStatefulWidgetState<T extends StatefulWidget, S extends ManageUsersBloc>
    extends BasePanelAdminStatefulWidgetState<T, S> {
  BaseManageUsersStatefulWidgetState(super.bloc);

  @override
  void ninoBlocListener(BuildContext context, AppBlocState appState) {}

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return buildManageUsersWidget(context, errorState, appState);
  }

  Widget buildManageUsersWidget(BuildContext context, ErrorState errorState, AppBlocState appState);
}
