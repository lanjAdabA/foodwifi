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
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../model/review_modal_modified.model.dart' as _i10;
import '../pages/allreviews.page.dart' as _i4;
import '../pages/itemDetail.page.dart' as _i6;
import '../pages/maindashboard.page.dart' as _i2;
import '../pages/restaurants.page.dart' as _i3;
import '../pages/restaurantSearchByItem.page.dart' as _i5;
import '../pages/searchfilter.page.dart' as _i7;
import '../pages/splashscreen.page.dart' as _i1;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreenPage(),
      );
    },
    HomeDashboardRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomeDashboardPage(),
      );
    },
    RestaurantRoute.name: (routeData) {
      final args = routeData.argsAs<RestaurantRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.RestaurantPage(
          key: args.key,
          id: args.id,
          itemname: args.itemname,
          product: args.product,
          index: args.index,
          iscomingfromsearch: args.iscomingfromsearch,
        ),
      );
    },
    AllReviewsRoute.name: (routeData) {
      final args = routeData.argsAs<AllReviewsRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.AllReviewsPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    RestaurantSearchByItemRoute.name: (routeData) {
      final args = routeData.argsAs<RestaurantSearchByItemRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.RestaurantSearchByItemPage(
          key: args.key,
          itemname: args.itemname,
          issearchfound: args.issearchfound,
          cuisinesId: args.cuisinesId,
          storetypeid: args.storetypeid,
          checkname: args.checkname,
        ),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>(
          orElse: () => const ProductDetailRouteArgs());
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.ProductDetailPage(
          key: args.key,
          product: args.product,
        ),
      );
    },
    SearchFilterRoute.name: (routeData) {
      final args = routeData.argsAs<SearchFilterRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.SearchFilterPage(
          key: args.key,
          searchname: args.searchname,
        ),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          SplashScreenRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          HomeDashboardRoute.name,
          path: '/home-dashboard-page',
        ),
        _i8.RouteConfig(
          RestaurantRoute.name,
          path: '/restaurant-page',
        ),
        _i8.RouteConfig(
          AllReviewsRoute.name,
          path: '/all-reviews-page',
        ),
        _i8.RouteConfig(
          RestaurantSearchByItemRoute.name,
          path: '/restaurant-search-by-item-page',
        ),
        _i8.RouteConfig(
          ProductDetailRoute.name,
          path: '/product-detail-page',
        ),
        _i8.RouteConfig(
          SearchFilterRoute.name,
          path: '/search-filter-page',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreenPage]
class SplashScreenRoute extends _i8.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.HomeDashboardPage]
class HomeDashboardRoute extends _i8.PageRouteInfo<void> {
  const HomeDashboardRoute()
      : super(
          HomeDashboardRoute.name,
          path: '/home-dashboard-page',
        );

  static const String name = 'HomeDashboardRoute';
}

/// generated route for
/// [_i3.RestaurantPage]
class RestaurantRoute extends _i8.PageRouteInfo<RestaurantRouteArgs> {
  RestaurantRoute({
    _i9.Key? key,
    required String id,
    required String itemname,
    _i10.Product? product,
    required int index,
    required bool iscomingfromsearch,
  }) : super(
          RestaurantRoute.name,
          path: '/restaurant-page',
          args: RestaurantRouteArgs(
            key: key,
            id: id,
            itemname: itemname,
            product: product,
            index: index,
            iscomingfromsearch: iscomingfromsearch,
          ),
        );

  static const String name = 'RestaurantRoute';
}

class RestaurantRouteArgs {
  const RestaurantRouteArgs({
    this.key,
    required this.id,
    required this.itemname,
    this.product,
    required this.index,
    required this.iscomingfromsearch,
  });

  final _i9.Key? key;

  final String id;

  final String itemname;

  final _i10.Product? product;

  final int index;

  final bool iscomingfromsearch;

  @override
  String toString() {
    return 'RestaurantRouteArgs{key: $key, id: $id, itemname: $itemname, product: $product, index: $index, iscomingfromsearch: $iscomingfromsearch}';
  }
}

/// generated route for
/// [_i4.AllReviewsPage]
class AllReviewsRoute extends _i8.PageRouteInfo<AllReviewsRouteArgs> {
  AllReviewsRoute({
    _i9.Key? key,
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

  final _i9.Key? key;

  final String? id;

  @override
  String toString() {
    return 'AllReviewsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i5.RestaurantSearchByItemPage]
class RestaurantSearchByItemRoute
    extends _i8.PageRouteInfo<RestaurantSearchByItemRouteArgs> {
  RestaurantSearchByItemRoute({
    _i9.Key? key,
    required String itemname,
    required bool issearchfound,
    required String cuisinesId,
    required String storetypeid,
    required String checkname,
  }) : super(
          RestaurantSearchByItemRoute.name,
          path: '/restaurant-search-by-item-page',
          args: RestaurantSearchByItemRouteArgs(
            key: key,
            itemname: itemname,
            issearchfound: issearchfound,
            cuisinesId: cuisinesId,
            storetypeid: storetypeid,
            checkname: checkname,
          ),
        );

  static const String name = 'RestaurantSearchByItemRoute';
}

class RestaurantSearchByItemRouteArgs {
  const RestaurantSearchByItemRouteArgs({
    this.key,
    required this.itemname,
    required this.issearchfound,
    required this.cuisinesId,
    required this.storetypeid,
    required this.checkname,
  });

  final _i9.Key? key;

  final String itemname;

  final bool issearchfound;

  final String cuisinesId;

  final String storetypeid;

  final String checkname;

  @override
  String toString() {
    return 'RestaurantSearchByItemRouteArgs{key: $key, itemname: $itemname, issearchfound: $issearchfound, cuisinesId: $cuisinesId, storetypeid: $storetypeid, checkname: $checkname}';
  }
}

/// generated route for
/// [_i6.ProductDetailPage]
class ProductDetailRoute extends _i8.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i9.Key? key,
    _i10.Product? product,
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
    this.product,
  });

  final _i9.Key? key;

  final _i10.Product? product;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i7.SearchFilterPage]
class SearchFilterRoute extends _i8.PageRouteInfo<SearchFilterRouteArgs> {
  SearchFilterRoute({
    _i9.Key? key,
    required String searchname,
  }) : super(
          SearchFilterRoute.name,
          path: '/search-filter-page',
          args: SearchFilterRouteArgs(
            key: key,
            searchname: searchname,
          ),
        );

  static const String name = 'SearchFilterRoute';
}

class SearchFilterRouteArgs {
  const SearchFilterRouteArgs({
    this.key,
    required this.searchname,
  });

  final _i9.Key? key;

  final String searchname;

  @override
  String toString() {
    return 'SearchFilterRouteArgs{key: $key, searchname: $searchname}';
  }
}
