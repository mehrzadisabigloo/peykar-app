import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/screen_create_time_slot.dart';

class CreateTimeSlotRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'create_time_slot',
          path: '/create_time_slot',
          builder: (context, state) => const ScreenCreateTimeSlot(),
        ),
      ];
}
