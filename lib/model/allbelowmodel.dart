// To parse this JSON data, do
//
//     final reviewModalModified = reviewModalModifiedFromJson(jsonString);

import 'dart:convert';

List<ReviewModalModified> reviewModalModifiedFromJson(String str) =>
    List<ReviewModalModified>.from(
        json.decode(str).map((x) => ReviewModalModified.fromJson(x)));

String reviewModalModifiedToJson(List<ReviewModalModified> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReviewModalModified {
  ReviewModalModified({
    required this.categoryId,
    required this.stock,
    required this.categoryName,
    required this.reviewdata,
    required this.products,
  });

  final int categoryId;
  final bool stock;
  final String categoryName;
  final Reviewdata? reviewdata;
  final List<Product> products;

  factory ReviewModalModified.fromJson(Map<String, dynamic> json) =>
      ReviewModalModified(
        categoryId: json["category_id"],
        stock: json["stock"],
        categoryName: json["category_name"],
        reviewdata: json["reviewdata"] == null
            ? null
            : Reviewdata.fromJson(json["reviewdata"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "stock": stock,
        "category_name": categoryName,
        "reviewdata": reviewdata!.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.stock,
    required this.isOffer,
    required this.offerType,
    required this.offer,
    required this.price,
    required this.img,
    required this.type,
    required this.description,
    required this.tags,
    required this.customizable,
  });

  final int? id;
  final String? name;
  final bool? stock;
  final bool? isOffer;
  final String? offerType;
  final Offer? offer;
  final int? price;
  final String? img;
  final String? type;
  final String? description;
  final List<dynamic>? tags;
  final bool? customizable;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        stock: json["stock"],
        isOffer: json["is_offer"],
        offerType: json["offer_type"],
        offer: Offer.fromJson(json["offer"]),
        price: json["price"],
        img: json["img"],
        type: json["type"],
        description: json["description"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        customizable: json["customizable"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "stock": stock,
        "is_offer": isOffer,
        "offer_type": offerType,
        "offer": offer!.toJson(),
        "price": price,
        "img": img,
        "type": type,
        "description": description,
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "customizable": customizable,
      };
}

class Offer {
  Offer({
    required this.offerPc,
    required this.description,
    required this.offerUpto,
    required this.offerPrice,
  });

  final dynamic offerPc;
  final String? description;
  final String? offerUpto;
  final double? offerPrice;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        offerPc: json["offerPc"],
        description: json["description"],
        offerUpto: json["offerUpto"],
        offerPrice: json["offerPrice"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "offerPc": offerPc,
        "description": description,
        "offerUpto": offerUpto,
        "offerPrice": offerPrice,
      };
}

class Reviewdata {
  Reviewdata({
    required this.rating,
    required this.ratingCount,
    required this.review,
  });

  final double rating;
  final String ratingCount;
  final List<Review> review;

  factory Reviewdata.fromJson(Map<String, dynamic> json) => Reviewdata(
        rating: json["rating"]?.toDouble(),
        ratingCount: json["rating_count"],
        review:
            List<Review>.from(json["review"].map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "rating_count": ratingCount,
        "review": List<dynamic>.from(review.map((x) => x.toJson())),
      };
}

class Review {
  Review({
    required this.name,
    required this.rating,
    required this.description,
    required this.createdDate,
  });

  final String name;
  final String rating;
  final String? description;
  final DateTime createdDate;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        name: json["name"],
        rating: json["rating"],
        description: json["description"],
        createdDate: DateTime.parse(json["created_date"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rating": rating,
        "description": description,
        "created_date": createdDate.toIso8601String(),
      };
}
