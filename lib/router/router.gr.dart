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
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../pages/maindashboard.page.dart' as _i1;
import '../pages/restaurants.page.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeDashboardRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeDashboardPage(),
      );
    },
    RestaurantRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.RestaurantPage(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          HomeDashboardRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          RestaurantRoute.name,
          path: '/restaurant-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomeDashboardPage]
class HomeDashboardRoute extends _i3.PageRouteInfo<void> {
  const HomeDashboardRoute()
      : super(
          HomeDashboardRoute.name,
          path: '/',
        );

  static const String name = 'HomeDashboardRoute';
}

/// generated route for
/// [_i2.RestaurantPage]
class RestaurantRoute extends _i3.PageRouteInfo<void> {
  const RestaurantRoute()
      : super(
          RestaurantRoute.name,
          path: '/restaurant-page',
        );

  static const String name = 'RestaurantRoute';
}
