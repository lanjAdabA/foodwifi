// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/annotations.dart';
import 'package:foodwifi/pages/maindashboard.page.dart';
import 'package:foodwifi/pages/restaurants.page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeDashboardPage, initial: true, children: []),
    AutoRoute(page: RestaurantPage),
    // AutoRoute(page: DesignationPage),
    // AutoRoute(page: DepartmentPage),
  ],
)
class $AppRouter {}
