part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class ThemeChanged extends ThemeEvent {
  final int themeIndex;
  const ThemeChanged({required this.themeIndex});

  @override
  List<Object?> get props => [themeIndex];
}

class LoadTheme extends ThemeEvent {
  const LoadTheme();
}
