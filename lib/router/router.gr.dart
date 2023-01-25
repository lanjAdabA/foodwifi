// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../pages/all_reviews.page.dart' as _i3;
import '../pages/maindashboard.page.dart' as _i1;
import '../pages/restaurants.page.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeDashboardRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeDashboardPage(),
      );
    },
    RestaurantRoute.name: (routeData) {
      final args = routeData.argsAs<RestaurantRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.RestaurantPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    AllReviewsRoute.name: (routeData) {
      final args = routeData.argsAs<AllReviewsRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.AllReviewsPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          HomeDashboardRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          RestaurantRoute.name,
          path: '/restaurant-page',
        ),
        _i4.RouteConfig(
          AllReviewsRoute.name,
          path: '/all-reviews-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomeDashboardPage]
class HomeDashboardRoute extends _i4.PageRouteInfo<void> {
  const HomeDashboardRoute()
      : super(
          HomeDashboardRoute.name,
          path: '/',
        );

  static const String name = 'HomeDashboardRoute';
}

/// generated route for
/// [_i2.RestaurantPage]
class RestaurantRoute extends _i4.PageRouteInfo<RestaurantRouteArgs> {
  RestaurantRoute({
    _i5.Key? key,
    required String id,
  }) : super(
          RestaurantRoute.name,
          path: '/restaurant-page',
          args: RestaurantRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'RestaurantRoute';
}

class RestaurantRouteArgs {
  const RestaurantRouteArgs({
    this.key,
    required this.id,
  });

  final _i5.Key? key;

  final String id;

  @override
  String toString() {
    return 'RestaurantRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.AllReviewsPage]
class AllReviewsRoute extends _i4.PageRouteInfo<AllReviewsRouteArgs> {
  AllReviewsRoute({
    _i5.Key? key,
    required String id,
  }) : super(
          AllReviewsRoute.name,
          path: '/all-reviews-page',
          args: AllReviewsRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'AllReviewsRoute';
}

class AllReviewsRouteArgs {
  const AllReviewsRouteArgs({
    this.key,
    required this.id,
  });

  final _i5.Key? key;

  final String id;

  @override
  String toString() {
    return 'AllReviewsRouteArgs{key: $key, id: $id}';
  }
}
