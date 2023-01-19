import 'package:foodwifi/model/restaurantsdetails.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'package:foodwifi/model/restaurantspage.model.dart';

//? ServiceApi_restaurantPage

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
        var rastaurantsdata = RestaurantsPageModel.fromJson(data);

        log(rastaurantsdata.title.toString());

        log('Successfully get Data');
        return rastaurantsdata;
      } else {
        log('Failed to Getdata.');
      }
    }
  } catch (e) {
    log('upper errror${e.toString()}');
  }
  return null;
}

Future<RestaurantsDetailsModel?> getrestaurantsdetaildata({String? id}) async {
  try {
    final queryParameters = {
      'id': id,
    };
    final baseHeader = {'Branchid': "1"};
    final response = await http.get(
        Uri.http('app.myfoodwifi.com', '/api/restaurants/categoryproduct',
            queryParameters),
        headers: baseHeader);
    var detaildata = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      var restaurantsdetaildata = RestaurantsDetailsModel.fromJson(detaildata);

      log('Successfully get Data');
      return restaurantsdetaildata;
    } else {
      log('Failed to Getdata.');
    }
    return null;
  } catch (e) {}
  return null;
}
// // ignore_for_file: file_names

// import 'dart:convert';
// import 'dart:developer';
// import 'package:foodwifi/model/mainmodel.dart';
// import 'package:http/http.dart' as http;

// Future<List<Foodwifimodel>?> getAllData() async {
//   final response = await http.get(Uri.parse(
//       "http://app.myfoodwifi.com/api/sites/getbranchcollection?lat= 24.805823&lng=93.942931"));
//   final data = jsonDecode(response.body) as List;
//   if (response.statusCode == 200) {
//     var users = data.map((e) => Foodwifimodel.fromJson(e)).toList();
//     log("Successfully fetched");
//     return users;
//   } else {
//     log("fail to fetch");
//   }
//   return null;
// }
