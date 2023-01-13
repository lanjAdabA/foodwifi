// To parse this JSON data, do
//
//     final foodwifidashmodel = foodwifidashmodelFromJson(jsonString);

import 'dart:convert';

List<Foodwifidashmodel> foodwifidashmodelFromJson(String str) =>
    List<Foodwifidashmodel>.from(
        json.decode(str).map((x) => Foodwifidashmodel.fromJson(x)));

String foodwifidashmodelToJson(List<Foodwifidashmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Foodwifidashmodel {
  Foodwifidashmodel({
    required this.id,
    required this.timeDistanceSameLine,
    required this.showFavourite,
    required this.type,
    required this.size,
    required this.rows,
    required this.title,
    required this.description,
    required this.sideBySide,
    required this.textOverlay,
    required this.image,
    required this.rounded,
    required this.startingIn,
    required this.titleOnly,
    required this.autoplay,
    required this.hasMore,
    required this.imageHeight,
    required this.imageWidth,
    required this.items,
  });

  final int id;
  final bool timeDistanceSameLine;
  final bool showFavourite;
  final String type;
  final String size;
  final String rows;
  final String title;
  final String description;
  final bool sideBySide;
  final bool textOverlay;
  final String image;
  final bool rounded;
  final int startingIn;
  final bool titleOnly;
  final bool autoplay;
  final bool hasMore;
  final String imageHeight;
  final String imageWidth;
  final List<List<Item>> items;

  factory Foodwifidashmodel.fromJson(Map<String, dynamic> json) =>
      Foodwifidashmodel(
        id: json["id"],
        timeDistanceSameLine: json["time_distance_same_line"],
        showFavourite: json["show_favourite"],
        type: json["type"],
        size: json["size"],
        rows: json["rows"],
        title: json["title"],
        description: json["description"],
        sideBySide: json["sideBySide"],
        textOverlay: json["textOverlay"],
        image: json["image"],
        rounded: json["rounded"],
        startingIn: json["startingIn"],
        titleOnly: json["title_only"],
        autoplay: json["autoplay"],
        hasMore: json["hasMore"],
        imageHeight: json["image_height"],
        imageWidth: json["image_width"],
        items: List<List<Item>>.from(json["items"]
            .map((x) => List<Item>.from(x.map((x) => Item.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "time_distance_same_line": timeDistanceSameLine,
        "show_favourite": showFavourite,
        "type": type,
        "size": size,
        "rows": rows,
        "title": title,
        "description": description,
        "sideBySide": sideBySide,
        "textOverlay": textOverlay,
        "image": image,
        "rounded": rounded,
        "startingIn": startingIn,
        "title_only": titleOnly,
        "autoplay": autoplay,
        "hasMore": hasMore,
        "image_height": imageHeight,
        "image_width": imageWidth,
        "items": List<dynamic>.from(
            items.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class Item {
  Item({
    required this.img,
    required this.type,
    required this.id,
    required this.keyword,
    required this.title,
    required this.centerText,
    required this.description,
    required this.placeholderColor,
    required this.distance,
    required this.time,
    required this.rating,
    required this.offer,
    required this.offerUpto,
    required this.offerDescription,
    required this.showOfferBadge,
    required this.topBadge,
    required this.ratingCount,
    required this.freeDelivery,
    required this.promotion,
    required this.promotionColor,
  });

  final String img;
  final Type type;
  final String id;
  final String keyword;
  final String title;
  final bool centerText;
  final String description;
  final String placeholderColor;
  final String distance;
  final String time;
  final String rating;
  final dynamic offer;
  final String offerUpto;
  final String offerDescription;
  final bool showOfferBadge;
  final bool topBadge;
  final int ratingCount;
  final bool freeDelivery;
  final String promotion;
  final String promotionColor;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        img: json["img"],
        type: json["type"],
        id: json["id"],
        keyword: json["keyword"],
        title: json["title"],
        centerText: json["centerText"],
        description: json["description"],
        placeholderColor: json["placeholder_color"],
        distance: json["distance"],
        time: json["time"],
        rating: json["rating"],
        offer: json["offer"],
        offerUpto: json["offerUpto"],
        offerDescription: json["offerDescription"],
        showOfferBadge: json["showOfferBadge"],
        topBadge: json["topBadge"],
        ratingCount: json["ratingCount"],
        freeDelivery: json["freeDelivery"],
        promotion: json["promotion"],
        promotionColor: json["promotion_color"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "type": type,
        "id": id,
        "keyword": keyword,
        "title": title,
        "centerText": centerText,
        "description": description,
        "placeholder_color": placeholderColor,
        "distance": distance,
        "time": time,
        "rating": rating,
        "offer": offer,
        "offerUpto": offerUpto,
        "offerDescription": offerDescription,
        "showOfferBadge": showOfferBadge,
        "topBadge": topBadge,
        "ratingCount": ratingCount,
        "freeDelivery": freeDelivery,
        "promotion": promotion,
        "promotion_color": promotionColor,
      };
}

// enum OfferDescription { THE_15_OFF_UPTO_1000, THE_10_OFF_UPTO_500, THE_5_OFF_UPTO_500, EMPTY }

// final offerDescriptionValues = EnumValues({
//     "": OfferDescription.EMPTY,
//     "10% off upto 500": OfferDescription.THE_10_OFF_UPTO_500,
//     "15% off upto 1000": OfferDescription.THE_15_OFF_UPTO_1000,
//     "5% off upto 500": OfferDescription.THE_5_OFF_UPTO_500
// });

// enum PromotionColor { THE_591_D1_D }

// final promotionColorValues = EnumValues({
//     "#591d1d": PromotionColor.THE_591_D1_D
// });

// enum Type { STORE_TYPE, NEARBY, SEARCH, RESTAURANT }

// final typeValues = EnumValues({
//     "nearby": Type.NEARBY,
//     "restaurant": Type.RESTAURANT,
//     "search": Type.SEARCH,
//     "store_type": Type.STORE_TYPE
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String>? reverseMap;

//     EnumValues(this.map);

//     Map<T, String>? get reverse {
//         reverseMap ??= map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }
