import 'package:go_router/go_router.dart';
import '../../../../../core/services/feature_router.dart';
import '../../domain/entity/manage_reminder_types_entity.dart';
import '../screen/screen_manage_reminder_types.dart';
import '../screen/screen_add_edit_reminder_type.dart';

class ManageReminderTypesRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'manage_reminder_types',
          path: 'reminder-types',
          builder: (context, state) => const ScreenManageReminderTypes(),
        ),
        GoRoute(
          name: 'add_reminder_type',
          path: 'reminder-types/add',
          builder: (context, state) => const ScreenAddEditReminderType(),
        ),
        GoRoute(
          name: 'edit_reminder_type',
          path: 'reminder-types/edit',
          builder: (context, state) {
            final type = state.extra as ManageReminderTypeEntity?;
            return ScreenAddEditReminderType(reminderType: type);
          },
        ),
      ];
}
