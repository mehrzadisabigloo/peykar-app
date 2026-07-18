import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/screen_reminders.dart';
import '../screen/screen_add_reminder.dart';

class RemindersRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'reminders',
          path: '/reminders',
          builder: (context, state) => const ScreenReminders(),
        ),
        GoRoute(
          name: 'add_reminder',
          path: '/add_reminder',
          builder: (context, state) => const ScreenAddReminder(),
        ),
      ];
}
