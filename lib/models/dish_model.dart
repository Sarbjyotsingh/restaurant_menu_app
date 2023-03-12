import 'package:restaurant_menu_app/models/enums/meal_categories.dart';
import 'package:restaurant_menu_app/models/enums/meal_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dish_model.g.dart';

@JsonSerializable()
class DishModel {
  @JsonKey(name: '_id')
  final String? id;
  String? name;
  String? description;
  double? price;
  MealCategories? mealCategory;
  MealType? mealType;
  bool isAvailable;
  int? waitingTimeInMinutes;

  DishModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.mealCategory,
    this.mealType,
    this.isAvailable = true,
    this.waitingTimeInMinutes,
  });

  factory DishModel.fromJson(Map<String, dynamic> json) =>
      _$DishModelFromJson(json);

  Map<String, dynamic> toJson() => _$DishModelToJson(this);

  // copyWith Function to provide new object of DishModel with updated Value
  DishModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    MealCategories? mealCategory,
    MealType? mealType,
    bool? isAvailable,
    int? waitingTimeInMinutes,
  }) {
    return DishModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      mealCategory: mealCategory ?? this.mealCategory,
      mealType: mealType ?? this.mealType,
      isAvailable: isAvailable ?? this.isAvailable,
      waitingTimeInMinutes: waitingTimeInMinutes ?? this.waitingTimeInMinutes,
    );
  }
}
