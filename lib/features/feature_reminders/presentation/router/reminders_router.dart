import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/screen_reminders.dart';
import '../screen/screen_add_reminder.dart';
import '../screen/screen_reminder_details.dart';
import '../../domain/entity/reminders_entity.dart';

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
        GoRoute(
          name: 'reminder_details',
          path: '/reminder_details/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return ScreenReminderDetails(reminderId: id);
          },
        ),
        GoRoute(
          name: 'edit_reminder',
          path: '/edit_reminder/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            final extra = state.extra as RemindersEntity?;
            return ScreenAddReminder(reminderId: id, extra: extra);
          },
        ),
      ];
}
