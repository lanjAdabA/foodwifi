import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/search_filters.model.dart';

import 'package:http/http.dart' as http;
part 'searchfilter_state.dart';

class SearchfilterCubit extends Cubit<SearchfilterState> {
  SearchfilterCubit()
      : super(SearchfilterState(status: SearchFilterStatus.initial));

  bool get isLoading => state.status == SearchFilterStatus.loading;
  Future<void> gettopsearchdata() async {
    if (isLoading) {
      return;
    }
    emit(const SearchfilterState(status: SearchFilterStatus.loading));
    try {
      final baseHeader = {'Branchid': "1"};
      final response = await http.get(
          Uri.http(
            'app.myfoodwifi.com',
            '/api/restaurants/searchfilter',
          ),
          headers: baseHeader);

      if (response.statusCode == 200) {
        var data = SearchFilterModelFromJson(response.body);
        emit(SearchfilterState(
            status: SearchFilterStatus.loaded, searchfilterdata: data));
      } else {
        log('Failed to Getdata.');
        emit(const SearchfilterState(
          status: SearchFilterStatus.error,
        ));
      }
    } catch (e) {
      log(e.toString());
      emit(const SearchfilterState(
        status: SearchFilterStatus.error,
      ));
    }
  }
}
