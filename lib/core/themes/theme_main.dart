import 'package:flutter/material.dart';

class ThemeMain {
  // Exact primary color from the image (a solid vibrant purple)
  static const Color primaryColor = Color(0xff7358F5);
  static const Color greyBackground = Color(0xffF8F8F8);
  static const Color greyBorder = Color(0xffE8E8E8);
  static const Color greyText = Color(0xff9E9E9E);
  static const Color errorColor = Color(0xffFF3F3F);

  static ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        fontFamily: 'BonyadeKoodak',
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          error: errorColor,
          primary: primaryColor,
          surface: Colors.white,
          onSurface: Colors.black,
          outline: greyBorder,
          surfaceContainerHighest: greyBackground,
          surfaceContainer: Color(0xFFF8F9FB),
          onSurfaceVariant: greyText,
          outlineVariant: Color(0xffeeeeee),
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            color: greyText,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: greyBackground,
            hintStyle: const TextStyle(fontSize: 14, color: Color(0xff9E9E9E)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: greyBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: greyBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: primaryColor, width: 1.5),
            ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 52),
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: primaryColor,
            minimumSize: const Size(double.infinity, 52),
            side: const BorderSide(color: greyBorder),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'BonyadeKoodak',
            ),
          ),
        ),
        extensions: [
          const ReminderColors(
            timeColor: Colors.blue,
            kilometerColor: Color(0xFFE65100),
            timeColorLight: Color(0xFFE3F2FD),
            kilometerColorLight: Color(0xFFFFF3E0),
          ),
          const StatusColors(
            success: Color(0xFF4CAF50),
            warning: Color(0xFFFFA000),
            info: Color(0xFF2196F3),
          ),
          const DashboardColors(
            adminAccent: Color(0xFF1A237E),
            adminTeal: Color(0xFF00897B),
            adminOrange: Color(0xFFE64A19),
            adminYellow: Color(0xFFF9A825),
            adminIndigo: Color(0xFF3F51B5),
          ),
        ],
    );
  }
}

class StatusColors extends ThemeExtension<StatusColors> {
  final Color success;
  final Color warning;
  final Color info;

  const StatusColors({
    required this.success,
    required this.warning,
    required this.info,
  });

  static StatusColors of(BuildContext context) => Theme.of(context).extension<StatusColors>()!;

  @override
  StatusColors copyWith({Color? success, Color? warning, Color? info}) {
    return StatusColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
    );
  }

  @override
  StatusColors lerp(ThemeExtension<StatusColors>? other, double t) {
    if (other is! StatusColors) return this;
    return StatusColors(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
    );
  }
}

class DashboardColors extends ThemeExtension<DashboardColors> {
  final Color adminAccent;
  final Color adminTeal;
  final Color adminOrange;
  final Color adminYellow;
  final Color adminIndigo;

  const DashboardColors({
    required this.adminAccent,
    required this.adminTeal,
    required this.adminOrange,
    required this.adminYellow,
    required this.adminIndigo,
  });

  static DashboardColors of(BuildContext context) => Theme.of(context).extension<DashboardColors>()!;

  @override
  DashboardColors copyWith({
    Color? adminAccent,
    Color? adminTeal,
    Color? adminOrange,
    Color? adminYellow,
    Color? adminIndigo,
  }) {
    return DashboardColors(
      adminAccent: adminAccent ?? this.adminAccent,
      adminTeal: adminTeal ?? this.adminTeal,
      adminOrange: adminOrange ?? this.adminOrange,
      adminYellow: adminYellow ?? this.adminYellow,
      adminIndigo: adminIndigo ?? this.adminIndigo,
    );
  }

  @override
  DashboardColors lerp(ThemeExtension<DashboardColors>? other, double t) {
    if (other is! DashboardColors) return this;
    return DashboardColors(
      adminAccent: Color.lerp(adminAccent, other.adminAccent, t)!,
      adminTeal: Color.lerp(adminTeal, other.adminTeal, t)!,
      adminOrange: Color.lerp(adminOrange, other.adminOrange, t)!,
      adminYellow: Color.lerp(adminYellow, other.adminYellow, t)!,
      adminIndigo: Color.lerp(adminIndigo, other.adminIndigo, t)!,
    );
  }
}

class ReminderColors extends ThemeExtension<ReminderColors> {
  final Color timeColor;
  final Color kilometerColor;
  final Color timeColorLight;
  final Color kilometerColorLight;

  const ReminderColors({
    required this.timeColor,
    required this.kilometerColor,
    required this.timeColorLight,
    required this.kilometerColorLight,
  });

  @override
  ReminderColors copyWith({
    Color? timeColor,
    Color? kilometerColor,
    Color? timeColorLight,
    Color? kilometerColorLight,
  }) {
    return ReminderColors(
      timeColor: timeColor ?? this.timeColor,
      kilometerColor: kilometerColor ?? this.kilometerColor,
      timeColorLight: timeColorLight ?? this.timeColorLight,
      kilometerColorLight: kilometerColorLight ?? this.kilometerColorLight,
    );
  }

  @override
  ReminderColors lerp(ThemeExtension<ReminderColors>? other, double t) {
    if (other is! ReminderColors) return this;
    return ReminderColors(
      timeColor: Color.lerp(timeColor, other.timeColor, t)!,
      kilometerColor: Color.lerp(kilometerColor, other.kilometerColor, t)!,
      timeColorLight: Color.lerp(timeColorLight, other.timeColorLight, t)!,
      kilometerColorLight: Color.lerp(kilometerColorLight, other.kilometerColorLight, t)!,
    );
  }
}
