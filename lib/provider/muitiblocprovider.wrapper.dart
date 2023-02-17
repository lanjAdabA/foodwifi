import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodwifi/logics/allReviews/cubit/all_reviews_cubit.dart';
import 'package:foodwifi/logics/cubit/fetch_data_cubit.dart';
import 'package:foodwifi/logics/item_details/cubit/item_detailed_cubit.dart';
import 'package:foodwifi/logics/restaurantsMenuDetails/cubit/restaurants_menu_list_cubit.dart';
import 'package:foodwifi/logics/searchResturantByItem/cubit/search_resturant_by_item_cubit.dart';
import 'package:foodwifi/logics/searchfilter/cubit/searchfilter_cubit.dart';

class MultiproviderWrapper extends StatelessWidget {
  final Widget child;
  const MultiproviderWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => FetchdatablocCubit(),
      ),
      BlocProvider(
        create: (context) => AllReviewsCubit(),
      ),
      BlocProvider(
        create: (context) => ItemDetailedCubit(),
      ),
      BlocProvider(
        create: (context) => SearchResturantByItemCubit(),
      ),
      BlocProvider(
        create: (context) => RestaurantsMenuListCubit(),
      ),
      BlocProvider(
        create: (context) => SearchfilterCubit(),
      ),
    ], child: child);
  }
}
