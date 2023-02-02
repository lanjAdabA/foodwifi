import 'package:foodwifi/model/restaurantsdetails.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'package:foodwifi/model/restaurantspage.model.dart';

import '../model/review.model.dart';

//? ServiceApi_restaurantPage
class ServiceApi {
  //!restaurantsPageModel
  Future<RestaurantsPageModel?> getRestaurantsProductData({String? id}) async {
    try {
      final queryParameters = {
        'lat': '24.805823',
        'lng': '93.942931',
      };
      if (id != null) {
        log('Id: ${id.toString()}');
        final baseHeader = {'Branchid': "1"};
        final response = await http.get(
            Uri.http(
                'app.myfoodwifi.com', '/api/restaurants/$id', queryParameters),
            headers: baseHeader);

        var data = jsonDecode(response.body) as Map<String, dynamic>;

        if (response.statusCode == 200) {
          var restaurantsdata = RestaurantsPageModel.fromJson(data);

          log(restaurantsdata.title.toString());

          log('Successfully get ResturantPageData');
          return restaurantsdata;
        } else {
          log('Failed to get ResturantPageData.');
        }
      }
    } catch (e) {
      log('upper errror${e.toString()}');
    }
    return null;
  }

//!Restaurants_Menu_Model
  Future<List<RestaurantsDetailsModel?>?> getrestaurantsdetaildata(
      {String? id}) async {
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
        var detaildata = restaurantsDetailsModelFromJson(response.body);

        log('Successfully get ResturantDetailData');
        return detaildata;
      } else {
        log('Failed to get ResturantDetailData.');
      }
      return null;
    } catch (e) {}
    return null;
  }

//!_Customer's reviews
  Future<ReviewModel?> getreviewdata({String? id}) async {
    try {
      final queryParameters = {
        'id': id,
      };
      if (id != null) {
        log('review Id: ${id.toString()}');
        final baseHeader = {'Branchid': "1"};

        final response = await http.get(
            Uri.http('app.myfoodwifi.com', '/api/restaurants/reviewlist',
                queryParameters),
            headers: baseHeader);
        log(response.statusCode.toString());

        if (response.statusCode == 200) {
          var restaurantsdata = reviewModelFromJson(response.body);

          log(restaurantsdata.rating.toString());

          log('Successfully get ReviewData');
          return restaurantsdata;
        } else {
          log('Failed to get ReviewData.');
        }
        // return restaurantsdata
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
