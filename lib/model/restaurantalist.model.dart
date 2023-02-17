// To parse this JSON data, do
//
//     final restaurantListModel = restaurantListModelFromJson(jsonString);

import 'dart:convert';

RestaurantListModel restaurantListModelFromJson(String str) =>
    RestaurantListModel.fromJson(json.decode(str));

String restaurantListModelToJson(RestaurantListModel data) =>
    json.encode(data.toJson());

class RestaurantListModel {
  RestaurantListModel({
    required this.items,
    required this.type,
  });

  final List<Item> items;
  final String type;

  factory RestaurantListModel.fromJson(Map<String, dynamic> json) =>
      RestaurantListModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "type": type,
      };
}

class Item {
  Item({
    required this.id,
    required this.slno,
    required this.geoLocation,
    required this.type,
    required this.title,
    required this.img,
    required this.logo,
    required this.description,
    required this.distance,
    required this.distanceOnly,
    required this.time,
    required this.status,
    required this.rating,
    required this.recentOrder,
    required this.ratingCount,
    required this.offer,
    required this.isOffer,
    required this.offerUpto,
    required this.offerDescription,
    required this.showOfferBadge,
    required this.rounded,
    required this.storeChainId,
    required this.imageHeight,
    required this.imageWidth,
    required this.logoImageHeight,
    required this.logoImageWidth,
  });

  final String id;
  final String slno;
  final String geoLocation;
  final String type;
  final String title;
  final String img;
  final String logo;
  final String description;
  final String distance;
  final double distanceOnly;
  final String time;
  final String status;
  final String rating;
  final int recentOrder;
  final String ratingCount;
  final dynamic offer;
  final int isOffer;
  final String offerUpto;
  final String offerDescription;
  final bool showOfferBadge;
  final bool rounded;
  final String storeChainId;
  final dynamic imageHeight;
  final dynamic imageWidth;
  final dynamic logoImageHeight;
  final dynamic logoImageWidth;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        slno: json["slno"],
        geoLocation: json["geo_location"],
        type: json["type"],
        title: json["title"],
        img: json["img"],
        logo: json["logo"],
        description: json["description"],
        distance: json["distance"],
        distanceOnly: json["distance_only"].toDouble(),
        time: json["time"],
        status: json["status"],
        rating: json["rating"],
        recentOrder: json["recent_order"],
        ratingCount: json["rating_count"],
        offer: json["offer"],
        isOffer: json["is_offer"],
        offerUpto: json["offerUpto"],
        offerDescription: json["offerDescription"],
        showOfferBadge: json["showOfferBadge"],
        rounded: json["rounded"],
        storeChainId: json["store_chain_id"],
        imageHeight: json["image_height"],
        imageWidth: json["image_width"],
        logoImageHeight: json["logo_image_height"],
        logoImageWidth: json["logo_image_width"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slno": slno,
        "geo_location": geoLocation,
        "type": type,
        "title": title,
        "img": img,
        "logo": logo,
        "description": description,
        "distance": distance,
        "distance_only": distanceOnly,
        "time": time,
        "status": status,
        "rating": rating,
        "recent_order": recentOrder,
        "rating_count": ratingCount,
        "offer": offer,
        "is_offer": isOffer,
        "offerUpto": offerUpto,
        "offerDescription": offerDescription,
        "showOfferBadge": showOfferBadge,
        "rounded": rounded,
        "store_chain_id": storeChainId,
        "image_height": imageHeight,
        "image_width": imageWidth,
        "logo_image_height": logoImageHeight,
        "logo_image_width": logoImageWidth,
      };
}

// enum OfferDescription { EMPTY, THE_10_OFF_UPTO_500, THE_30_OFF_UPTO_5000, THE_5_OFF_UPTO_500, BUY_1_GET_1_FREE }

// final offerDescriptionValues = EnumValues({
//     "Buy 1 get 1Free": OfferDescription.BUY_1_GET_1_FREE,
//     "": OfferDescription.EMPTY,
//     "10% off upto 500": OfferDescription.THE_10_OFF_UPTO_500,
//     "30% off upto 5000": OfferDescription.THE_30_OFF_UPTO_5000,
//     "5% off upto 500": OfferDescription.THE_5_OFF_UPTO_500
// });

// enum Status { OPEN, CLOSED }

// final statusValues = EnumValues({
//     "closed": Status.CLOSED,
//     "open": Status.OPEN
// });

// enum Type { RESTAURANT }

// final typeValues = EnumValues({
//     "restaurant": Type.RESTAURANT
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         reverseMap = map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }
