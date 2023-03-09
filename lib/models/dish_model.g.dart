// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishModel _$DishModelFromJson(Map<String, dynamic> json) => DishModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      mealCategory:
          $enumDecodeNullable(_$MealCategoriesEnumMap, json['mealCategory']),
      mealType: $enumDecodeNullable(_$MealTypeEnumMap, json['mealType']),
      isAvailable: json['isAvailable'] as bool?,
      waitingTimeInMinutes: json['waitingTimeInMinutes'] as int?,
    );

Map<String, dynamic> _$DishModelToJson(DishModel instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'mealCategory': _$MealCategoriesEnumMap[instance.mealCategory],
      'mealType': _$MealTypeEnumMap[instance.mealType],
      'isAvailable': instance.isAvailable,
      'waitingTimeInMinutes': instance.waitingTimeInMinutes,
    };

const _$MealCategoriesEnumMap = {
  MealCategories.appetizer: 'appetizer',
  MealCategories.entree: 'entree',
  MealCategories.dessert: 'dessert',
  MealCategories.beverage: 'beverage',
};

const _$MealTypeEnumMap = {
  MealType.breakfast: 'breakfast',
  MealType.brunch: 'brunch',
  MealType.lunch: 'lunch',
  MealType.happyHour: 'happyHour',
  MealType.dinner: 'dinner',
};
