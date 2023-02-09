// ! for allReviewPage, uses allreviewModel

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/allreviews.model.dart';
import 'package:http/http.dart' as http;

part 'all_reviews_state.dart';

class AllReviewsCubit extends Cubit<AllReviewsState> {
  AllReviewsCubit() : super(AllReviewsState(position: true));

//! allReviews model
  Future<void> getAllReviews({
    String? id,
    String? page,
    int? limit,
    required bool ismoredata,
  }) async {
    try {
      final queryParameters = {
        'id': id, "page": page,
        //  page,
        "limit": limit.toString()
        // limit
      };
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
          var allreviews = allReviewsModelFromJson(response.body);

          log(allreviews.rating.toString());

          log('Successfully get AllReviewData');

          if (allreviews.review.length < limit!) {
            ismoredata = false;
          }

          emit(AllReviewsState(position: true, allreviews: allreviews));
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
