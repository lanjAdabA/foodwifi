// ! for Restaurantpage, uses restaurantDetailModel

import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/review_modal_modified.model.dart';
import 'package:foodwifi/services/serviceApi.dart';
import 'package:http/http.dart' as http;

part 'restaurants_menu_list_state.dart';

class RestaurantsMenuListCubit extends Cubit<RestaurantsMenuListState> {
  RestaurantsMenuListCubit()
      : super(RestaurantsMenuListState(
          alldata: [],
          status: Status2.initial,
          oneitem: [],
          vegdata: [],
          orialldata: [],
          allbelowitems: [],
        ));

  bool get isLoading => state.status == Status2.loading;

  Future<void> getrestaurantsdetaildata({String? id}) async {
    log("from Resture=ant menu cubit : " + id.toString());
    if (isLoading) {
      return;
    }
    emit(const RestaurantsMenuListState(
        alldata: [],
        status: Status2.loading,
        oneitem: [],
        vegdata: [],
        orialldata: [],
        allbelowitems: []));
    try {
      final queryParameters = {
        'id': id,
      };
      final baseHeader = {'Branchid': "1"};
      final response = await http.get(
          Uri.http('app.myfoodwifi.com', '/api/restaurants/categoryproduct',
              queryParameters),
          headers: baseHeader);
      if (response.statusCode == 200) {
        List<ReviewModalModified> vegdata = [];
        // List<RestaurantsDetailsModel> oneitem = [];
        var allbelowdata = json.decode(response.body) as List;

        var re = await ServiceApi().getcustomerreview(id.toString());

        allbelowdata[0]['reviewdata'] = re;

        // log("custome review added to restuarent :" + allbelowdata.toString());

        //var belowdata = restaurantsDetailsModelFromJson(response.body);
        // var originaldata = reviewModalModifiedFromJson(response.body);
        var finalbelow =
            allbelowdata.map((e) => ReviewModalModified.fromJson(e)).toList();

        log("custome finalbelow added to restuarent :" + finalbelow.toString());

        log('Successfully get new Data');
        for (var element in finalbelow) {
          if (element.reviewdata != null) {
            vegdata.add(element);
          } else {
            for (var element2 in element.products) {
              if (element2.type == 'veg') {
                if (vegdata.contains(element)) {
                  log('item contains already');
                } else {
                  vegdata.add(element);
                }
              }
            }
          }
        }

        // oneitem.add(belowdata[0]);
        // belowdata.removeAt(0);

        emit(RestaurantsMenuListState(
            alldata: [],
            status: Status2.loaded,
            oneitem: [],
            vegdata: vegdata,
            orialldata: [],
            allbelowitems: finalbelow));
      } else {
        emit(const RestaurantsMenuListState(
            alldata: [],
            status: Status2.error,
            oneitem: [],
            vegdata: [],
            orialldata: [],
            allbelowitems: []));
        log('Failed to Getdata.');
      }
      return;
    } catch (e) {
      emit(const RestaurantsMenuListState(
          alldata: [],
          status: Status2.error,
          oneitem: [],
          vegdata: [],
          orialldata: [],
          allbelowitems: []));
      log('RestaurantsMenuListCubitERROR ${e.toString()}');
    }
    return;
  }
}
