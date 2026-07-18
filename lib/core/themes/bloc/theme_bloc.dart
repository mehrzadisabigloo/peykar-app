import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/core/themes/theme_main.dart';
import 'package:resturant_app/core/themes/theme_manager.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeManager themeManager;

  ThemeBloc(this.themeManager) : super(ThemeState(themeData: ThemeMain.theme())) {
    on<LoadTheme>(_onLoadTheme);
    on<ThemeChanged>(_onThemeChanged);
  }

  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    final theme = await themeManager.theme;
    emit(ThemeState(themeData: theme));
  }

  Future<void> _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) async {
    await themeManager.saveTheme(event.themeIndex);
    final theme = await themeManager.theme;
    emit(ThemeState(themeData: theme));
  }
}
