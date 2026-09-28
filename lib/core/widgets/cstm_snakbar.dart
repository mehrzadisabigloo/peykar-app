import 'package:flutter/material.dart';
import '../themes/theme_main.dart';

class CstmSnackBar {
  /// Shows a generic SnackBar with a custom color and optional action.
  static void show(BuildContext context, String message, {Color? color, SnackBarAction? action, Duration? duration}) {
    final colorScheme = Theme.of(context).colorScheme;

    // Hide current snackbar if any
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            fontFamily: 'BonyadeKoodak',
            color: colorScheme.surface,
            fontSize: 14,
          ),
          textDirection: TextDirection.rtl,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: color ?? colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        action: action,
        duration: duration ?? const Duration(seconds: 3),
      ),
    );
  }

  /// Shows a success SnackBar (Green).
  static void showSuccess(BuildContext context, String message) {
    show(context, message, color: StatusColors.of(context).success);
  }

  /// Shows an error SnackBar (Red).
  static void showError(BuildContext context, String message) {
    show(context, message, color: Theme.of(context).colorScheme.error);
  }

  /// Shows an info SnackBar (Primary Color).
  static void showInfo(BuildContext context, String message) {
    show(context, message, color: Theme.of(context).colorScheme.primary);
  }
}
