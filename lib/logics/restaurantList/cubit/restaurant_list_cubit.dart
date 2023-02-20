import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/restaurantalist.model.dart';
import 'package:http/http.dart' as http;

part 'restaurant_list_state.dart';

class RestaurantListCubit extends Cubit<RestaurantListState> {
  RestaurantListCubit() : super(RestaurantListState()) {
    Get_ResListdata();
  }

  Future<void> Get_ResListdata({String? sortoption}) async {
    // List<Item?> data2 = [];
    // try {
    final queryParameters = {
      'lat': '24.805823',
      'lng': '93.942931',
      'sort_by': sortoption ?? '1',
      'free_delivery': '',
      'cuisines': '',
      'halal': '',
      'store_type_id': '',
      'promo': ''
    };
    log('restList');

    final baseHeader = {'Branchid': "1"};
    final response = await http.get(
        Uri.http('app.myfoodwifi.com', '/api/restaurants/restaurantlist',
            queryParameters),
        headers: baseHeader);
    // 'http://admin.myfoodwifi.com/api/restaurants/restaurantlist?lng=93.9449769&lat=24.7982274&sort_by=  &free_delivery&cuisines&halal&store__type_id&promo='

    log(response.body.toString());
    log('restlist: ${response.statusCode.toString()}');

    if (response.statusCode == 200) {
      log("restlist");

      var restList = restaurantListModelFromJson(response.body);
      emit(RestaurantListState(restaurantListdata: restList));

      log('Successfully get restList Data');
    } else {
      emit(RestaurantListState());
      log('Failed to Get restListdata.');
    }
    // } catch (e) {
    //   log('restListData errror${e.toString()}');
    //   emit(const RestaurantListState());
    // }
  }
}
