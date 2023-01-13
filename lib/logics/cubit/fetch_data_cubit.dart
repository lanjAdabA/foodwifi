// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/mainmodel.dart';
import 'package:http/http.dart' as http;

part 'fetch_data_state.dart';

class FetchDataCubit extends Cubit<FetchDataState> {
  FetchDataCubit() : super(const FetchDataState(alldata: [])) {
    getAllData();
  }

  Future<List<Foodwifidashmodel>?> getAllData() async {
    final response = await http.get(Uri.parse(
        "http://app.myfoodwifi.com/api/sites/getbranchcollection?lat= 24.805823&lng=93.942931"));
    final data = jsonDecode(response.body) as List;
    if (response.statusCode == 200) {
      var users = data.map((e) => Foodwifidashmodel.fromJson(e)).toList();
      log("Data successfully fetched");
      emit(FetchDataState(alldata: users));
      return users;
    } else {
      log("fail to fetch data");
    }
    return null;
  }
}
