import 'package:flutter/material.dart';
import '../../../../../../core/base/base_screen_state.dart';
import '../../../../../../core/bloc/app/app_bloc.dart';
import '../../../../../../core/bloc/base/base_bloc.dart';
import '../../../../../../core/bloc/error/error_bloc.dart';

abstract class BaseManageReminderSubItemsStatefulWidgetState<T extends StatefulWidget, S extends BaseBloc> extends BaseScreenState<T, S> {
  BaseManageReminderSubItemsStatefulWidgetState(super.bloc);

  @override
  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState);
}
