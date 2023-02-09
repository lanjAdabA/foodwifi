// To parse this JSON data, do
//
//     final productdetail = productdetailFromJson(jsonString);

//! model for item/productDetail Page
import 'dart:convert';

ProductDetailModel productdetailFromJson(String str) =>
    ProductDetailModel.fromJson(json.decode(str));

String productdetailToJson(ProductDetailModel data) =>
    json.encode(data.toJson());

class ProductDetailModel {
  ProductDetailModel({
    required this.details,
    required this.images,
    required this.isStock,
    required this.variants,
  });

  final Details details;
  final List<ImageList> images;
  final bool isStock;
  final List<Variant> variants;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        details: Details.fromJson(json["details"]),
        images: List<ImageList>.from(
            json["images"].map((x) => ImageList.fromJson(x))),
        isStock: json["is_stock"],
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "details": details.toJson(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "is_stock": isStock,
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
      };
}

class Details {
  Details({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.image,
    required this.mobileImage,
    required this.markup,
    required this.stock,
    required this.foodtagName,
    required this.foodTagImage,
  });

  final String id;
  final String name;
  final String type;
  final String description;
  final String? image;
  final String mobileImage;
  final String markup;
  final bool stock;
  final String? foodtagName;
  final String? foodTagImage;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        description: json["description"],
        image: json["image"] == null ? null : json["image"],
        mobileImage: json["mobile_image"],
        markup: json["markup"],
        stock: json["stock"],
        foodtagName: json["foodtag_name"] == null ? null : json["foodtag_name"],
        foodTagImage:
            json["food_tag_image"] == null ? null : json["food_tag_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "description": description,
        "image": image,
        "mobile_image": mobileImage,
        "markup": markup,
        "stock": stock,
        "foodtag_name": foodtagName,
        "food_tag_image": foodTagImage,
      };
}

class ImageList {
  ImageList({
    required this.img,
  });

  final String? img;

  factory ImageList.fromJson(Map<String, dynamic> json) =>
      ImageList(img: json["img"] == null ? null : json["img"]);

  Map<String, dynamic> toJson() => {
        "img": img,
      };
}

class Variant {
  Variant({
    required this.id,
    required this.unit,
    required this.price,
    required this.stock,
    required this.costPrice,
    required this.isOffer,
    required this.offerPrice,
    required this.description,
    required this.offerType,
    required this.restPrice,
  });

  final int id;
  final String unit;
  final int price;
  final bool stock;
  final int costPrice;
  final bool isOffer;
  final int offerPrice;
  final String description;
  final String offerType;
  final int restPrice;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        unit: json["unit"],
        price: json["price"],
        stock: json["stock"],
        costPrice: json["cost_price"],
        isOffer: json["is_offer"],
        offerPrice: json["offerPrice"],
        description: json["description"],
        offerType: json["offerType"],
        restPrice: json["restPrice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "unit": unit,
        "price": price,
        "stock": stock,
        "cost_price": costPrice,
        "is_offer": isOffer,
        "offerPrice": offerPrice,
        "description": description,
        "offerType": offerType,
        "restPrice": restPrice,
      };
}
