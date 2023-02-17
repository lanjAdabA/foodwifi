// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/annotations.dart';
import 'package:foodwifi/pages/allreviews.page.dart';
import 'package:foodwifi/pages/itemDetail.page.dart';
import 'package:foodwifi/pages/maindashboard.page.dart';
import 'package:foodwifi/pages/restaurantSearchByItem.page.dart';
import 'package:foodwifi/pages/restaurants.page.dart';
import 'package:foodwifi/pages/searchfilter.page.dart';
import 'package:foodwifi/pages/splashscreen.page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreenPage, initial: true, children: []),
    AutoRoute(
      page: HomeDashboardPage,
    ),
    AutoRoute(page: RestaurantPage),
    AutoRoute(page: AllReviewsPage),
    AutoRoute(page: RestaurantSearchByItemPage),
    AutoRoute(page: ProductDetailPage),
    AutoRoute(page: SearchFilterPage),
  ],
)
class $AppRouter {}
