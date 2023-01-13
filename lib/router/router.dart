// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/annotations.dart';
import 'package:foodwifi/pages/maindashboard.page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeDashboardPage, initial: true, children: []),
    // AutoRoute(page: SignupPage),
    // AutoRoute(page: DesignationPage),
    // AutoRoute(page: DepartmentPage),
  ],
)
class $AppRouter {}
