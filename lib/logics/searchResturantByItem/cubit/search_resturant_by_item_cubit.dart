import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import 'package:foodwifi/model/resturant_search_by_item.model.dart';

part 'search_resturant_by_item_state.dart';

class SearchResturantByItemCubit extends Cubit<SearchResturantByItemState> {
  SearchResturantByItemCubit()
      : super(SearchResturantByItemState(
            ResturantSearchByItem: [], status: SearchStatus.initial));

  Future<void> resturantSearchByItems({
    String? id,
    required String? page,
    required String? search,
    required bool ismoredata,
  }) async {
    try {
      final queryParameters = {'id': id, "page": page, "limit": search};
      if (id != null) {
        log('review Id:chechk ${id.toString()}');
        final baseHeader = {'Branchid': "1"};

        final response = await http.get(
            Uri.http('app.myfoodwifi.com', '/api/restaurants/reviewlist',
                queryParameters),
            headers: baseHeader);
        log(response.statusCode.toString());
        log('status code ${response.statusCode.toString()}');

        if (response.statusCode == 200) {
          // var allreviews = res(response.body);

          // log(allreviews.rating.toString());

          log('Successfully get AllReviewData');

          // if (allreviews.review.length < limit!) {
          //   ismoredata = false;
          // }

          // emit(AllReviewsState(position: true, allreviews: allreviews));
          // return allreviews; //! no return in cubit
        } else {
          log('Failed to get AllReviewsDatas.');
        }
        // return restaurantsdata
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
