import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/screen_appointments.dart';

class AppointmentsRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'appointments',
          path: '/appointments',
          builder: (context, state) => const ScreenAppointments(),
        ),
      ];
}
