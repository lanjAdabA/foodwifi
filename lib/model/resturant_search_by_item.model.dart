// To parse this JSON data, do
//
//     final resturantSearchByItem = resturantSearchByItemFromJson(jsonString);

import 'dart:convert';

List<ResturantSearchByItemModel> resturantSearchByItemFromJson(String str) =>
    List<ResturantSearchByItemModel>.from(
        json.decode(str).map((x) => ResturantSearchByItemModel.fromJson(x)));

String resturantSearchByItemToJson(List<ResturantSearchByItemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResturantSearchByItemModel {
  ResturantSearchByItemModel({
    required this.id,
    required this.slno,
    required this.type,
    required this.title,
    required this.img,
    required this.description,
    required this.distanceOnly,
    required this.distance,
    required this.time,
    required this.rating,
    required this.offer,
    required this.offerUpto,
    required this.showOfferBadge,
    required this.topBadge,
    required this.items,
    required this.rounded,
  });

  final String id;
  final int slno;
  final String type;
  final String title;
  final String? img;
  final String description;
  final double distanceOnly;
  final String distance;
  final String time;
  final double rating;
  final int offer;
  final String offerUpto;
  final bool showOfferBadge;
  final String? topBadge;
  final List<Item> items;
  final bool rounded;

  factory ResturantSearchByItemModel.fromJson(Map<String, dynamic> json) =>
      ResturantSearchByItemModel(
        id: json["id"],
        slno: json["slno"],
        type: json["type"],
        title: json["title"],
        img: json["img"],
        description: json["description"],
        distanceOnly: json["distance_only"].toDouble(),
        distance: json["distance"],
        time: json["time"],
        rating: json["rating"].toDouble(),
        offer: json["offer"],
        offerUpto: json["offerUpto"],
        showOfferBadge: json["showOfferBadge"],
        topBadge: json["topBadge"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        rounded: json["rounded"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slno": slno,
        "type": type,
        "title": title,
        "img": img,
        "description": description,
        "distance_only": distanceOnly,
        "distance": distance,
        "time": time,
        "rating": rating,
        "offer": offer,
        "offerUpto": offerUpto,
        "showOfferBadge": showOfferBadge,
        "topBadge": topBadge,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "rounded": rounded,
      };
}

class Item {
  Item({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.offerPrice,
    required this.isOffer,
  });

  final int productId;
  final String name;
  final String? image;
  final double price;
  final double offerPrice;
  final bool isOffer;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        productId: json["product_id"],
        name: json["name"],
        image: json["image"],
        price: json["price"].toDouble(),
        offerPrice: json["offerPrice"].toDouble(),
        isOffer: json["is_offer"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "image": image,
        "price": price,
        "offerPrice": offerPrice,
        "is_offer": isOffer,
      };
}

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
