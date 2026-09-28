import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/app/app_bloc.dart';
import '../bloc/base/base_bloc.dart';
import '../bloc/error/error_bloc.dart';
import '../error/app_exception.dart';
import '../services/locator.dart';
import '../widgets/cstm_snakbar.dart';
import 'base_widget_state.dart';

abstract class BaseScreenState<T extends StatefulWidget, S extends BaseBloc> extends BaseWidgetState<T> {
  final S bloc;
  BaseScreenState(this.bloc);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppBlocState>(
        builder: blocBuild,
        buildWhen: (_, c) => c.shouldRebuild,
        listener: ninoBlocListener,
        listenWhen: (_, c) => c.shouldListen);
  }

  Widget blocBuild(BuildContext context, AppBlocState appState) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<S>(create: (context) => bloc),
        BlocProvider<ErrorBloc>(create: (context) => bloc.errorBloc),
      ],
      child: BlocConsumer<ErrorBloc, ErrorState>(
          listenWhen: (_, c) => c.shouldListen,
          buildWhen: (_, c) => c.shouldRebuild,
          builder: (c, s) => buildNinoWidget(c, s, appState),
          listener: errorBlocListener),
    );
  }

  void ninoBlocListener(BuildContext context, AppBlocState appState) {}

  void errorBlocListener(BuildContext context, ErrorState state) {
    if (state is ErrorStateNone) {
      retry(exception: state.exception);
    }
    if (state is ErrorStateDisplaySnackBar) {
      CstmSnackBar.showError(context, state.message);
    }
  }

  void retry({AppException? exception}) {
    bloc.errorBloc.add(ErrorBeingResolved());
  }

  Widget buildNinoWidget(BuildContext context, ErrorState errorState, AppBlocState appState);

  void emitOperation(EnumAppOperationType operation, dynamic data) {
    locator<AppBloc>().add(AppEventDataUpdated(data, operation));
  }
}
