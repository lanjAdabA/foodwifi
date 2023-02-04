import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import 'package:foodwifi/model/resturant_search_by_item.model.dart';

part 'search_resturant_by_item_state.dart';

class SearchResturantByItemCubit extends Cubit<SearchResturantByItemState> {
  SearchResturantByItemCubit()
      : super(SearchResturantByItemState(
            searchdata: [], status: SearchStatus.initial, isloading: true));
  bool get isLoading => state.status == SearchStatus.loading;

  Future<List<ResturantSearchByItemModel>?> getresturantSearchByItems({
    required String itemname,
    required int page,
    // required int datalimit,
    required bool ismoredata,
  }) async {
    // List allsearchdata = [];
    if (page < 2) {
      if (isLoading) {
        emit(SearchResturantByItemState(
            searchdata: [], status: SearchStatus.loading, isloading: true));
      }
    }
    try {
      if (ismoredata) {
        final queryParameters = {
          '_search': itemname,
          'page': page.toString(),
          'lat': '24.805823',
          'lng': '93.942931',
          'sort_by': '',
          'cuisines': '',
          'store_type_id': '',
          'halal': '',
          'free_delivery': '',
          'promo': ''
        };
        final baseHeader = {'Branchid': "1"};

        final response = await http.get(
            Uri.http('app.myfoodwifi.com', '/api/restaurants/search',
                queryParameters),
            headers: baseHeader);

        log('status code ${response.statusCode.toString()}');

        if (response.statusCode == 200) {
          var allsearchdata = resturantSearchByItemFromJson(response.body);
          log('Successfully get Search Data');

          if (allsearchdata.length < 15) {
            log('item is lesss than ${allsearchdata.length}');
            ismoredata = false;
            emit(SearchResturantByItemState(
                searchdata: allsearchdata,
                status: SearchStatus.loaded,
                isloading: false));
          } else {
            emit(SearchResturantByItemState(
                searchdata: allsearchdata,
                status: SearchStatus.loaded,
                isloading: ismoredata));
          }
          return allsearchdata;
        } else {
          log('SearchResturantByItemCubit: no more data.');
        }
        // return restaurantsdata
      }
    } catch (e) {
      emit(SearchResturantByItemState(
          searchdata: [], status: SearchStatus.error, isloading: false));
      log('SearchResturantByItemCubit error-> ${e.toString()}');
    }
    return null;
  }
}
