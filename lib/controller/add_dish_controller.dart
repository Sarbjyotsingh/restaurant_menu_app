import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_menu_app/controller/menu_controller.dart';
import 'package:restaurant_menu_app/models/dish_model.dart';
import 'package:restaurant_menu_app/models/enums/meal_categories.dart';
import 'package:restaurant_menu_app/models/enums/meal_type.dart';

/// Provider that manages the adding Dish to the menu.
final addDishProvider =
    StateNotifierProvider.autoDispose<AddDishControllerNotifier, DishModel>(
  (ref) => AddDishControllerNotifier(ref),
);

class AddDishControllerNotifier extends StateNotifier<DishModel> {
  final ref;
  AddDishControllerNotifier(this.ref) : super(DishModel());

  /// For editing existing Dish.
  void setInitValue(DishModel dish) async {
    // Update the state of the provider
    state = dish;
  }

  /// Update Availability of Dish.
  void onChangeAvailability() async {
    // Update the state of the provider
    state = state.copyWith(isAvailable: !state.isAvailable);
  }

  /// Update Meal Type of Dish.
  void onChangeMealType(MealType mealType) async {
    // Update the state of the provider
    state = state.copyWith(mealType: mealType);
  }

  /// Update Meal Category of Dish.
  void onChangeMealCategory(MealCategories mealCategory) {
    // Update the state of the provider
    state = state.copyWith(mealCategory: mealCategory);
  }

  /// Add Dish to Menu
  void addDishToMenu({
    required String name,
    required String description,
    required double price,
    required int waitingTime,
  }) {
    // Add Dish to menu when item is not exiting in database
    if (state.id == null) {
      state = state.copyWith(
        name: name,
        description: description,
        price: price,
        waitingTimeInMinutes: waitingTime,
      );

      // Use addOrUpdateDishToMenu from Menu Controller
      ref.read(menuProvider.notifier).addDishToMenu(state);
    } else {
      // Update Dish to menu when item is exiting in database
      state = state.copyWith(
        name: name,
        description: description,
        price: price,
        waitingTimeInMinutes: waitingTime,
      );

      // Use addOrUpdateDishToMenu from Menu Controller
      ref.read(menuProvider.notifier).updateDishToMenu(state);
    }
  }
}
