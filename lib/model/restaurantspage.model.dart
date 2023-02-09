// To parse this JSON data, do
//
//     final restaurantsPageModel = restaurantsPageModelFromJson(jsonString);
//!model for RestaurantPage ((Upper Portion))

import 'dart:convert';

RestaurantsPageModel restaurantsPageModelFromJson(String str) =>
    RestaurantsPageModel.fromJson(json.decode(str));

String restaurantsPageModelToJson(RestaurantsPageModel data) =>
    json.encode(data.toJson());

class RestaurantsPageModel {
  RestaurantsPageModel({
    required this.id,
    required this.branchId,
    required this.title,
    required this.img,
    required this.description,
    required this.address,
    required this.distance,
    required this.time,
    required this.deliveryCharge,
    required this.rating,
    required this.ratingCount,
    required this.gst,
    required this.notices,
  });

  final String id;
  final String branchId;
  final String title;
  final String img;
  final String description;
  final String address;
  final String distance;
  final String time;
  final dynamic deliveryCharge;
  final double rating;
  final String ratingCount;
  final String gst;
  final List<String> notices;

  factory RestaurantsPageModel.fromJson(Map<String, dynamic> json) =>
      RestaurantsPageModel(
        id: json["id"],
        branchId: json["branch_id"],
        title: json["title"],
        img: json["img"],
        description: json["description"],
        address: json["address"],
        distance: json["distance"],
        time: json["time"],
        deliveryCharge: json["delivery_charge"],
        rating: json["rating"].toDouble(),
        ratingCount: json["rating_count"],
        gst: json["gst"],
        notices: List<String>.from(json["notices"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "branch_id": branchId,
        "title": title,
        "img": img,
        "description": description,
        "address": address,
        "distance": distance,
        "time": time,
        "delivery_charge": deliveryCharge,
        "rating": rating,
        "rating_count": ratingCount,
        "gst": gst,
        "notices": List<dynamic>.from(notices.map((x) => x)),
      };
}
