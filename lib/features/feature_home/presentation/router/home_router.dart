import 'package:go_router/go_router.dart';
import '../../../../core/services/feature_router.dart';
import '../screen/main_home_screen.dart';
import '../screen/screen_category_detail.dart';

class HomeRouter implements FeatureRouter {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          name: 'home',
          path: '/home',
          builder: (context, state) => const MainHomeScreen(),
        ),
        GoRoute(
          name: 'category_detail',
          path: '/category_detail/:title',
          builder: (context, state) {
            final title = state.pathParameters['title']!;
            final occupationId = state.uri.queryParameters['occupation_id'];
            return ScreenCategoryDetail(
              categoryTitle: title,
              occupationId: occupationId,
            );
          },
        ),
      ];
}
