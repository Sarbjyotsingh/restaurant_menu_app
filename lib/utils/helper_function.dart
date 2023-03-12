import 'package:flutter/material.dart';
import 'package:restaurant_menu_app/models/enums/meal_categories.dart';
import 'package:restaurant_menu_app/utils/constants.dart';

/// Covert List Of Items to List of DropdownMenuItem
List<DropdownMenuItem> getListOfDropDownItemsFromEnum(List list) {
  List<DropdownMenuItem> items = [];
  items = list.map((item) {
    return DropdownMenuItem(
      value: item,
      child: Text(capitalizeString(item.toString())),
    );
  }).toList();
  return items;
}

/// Covert text into Capitalized Text
/// Example: 'helloWorld' to 'Hello World'
String capitalizeString(String text) {
  String tempText = text
      .split('.')
      .last
      .replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(0)}');
  return tempText.replaceFirst(tempText[0], tempText[0].toUpperCase());
}

/// Return Icon According to the Type of Dish
IconData getDishIcon(MealCategories? mealCategory) {
  switch (mealCategory) {
    case MealCategories.appetizer:
      return kAppetizerIcon;

    case MealCategories.entree:
      return kEntreeIcon;

    case MealCategories.dessert:
      return kDessertIcon;

    case MealCategories.beverage:
      return kBeverageIcon;

    default:
      return kEntreeIcon;
  }
}
