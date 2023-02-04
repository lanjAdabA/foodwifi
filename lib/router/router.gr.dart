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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../model/restaurantsdetails.model.dart' as _i8;
import '../pages/all_reviews.page.dart' as _i3;
import '../pages/itemDetail.page.dart' as _i5;
import '../pages/maindashboard.page.dart' as _i1;
import '../pages/restaurants.page.dart' as _i2;
import '../pages/restaurantSearchByItem.page.dart' as _i4;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeDashboardRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeDashboardPage(),
      );
    },
    RestaurantRoute.name: (routeData) {
      final args = routeData.argsAs<RestaurantRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.RestaurantPage(
          key: args.key,
          id: args.id,
          itemname: args.itemname,
        ),
      );
    },
    AllReviewsRoute.name: (routeData) {
      final args = routeData.argsAs<AllReviewsRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.AllReviewsPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    RestaurantSearchByItemRoute.name: (routeData) {
      final args = routeData.argsAs<RestaurantSearchByItemRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.RestaurantSearchByItemPage(
          key: args.key,
          itemname: args.itemname,
        ),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.ProductDetailPage(
          key: args.key,
          product: args.product,
        ),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          HomeDashboardRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          RestaurantRoute.name,
          path: '/restaurant-page',
        ),
        _i6.RouteConfig(
          AllReviewsRoute.name,
          path: '/all-reviews-page',
        ),
        _i6.RouteConfig(
          RestaurantSearchByItemRoute.name,
          path: '/restaurant-search-by-item-page',
        ),
        _i6.RouteConfig(
          ProductDetailRoute.name,
          path: '/product-detail-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomeDashboardPage]
class HomeDashboardRoute extends _i6.PageRouteInfo<void> {
  const HomeDashboardRoute()
      : super(
          HomeDashboardRoute.name,
          path: '/',
        );

  static const String name = 'HomeDashboardRoute';
}

/// generated route for
/// [_i2.RestaurantPage]
class RestaurantRoute extends _i6.PageRouteInfo<RestaurantRouteArgs> {
  RestaurantRoute({
    _i7.Key? key,
    required String id,
    required String itemname,
  }) : super(
          RestaurantRoute.name,
          path: '/restaurant-page',
          args: RestaurantRouteArgs(
            key: key,
            id: id,
            itemname: itemname,
          ),
        );

  static const String name = 'RestaurantRoute';
}

class RestaurantRouteArgs {
  const RestaurantRouteArgs({
    this.key,
    required this.id,
    required this.itemname,
  });

  final _i7.Key? key;

  final String id;

  final String itemname;

  @override
  String toString() {
    return 'RestaurantRouteArgs{key: $key, id: $id, itemname: $itemname}';
  }
}

/// generated route for
/// [_i3.AllReviewsPage]
class AllReviewsRoute extends _i6.PageRouteInfo<AllReviewsRouteArgs> {
  AllReviewsRoute({
    _i7.Key? key,
    required String? id,
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

  final _i7.Key? key;

  final String? id;

  @override
  String toString() {
    return 'AllReviewsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i4.RestaurantSearchByItemPage]
class RestaurantSearchByItemRoute
    extends _i6.PageRouteInfo<RestaurantSearchByItemRouteArgs> {
  RestaurantSearchByItemRoute({
    _i7.Key? key,
    required String itemname,
  }) : super(
          RestaurantSearchByItemRoute.name,
          path: '/restaurant-search-by-item-page',
          args: RestaurantSearchByItemRouteArgs(
            key: key,
            itemname: itemname,
          ),
        );

  static const String name = 'RestaurantSearchByItemRoute';
}

class RestaurantSearchByItemRouteArgs {
  const RestaurantSearchByItemRouteArgs({
    this.key,
    required this.itemname,
  });

  final _i7.Key? key;

  final String itemname;

  @override
  String toString() {
    return 'RestaurantSearchByItemRouteArgs{key: $key, itemname: $itemname}';
  }
}

/// generated route for
/// [_i5.ProductDetailPage]
class ProductDetailRoute extends _i6.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i7.Key? key,
    required _i8.Product product,
  }) : super(
          ProductDetailRoute.name,
          path: '/product-detail-page',
          args: ProductDetailRouteArgs(
            key: key,
            product: product,
          ),
        );

  static const String name = 'ProductDetailRoute';
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.product,
  });

  final _i7.Key? key;

  final _i8.Product product;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, product: $product}';
  }
}
