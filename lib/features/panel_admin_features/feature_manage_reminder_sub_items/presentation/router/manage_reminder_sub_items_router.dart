import 'package:go_router/go_router.dart';
import '../../../../../core/services/feature_router.dart';
import '../../domain/entity/manage_reminder_sub_item_entity.dart';
import '../screen/screen_manage_reminder_sub_items.dart';
import '../screen/screen_add_edit_reminder_sub_item.dart';

class ManageReminderSubItemsRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'add_reminder_sub_item',
          path: 'reminder-sub-items/add/:reminder_type_id',
          builder: (context, state) => ScreenAddEditReminderSubItem(
            reminderTypeId: state.pathParameters['reminder_type_id']!,
          ),
        ),
        GoRoute(
          name: 'manage_reminder_sub_items',
          path: 'reminder-sub-items/:reminder_type_id/:reminder_type_title',
          builder: (context, state) => ScreenManageReminderSubItems(
            reminderTypeId: state.pathParameters['reminder_type_id']!,
            reminderTypeTitle: state.pathParameters['reminder_type_title']!,
          ),
        ),
        GoRoute(
          name: 'edit_reminder_sub_item',
          path: 'reminder-sub-items/edit',
          builder: (context, state) {
            final item = state.extra as ManageReminderSubItemEntity?;
            return ScreenAddEditReminderSubItem(subItem: item);
          },
        ),
      ];
}
