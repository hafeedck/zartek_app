import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

List<ItemModel> itemModelFromJson(String str) =>
    List<ItemModel>.from(json.decode(str).map((x) => ItemModel.fromJson(x)));

String itemModelToJson(List<ItemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModel {
  String restaurantId;
  List<TableMenuList> tableMenuList;

  ItemModel({
    required this.restaurantId,
    required this.tableMenuList,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        restaurantId: json["restaurant_id"],
        tableMenuList: List<TableMenuList>.from(
            json["table_menu_list"].map((x) => TableMenuList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "restaurant_id": restaurantId,
        "table_menu_list":
            List<dynamic>.from(tableMenuList.map((x) => x.toJson())),
      };
}

class TableMenuList {
  String menuCategory;
  String menuCategoryId;
  List<CategoryDish> categoryDishes;

  TableMenuList({
    required this.menuCategory,
    required this.menuCategoryId,
    required this.categoryDishes,
  });

  factory TableMenuList.fromJson(Map<String, dynamic> json) => TableMenuList(
        menuCategory: json["menu_category"],
        menuCategoryId: json["menu_category_id"],
        categoryDishes: List<CategoryDish>.from(
            json["category_dishes"].map((x) => CategoryDish.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "menu_category": menuCategory,
        "menu_category_id": menuCategoryId,
        "category_dishes":
            List<dynamic>.from(categoryDishes.map((x) => x.toJson())),
      };
}

class CategoryDish {
  String dishId;
  String dishName;
  String dishImage;
  String dishDescription;
  String nexturl;
  RxInt qty;
  num dishType;
  num dishCalories;
  num dishPrice;
  List<AddonCat> addonCat;

  CategoryDish({
    required this.dishId,
    required this.dishName,
    required this.dishImage,
    required this.dishDescription,
    required this.qty,
    required this.nexturl,
    required this.dishType,
    required this.dishCalories,
    required this.dishPrice,
    required this.addonCat,
  });

  factory CategoryDish.fromJson(Map<String, dynamic> json) => CategoryDish(
        dishId: json["dish_id"],
        dishName: json["dish_name"],
        dishImage: json["dish_image"],
        dishDescription: json["dish_description"],
        nexturl: json["nexturl"],
        qty: json["qty"] ?? 0.obs,
        dishType: json["dish_Type"],
        dishCalories: json["dish_calories"],
        dishPrice: json["dish_price"],
        addonCat: json["addonCat"] == null
            ? []
            : List<AddonCat>.from(
                json["addonCat"].map((x) => AddonCat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dish_id": dishId,
        "dish_name": dishName,
        "dish_image": dishImage,
        "dish_description": dishDescription,
        "nexturl": nexturl,
        "dish_Type": dishType,
        "qty": qty,
        "dish_calories": dishCalories,
        "dish_price": dishPrice,
        "addonCat": List<dynamic>.from(addonCat.map((x) => x.toJson())),
      };
}

class AddonCat {
  String addonCategory;

  AddonCat({
    required this.addonCategory,
  });

  factory AddonCat.fromJson(Map<String, dynamic> json) => AddonCat(
        addonCategory: json["addon_category"],
      );

  Map<String, dynamic> toJson() => {
        "addon_category": addonCategory,
      };
}
