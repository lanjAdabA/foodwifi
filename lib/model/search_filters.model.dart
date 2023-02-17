import 'dart:convert';

SearchFilterModel SearchFilterModelFromJson(String str) =>
    SearchFilterModel.fromJson(json.decode(str));

String SearchFilterModelToJson(SearchFilterModel data) =>
    json.encode(data.toJson());

class SearchFilterModel {
  SearchFilterModel({
    required this.sortOptions,
    required this.cuisines,
    required this.storeTypes,
  });

  final List<SortOption> sortOptions;
  final List<Cuisine> cuisines;
  final List<StoreType> storeTypes;

  factory SearchFilterModel.fromJson(Map<String, dynamic> json) =>
      SearchFilterModel(
        sortOptions: List<SortOption>.from(
            json["sort_options"].map((x) => SortOption.fromJson(x))),
        cuisines: List<Cuisine>.from(
            json["cuisines"].map((x) => Cuisine.fromJson(x))),
        storeTypes: List<StoreType>.from(
            json["store_types"].map((x) => StoreType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sort_options": List<dynamic>.from(sortOptions.map((x) => x.toJson())),
        "cuisines": List<dynamic>.from(cuisines.map((x) => x.toJson())),
        "store_types": List<dynamic>.from(storeTypes.map((x) => x.toJson())),
      };
}

class Cuisine {
  Cuisine({
    required this.id,
    required this.cuisineName,
  });

  final int id;
  final String cuisineName;

  factory Cuisine.fromJson(Map<String, dynamic> json) => Cuisine(
        id: json["id"],
        cuisineName: json["cuisine_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cuisine_name": cuisineName,
      };
}

class SortOption {
  SortOption({
    required this.id,
    required this.name,
    required this.icon,
  });

  final int id;
  final String name;
  final String icon;

  factory SortOption.fromJson(Map<String, dynamic> json) => SortOption(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
      };
}

class StoreType {
  StoreType({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory StoreType.fromJson(Map<String, dynamic> json) => StoreType(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
