import 'package:flutter/material.dart';
import '../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../core/bloc/error/error_bloc.dart';
import '../../../feature_panel_admin/presentation/base/base_panel_admin_stateful_widget_state.dart';
import '../bloc/manage_shop_products_bloc.dart';

abstract class BaseManageShopProductsStatefulWidgetState<T extends StatefulWidget, S extends ManageShopProductsBloc>
    extends BasePanelAdminStatefulWidgetState<T, S> {
  BaseManageShopProductsStatefulWidgetState(super.bloc);

  @override
  void ninoBlocListener(BuildContext context, AppBlocState appState) {}

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState);
}
