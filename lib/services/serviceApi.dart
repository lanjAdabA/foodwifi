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
