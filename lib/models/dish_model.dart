import 'package:restaurant_menu_app/models/enums/meal_categories.dart';
import 'package:restaurant_menu_app/models/enums/meal_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dish_model.g.dart';

@JsonSerializable()
class DishModel {
  String? id;
  String? name;
  String? description;
  String? price;
  MealCategories? mealCategory;
  MealType? mealType;
  bool? isAvailable;
  int? waitingTimeInMinutes;

  DishModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.mealCategory,
    this.mealType,
    this.isAvailable,
    this.waitingTimeInMinutes,
  });

  factory DishModel.fromJson(Map<String, dynamic> json) =>
      _$DishModelFromJson(json);

  Map<String, dynamic> toJson() => _$DishModelToJson(this);
}
