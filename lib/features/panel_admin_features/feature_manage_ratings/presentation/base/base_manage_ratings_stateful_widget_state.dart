import 'package:flutter/material.dart';
import '../../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../../core/bloc/error/error_bloc.dart';
import '../../../feature_panel_admin/presentation/base/base_panel_admin_stateful_widget_state.dart';
import '../bloc/manage_rating_bloc.dart';

abstract class BaseManageRatingsStatefulWidgetState<T extends StatefulWidget, S extends ManageRatingBloc>
    extends BasePanelAdminStatefulWidgetState<T, S> {
  BaseManageRatingsStatefulWidgetState(super.bloc);

  @override
  void ninoBlocListener(BuildContext context, AppBlocState appState) {}

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState) {
    return buildManageRatingsWidget(context, errorState, appState);
  }

  Widget buildManageRatingsWidget(BuildContext context, ErrorState errorState, AppBlocState appState);
}
