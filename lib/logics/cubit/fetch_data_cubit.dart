//! main dashboard cubit

import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/mainmodel.dart';
import 'package:http/http.dart' as http;

part 'fetch_data_state.dart';

class FetchdatablocCubit extends Cubit<FetchDataState> {
  FetchdatablocCubit() : super(FetchDataState(alldata: [], firstlistitem: [])) {
    Get_alldata();
  }

  Future<List<Foodwifimodel>?> Get_alldata() async {
    // List<Item?> data2 = [];
    try {
      final queryParameters = {
        'lat': '24.805823',
        'lng': '93.942931',
      };
      final baseHeader = {'Branchid': "1"};
      final response = await http.get(
          Uri.http('app.myfoodwifi.com', '/api/sites/getbranchcollection',
              queryParameters),
          headers: baseHeader);

      var data = jsonDecode(response.body) as List;
      log(response.body.toString());
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        var users = data.map((e) => Foodwifimodel.fromJson(e)).toList();
        var user2 = data.map((e) {
          List l1 = e['items'][0];
          var datamap = l1.map((e2) {
            return Item.fromJson(e2);
          }).toList();
          return datamap;
        }).toList();
        log("user2");
        log(user2.toString());

        log('Successfully get Data');
        emit(FetchDataState(alldata: users, firstlistitem: user2));
        return users;
      } else {
        log('Failed to Getdata.');
      }
      return null;
    } catch (e) {
      log(e.toString());
      log("e");
    }
    return null;
  }
}

// // ignore_for_file: depend_on_referenced_packages

// import 'dart:convert';
// import 'dart:developer';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:foodwifi/model/mainmodel.dart';
// import 'package:http/http.dart' as http;

// part 'fetch_data_state.dart';

// class FetchDataCubit extends Cubit<FetchDataState> {
//   FetchDataCubit() : super(const FetchDataState(alldata: [])) {
//     getAllData();
//   }

//   Future<List<Foodwifidashmodel>?> getAllData() async {

//     final response = await http.get(Uri.parse(
//         "http://app.myfoodwifi.com/api/sites/getbranchcollection?lat= 24.805823&lng=93.942931"));
//     final data = jsonDecode(response.body) as List;
//     if (response.statusCode == 200) {
//       var users = data.map((e) => Foodwifidashmodel.fromJson(e)).toList();

//       log("Data successfully fetched");
//       emit(FetchDataState(alldata: users));
//       return users;
//     } else {
//       log("fail to fetch data");
//     }
//     return null;
//   }
// }
