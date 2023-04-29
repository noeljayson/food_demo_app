// To parse this JSON data, do
//
//     final foodModel = foodModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<FoodModel> foodModelFromMap(String str) =>
    List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromMap(x)));

String foodModelToMap(List<FoodModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class FoodModel {
  String restaurantId;
  String restaurantName;

  String tableId;
  String tableName;
  String branchName;

  List<TableMenuList> tableMenuList;

  FoodModel({
    required this.restaurantId,
    required this.restaurantName,
    required this.tableId,
    required this.tableName,
    required this.branchName,
    required this.tableMenuList,
  });

  factory FoodModel.fromMap(Map<String, dynamic> json) => FoodModel(
        restaurantId: json["restaurant_id"] ?? "",
        restaurantName: json["restaurant_name"] ?? "",
        tableId: json["table_id"] ?? "",
        tableName: json["table_name"] ?? "",
        branchName: json["branch_name"] ?? "",
        tableMenuList: List<TableMenuList>.from(
            json["table_menu_list"].map((x) => TableMenuList.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "restaurant_id": restaurantId,
        "restaurant_name": restaurantName,
        "table_id": tableId,
        "table_name": tableName,
        "branch_name": branchName,
        "table_menu_list":
            List<dynamic>.from(tableMenuList.map((x) => x.toMap())),
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

  factory TableMenuList.fromMap(Map<String, dynamic> json) => TableMenuList(
        menuCategory: json["menu_category"] ?? "",
        menuCategoryId: json["menu_category_id"] ?? "",
        categoryDishes: List<CategoryDish>.from(
            json["category_dishes"].map((x) => CategoryDish.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "menu_category": menuCategory,
        "menu_category_id": menuCategoryId,
        "category_dishes":
            List<dynamic>.from(categoryDishes.map((x) => x.toMap())),
      };
}

class CategoryDish {
  String dishId;
  String dishName;
  double dishPrice;

  double dishCalories;
  String dishDescription;

  CategoryDish({
    required this.dishId,
    required this.dishName,
    required this.dishPrice,
    required this.dishCalories,
    required this.dishDescription,
  });

  factory CategoryDish.fromMap(Map<String, dynamic> json) => CategoryDish(
        dishId: json["dish_id"] ?? "",
        dishName: json["dish_name"] ?? "",
        dishPrice: json["dish_price"].toDouble()??0.0,
        dishCalories: json["dish_calories"] .toDouble()??0.0,
        dishDescription: json["dish_description"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "dish_id": dishId,
        "dish_name": dishName,
        "dish_price": dishPrice,
        "dish_calories": dishCalories,
        "dish_description": dishDescription,
      };
}
