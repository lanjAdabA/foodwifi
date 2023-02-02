import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodwifi/model/item_details.model.dart';
import 'package:http/http.dart' as http;

part 'item_detailed_state.dart';

class ItemDetailedCubit extends Cubit<ItemDetailedState> {
  ItemDetailedCubit() : super(ItemDetailedState());
  Future<void> getproductdetail(
    String id,
  ) async {
    try {
      log('Id: ${id.toString()}');
      final baseHeader = {'Branchid': "1"};
      final response = await http.get(
          Uri.http(
            'app.myfoodwifi.com',
            '/api/products/$id',
          ),
          headers: baseHeader);
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        var itemdetails = ProductDetailModel.fromJson(data);
        log(itemdetails.toJson().toString());
        emit(ItemDetailedState(productdetail: itemdetails));

        log('Successfully get Detail Data');
      } else {
        log('Failed to Getdata.');
      }
    } catch (e) {
      log('itemdetailed page  errror ${e.toString()}');
    }
  }
}


 //! error not from  cubit 

//     try {
//       log('Id: ${id.toString()}');
//       final baseHeader = {'Branchid': "1"};
//       final response = await http.get(
//           Uri.http(
//             'app.myfoodwifi.com',
//             '/api/products/$id',
//           ),
//           headers: baseHeader);

// //!decode map data
//       var decodedata = jsonDecode(response.body);

//       if (response.statusCode == 200) {
//         var productDetails = ItemDetails.fromJson(decodedata);

//         log(productDetails.toString());
//         emit(ItemDetailedState(productdetail: productDetails));
//         log("Successfilly fetched itemdetailed");
//       } else {
//         log('Failed to fetched itemdetailed.');
//       }
//     } catch (e) {
//       log("message");
//       log(e.toString());
//     }
//   }
// }
//!
 
 